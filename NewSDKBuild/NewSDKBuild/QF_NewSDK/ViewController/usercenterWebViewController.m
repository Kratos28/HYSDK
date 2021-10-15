//
//  usercenterWebViewController.m
//  HYNewSDK
//
//  Created by K on 2020/8/21.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "usercenterWebViewController.h"
#import <WebKit/WebKit.h>
#import "QF_Tool.h"
#import "NetParamTool.h"
#import "QF_Option.h"
@interface usercenterWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic,strong) WKWebView*webview;
@property (nonatomic,strong) UIButton *goBack;

@end

@implementation usercenterWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    UIView *view = [[UIView alloc] init];
    view.width = 320;
    view.height = 270;
    view.backgroundColor = [UIColor redColor];
    view.center = self.view.center;
    [self.view addSubview:view];
    
    

    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
       [configuration.userContentController addScriptMessageHandler:self name:@"getUserCenterSdkInfo"];
       [configuration.userContentController addScriptMessageHandler:self name:@"UserCenterJSNative"];
    self.webview = [[WKWebView alloc] initWithFrame: CGRectMake(0, 0, view.width, view.height) configuration:configuration];
    [view addSubview:self.webview];
    

    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://usercenter.cmaom.com/ndk/user/v2.0.1/index.html"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f];
      [self.webview loadRequest:request];
    
    
    [view addSubview:self.goBack];
    self.goBack.frame = CGRectMake(view.width - 30, 0, 30, 30);
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {

     if ([message.name isEqualToString:@"getUserCenterSdkInfo"]) {
         
         NSDictionary *userInfo = [QF_Tool QF_getUserInfo];
         NSDictionary *tokenDic = nil;
         if ([userInfo isKindOfClass:[NSDictionary class]]) {
             tokenDic = @{@"access_token":userInfo[@"access_token"]};
         }
         NSMutableDictionary *mustableDic = [NSMutableDictionary dictionaryWithDictionary:@{@"params":tokenDic}];
         [mustableDic addEntriesFromDictionary:[NetParamTool QFGetPlatformInfo]];
         [mustableDic addEntriesFromDictionary:[NetParamTool QFGetGameInfo]];
         [mustableDic addEntriesFromDictionary:[NetParamTool QFGetDeviceInfo]];
         [mustableDic addEntriesFromDictionary:[NetParamTool QFGetOtherInfo]];

         NSString *dicStr = [QF_Tool QFStringSortedWithDic:mustableDic];
         dicStr = [NSString stringWithFormat:@"%@%@",dicStr,[QF_Option share].QF_gameKey];
         NSString *signStr = [QF_Tool QF_md5:dicStr];
        
         NSDictionary *dic = @{@"key":[QF_Option share].QF_gameKey,
                               @"sign":signStr,
                               @"sdkInfo":mustableDic};
         NSString *strn = [QF_Tool QF_dictionaryToJson:dic];
         NSString *jsStr = [NSString stringWithFormat:@"%@(%@)",@"userCallback",strn];
         [self.webview evaluateJavaScript:jsStr completionHandler:^(id _Nullable item, NSError * _Nullable error) {
             NSLog(@"alert %@  error %@",item,error);
         }];
         
     }else if ([message.name isEqualToString:@"UserCenterJSNative"]){
         
         
     }else if ([message.name isEqualToString:@"callApp"]){
    
        
     }else if ([message.name isEqualToString:@"captureScreen"]){
                  
         
     }else {


     }
}
- (UIButton *)goBack{
    if (_goBack == nil) {
        _goBack = [[UIButton alloc] init];
        [_goBack setTitle:@"x" forState:UIControlStateNormal];
        [_goBack setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _goBack.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        [_goBack addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goBack;
}

- (void)goBackAction{
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}



@end
