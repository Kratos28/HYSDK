//
//  QF_NewSDKPlatform.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "XJPlatform.h"
#import "QFNewSDKWindow.h"
#import "QF_Float.h"
#import "QF_Tool.h"
#import "QF_Option.h"
#import "IQKeyboardManager.h"
#import "QF_NewSDKNet.h"
#import "QFNewSDKUserViewController.h"
#import "QFNewSDKServiceViewController.h"
#import "QFNewSDKCopyLabelView.h"
#import "QFNewSDKAuthenticationViewController.h"
#import "QFNewSDKOfficialAccountsViewController.h"
#import <SafariServices/SafariServices.h>
#import "QF_HZActivityIndicatorView.h"
#import "QF_NewSDKOnlineTimeObject.h"
#import "QFReport.h"
#import "usercenterWebViewController.h"
#import "OKViewViewController.h"
#import "QF_IAPManager.h"
#import "OKVIewWindow.h"
@interface XJPlatform()
@property (nonatomic,strong)QFNewSDKWindow *windowM;
@property(nonatomic,strong)QF_Float *floatw;
@property(nonatomic,strong)NSTimer *timer_;
@property (nonatomic,strong)OKVIewWindow *okwindowM;

@end

@implementation XJPlatform




static XJPlatform *sharedSingleton;

//创建单例对象
+(instancetype)shared
{
    if (!sharedSingleton) {
           static dispatch_once_t onceToken;
           dispatch_once(&onceToken, ^{
               sharedSingleton = [[super allocWithZone:NULL] init];
           });
       }
       return sharedSingleton;
}


/**
 * 初始化参数
 * param gameID              游戏ID
 * param pkg                 游戏简称
 * * param delegate                 delegate
 * * param bundleName                 bundleName
 * * param vc                 VC
 *  param applePayCallBackUrl UserAgent
 *  * param Privacylink UserAgent
 */


- (void)setDelegate:(id<XJPlatformDelegate>)delegate
{
    _delegate = delegate;

}

- (void)setController:(UIViewController *)controller
{
    _controller = controller;
    [QF_Tool QF_setWeakVC:controller];

}


- (void)XJinitSDKWithGameID:(NSString *)gameId AndPKG:(NSString *)pkg AndGameKey:(NSString *)gameKey AndPayKey:(NSString *)payKey
{

    
    
    QF_Option *optionva =  [QF_Option share];
    optionva.QF_gameID = gameId;
    optionva.QF_CID = @"";
    optionva.QF_pkg = pkg;
    optionva.QF_bundleName = @"Bundle.bundle";
    optionva.QF_gameKey = gameKey;
    optionva.payKey = payKey;

    
    

    
    
    
    
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(XJlogOutFromGame) name:klogoutNotication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideWindow) name:khideWindowNotication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserInfo__:) name:kloginSueeces object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFloat) name:kshowFloat object:nil];


    [[IQKeyboardManager sharedManager]setEnable: true];
    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysHide;
    [IQKeyboardManager sharedManager].shouldShowToolbarPlaceholder = false;
    
        
   __weak typeof(self) weakSelf = self;
    [QFReport XJReportActionBlock:^(BOOL report)
    {
        [weakSelf getConfigInfo:^(NSDictionary *isgechild) {
            if (isgechild.count ==0) {
                //初始化不成功重新请求
                [weakSelf XJinitSDKWithGameID:gameId AndPKG:pkg AndGameKey:gameKey AndPayKey:payKey];
            }
        }];
    }];
    
    
    
    


    
}




- (void)getUserInfo__:(NSNotification *)note
{
    
    [self hideWindow];
    NSDictionary *mditc =  (NSDictionary *)note.object ;
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary:mditc];
    if (info != nil) {
        ///保存用户信息
        [QF_Tool QF_saveUserInfo:info];
    }
    
    
    [[QF_IAPManager shared]startManager];

 
    [self.delegate XJgetUserInfo:info];

    [QF_NewSDKOnlineTimeObject shared];
    [self showFloat];
    
    
}



- (void)QF_initigm:(void(^)(BOOL resut ,NSDictionary *info))result
{
        QF_Option *optionva =  [QF_Option share];

        NSMutableString *XJ_sss_XJ =  [NSMutableString stringWithFormat:@"%@%@",GameTop,@"/app/igm"];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                            optionva.QF_gameID,               @"gameid",
                            optionva.QF_pkg,                  @"pkg",
                            optionva.QF_bundleID,             @"bundle_id",
                            optionva.QF_CID,                  @"cid",
                            optionva.QF_idfa,                 @"idfa",
                            optionva.QF_sdkver,               @"sdkver",
                            optionva.QF_version,              @"version",
                            optionva.QF_exmodel,              @"exmodel",
                            @"1",                             @"rfapp",
                            @"1",                             @"inm",
                            @"1",                             @"force",
                            @"1",                             @"wxjbtoapp",
                            nil];

    
    
    
    [QF_NewSDKNet QF_requestWithURLString:XJ_sss_XJ parameters:dic type:HttpRequestTypePost success:^(id  _Nonnull response) {
        NSDictionary *dct = response[@"data"];
           if ([dct isKindOfClass: [NSDictionary class]]) {
                  if (dct !=nil) {
                      if (dct[@"SDKInit"] !=nil) {
                          if ([dct[@"SDKInit"] intValue] == 1 )
                          {
                                            [QF_Tool QF_saveCallBack:@{@"SDKInit":@"1",@"status":@"1"}];
                                            result([QF_Tool QF_getCallback],dct);
                                            return;
                                        }else
                                        {
                                            [QF_Tool QF_saveCallBack:@{@"SDKInit":@"0",@"status":@"0"}];
                                            result([QF_Tool QF_getCallback],dct);
                                            return;
                                            
                                        }
                      }
                   }
                       result(false,dct);
              }
    } failure:^(NSError * _Nonnull error) {
        [QF_Tool QF_saveCallBack:@{@"SDKInit":@"0",@"status":@"0"}];
        result([QF_Tool QF_getCallback],@{});
    }];
    

        
}


- (void)getConfigInfo:(void(^)(NSDictionary *dict))result
{
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/config",GameTop];
    NSString *timeStr = [QF_Tool QF_getNowTimeTimestamp];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                timeStr,@"time",nil];
    NSDictionary *tempdic = @{@"params":dic};
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        NSInteger code = [responseObject[@"code"] integerValue];
        if (code == 0) {
            result(responseObject[@"data"]);
            [QF_Tool QF_SaveInitInfo:responseObject];
        }
        else{
              result(@{});
            [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
//              [TYProgressHUD showMessage:responseObject[@"message"] isSuccess:2];
          }
    
    } failure:^(NSError * _Nonnull error) {
        result(@{});
    }];
 
}



/**
 * 显示登录界面
 */
- (void)XJshowLoginView
{

    
    
    

    [QF_NewSDKOnlineTimeObject clearTimer];
       self.floatw.hidden = true;
       
       [self.self.floatw removeFromSuperview];
       self.self.floatw =nil;
       
       [QF_Tool QF_deleateUserInfo];
    [QF_Tool QF_deleatelogindapi];
    
    

    
    self.windowM = [[QFNewSDKWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];


}


- (void)showFloat
{
    __weak typeof(self) weakSelf = self;
        [self.floatw removeFromSuperview];
        self.floatw = nil;
        self.floatw = [[QF_Float alloc] QF_initMenu];
        self.floatw.clickBolcks = ^(NSInteger i,NSString *currentTitle,QF_Float *floatW) {
        if ([currentTitle isEqualToString:@"用户"]) {
            //用户中心
            
            QFNewSDKUserViewController *qf =  [[QFNewSDKUserViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKUserViewController class]) bundle:[NSBundle bundleForClass:[QFNewSDKUserViewController class]]];
                      [[QF_Tool QF_weakVC].view addSubview:qf.view];
                      [[QF_Tool QF_weakVC] addChildViewController:qf];
                      qf.view.frame = [QF_Tool QF_weakVC].view.frame;
            
        }else if ([currentTitle isEqualToString:@"客服"])
        {
            QFNewSDKServiceViewController *qf =  [[QFNewSDKServiceViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKServiceViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKServiceViewController class]]];
                             [[QF_Tool QF_weakVC].view addSubview:qf.view];
                             [[QF_Tool QF_weakVC] addChildViewController:qf];
                             qf.view.frame = [QF_Tool QF_weakVC].view.frame;
        
            
        }else if ([currentTitle isEqualToString:@"礼包"])
        {
            QFNewSDKOfficialAccountsViewController *qf =  [[QFNewSDKOfficialAccountsViewController alloc] initWithNibName:NSStringFromClass([QFNewSDKOfficialAccountsViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKOfficialAccountsViewController class]]];
            [[QF_Tool QF_weakVC].view addSubview:qf.view];
            [[QF_Tool QF_weakVC] addChildViewController:qf];
            qf.view.frame = [QF_Tool QF_weakVC].view.frame;

            
        }else if ([currentTitle isEqualToString:@"实名"])
        {
            
            NSDictionary *dcit =  [QF_Tool QF_getUserInfo];
            
            if ([dcit[@"verify_status"] isKindOfClass:[NSNull class]] == false && [dcit[@"verify_status"] intValue] == 1) {
                [QF_Tool QF_alertView:@"已实名认证" withcompletion:nil];
                return;
            }
            
         
            
            QFNewSDKAuthenticationViewController *qf =  [[QFNewSDKAuthenticationViewController alloc] initWithNibName:NSStringFromClass([QFNewSDKAuthenticationViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKAuthenticationViewController class]]];
            [[QF_Tool QF_weakVC].view addSubview:qf.view];
            [[QF_Tool QF_weakVC] addChildViewController:qf];
            qf.view.frame = [QF_Tool QF_weakVC].view.frame;

            
        }else if ([currentTitle isEqualToString:@"公众号"])
        {
           NSDictionary *dict =   [QF_Tool getaccountlogindapi];
            
            guard([dict[@"publicpic"] length] >0) else{
                return;
                
            }
            
            
            QFNewSDKOfficialAccountsViewController *qf =  [[QFNewSDKOfficialAccountsViewController alloc] initWithNibName:NSStringFromClass([QFNewSDKOfficialAccountsViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKOfficialAccountsViewController class]]];
                [[QF_Tool QF_weakVC].view addSubview:qf.view];
                [[QF_Tool QF_weakVC] addChildViewController:qf];
                qf.view.frame = [QF_Tool QF_weakVC].view.frame;
        }else if ([currentTitle isEqualToString:@"官网"])
        {
            
            NSDictionary *dict =   [QF_Tool getaccountlogindapi];
                     
                     guard([dict[@"officeweb"] length] >0) else{
                         return;
                         
                     }
            
            [weakSelf QF_userAgentclick:dict[@"officeweb"]];
        }
        
        else if ([currentTitle isEqualToString:@"退出"])
        {
//            [weakSelf QFlogoutFromGame];
        }
    };
    [[QF_Tool QF_weakVC].view addSubview:self.floatw];
    
    
    [self.floatw QF_showWindow_XJ];
}


- (void)QF_userAgentclick:(NSString *)string;
{
    NSString *str = string;
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
    NSURL *url = [NSURL URLWithString:str];
    if (@available(iOS 9.0, *)) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
            
            
            if (@available(iOS 13.0, *)) {
                    safariViewController.modalPresentationStyle = UIModalPresentationFullScreen;
                }
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:safariViewController animated:YES completion:^{
            }];
        }
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }
}

- (void)hideWindow
{
    self.windowM.hidden = true;
    [self.windowM resignKeyWindow];
    [self.windowM removeFromSuperview];
    self.windowM = nil;
}



///退出登录
- (void)XJlogOutFromGame
{
    
 


    
    [self XJRoleInfoReportWithInfo:nil AndType:RolelogoutReport];
    
    
 
    [self.delegate XJlogOut];

    [QF_NewSDKOnlineTimeObject clearTimer];
       self.floatw.hidden = true;
       [self.floatw removeFromSuperview];
       self.floatw =nil;
       
       UIViewController *vc = [QF_Tool QF_weakVC];
       [QF_Tool QF_deleateUserInfo];
    [QF_Tool QF_deleatelogindapi];
    [self hideWindow];
    
    
    self.windowM = [[QFNewSDKWindow alloc]initWithFrame:vc.view.bounds];
}

- (void)removewindow
{
 
    self.okwindowM.hidden =true;
    self.okwindowM = nil;
    
}


- (void)XJaddInAppPurcharseViewWithUserInfo:(NSDictionary *)roleinfo AndGoodsInfo:(NSDictionary *)purchaseInfo
{
//    
    __block bool s = false;
    [[[QF_Tool QF_weakVC] childViewControllers] enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:[OKViewViewController class]]) {
//                     [(OKViewViewController *)obj goback];
            s = true;
            *stop = true;
        }
        
    }];
    if (s == true) {
        return;;
    }
    
    [QF_HZActivityIndicatorView showLoading:@""];

    [[QF_IAPManager shared]QF_InAppPurcharseWithInfo:purchaseInfo withUserInfo:roleinfo Block:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        
        
        NSString *Type = dict[@"url"];
        NSString *order_id = dict[@"order_id"];
        if (order_id) {
            [QF_Option share].QF_outTradeNo = order_id;
            NSMutableDictionary *dci = [NSMutableDictionary dictionary];
            NSDictionary *userinfo = [QF_Tool QF_getUserInfo];
            [dci setObject:userinfo[@"access_token"] forKey:@"access_token"];
            [dci setObject:order_id forKey:@"order_id"];
            [dci setObject:[QF_Option share].QF_gameID forKey:@"game_id"];
            
            [[NSUserDefaults standardUserDefaults]setObject:dci forKey:userinfo[@"user_id"]];
            [[NSUserDefaults standardUserDefaults]synchronize];;


            
            }else{
            return ;
            }
        [QF_Option share].roleInfo =roleinfo;
        [QF_Option share].goodsInfo =purchaseInfo;
        //        //第三方支付
//        if (Type) {
//            [QF_HZActivityIndicatorView hide];
//            NSString *desStr = [NSString stringWithFormat:@"%@", purchaseInfo[@"product_desc"]];
//                  NSString *countStr = [NSString stringWithFormat:@"%.2f元", [purchaseInfo[@"product_price"] integerValue]/100.0];
//            NSString *orderStr = [NSString stringWithFormat:@"%@", order_id];
//            NSArray *array = dict[@"ways"];
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"removeokwindow" object:nil];
//            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removewindow) name:@"removeokwindow" object:nil];
//            OKVIewWindow *windows = [[OKVIewWindow alloc] initWithFrame:[QF_Tool QF_weakVC].view.frame];
//            windows.frame = [QF_Tool QF_weakVC].view.frame;
//            [windows setContentWithDes:desStr AndCount:countStr AndOrder:orderStr AndTypeInfo:array withRoleinifo:roleinfo order_id:order_id];
//            self.okwindowM = windows;
//            return;
//        }


        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:purchaseInfo];
        [mutableDic addEntriesFromDictionary:@{@"order_id":order_id}];
        [[QF_IAPManager shared]QF_PurchaseProduct:purchaseInfo[@"product_id"] QF_Success:^(NSString * _Nonnull invalidProductIdentifiers,NSDictionary *info)
        {
            

        } Kratos_failure:^(NSString * _Nonnull errormsg)
        {

        }];
        
    }];
}

- (void)XJinitWithSupport:(NSString *)supportStr Privacy:(NSString *)privacyStr
{
    QF_Option *optionva =  [QF_Option share];
    optionva.QF_userAgentLink = privacyStr;
    optionva.QF_supprotLimk = supportStr;
    
}

//保存截图
- (void)QF_PlatformscreenShots:(UIView *)view completionHandle:(void (^)(NSError *, NSString *))completionHandler
{
    [QF_Tool QF_screenShots:view completionHandle:completionHandler];
}





- (void)XJRoleInfoReportWithInfo:(NSDictionary *)info AndType:(RoleReportType)type
{
  
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    NSDictionary *userInfo = [QF_Tool   QF_getUserInfo];
    if (userInfo == nil) {
        return;
    }
    
    
    NSDictionary *tokenDic = nil;
    NSDictionary *user = nil;

    if ([userInfo isKindOfClass:[NSDictionary class]]) {
        tokenDic =  [[NSDictionary alloc]initWithObjectsAndKeys:userInfo[@"access_token"],@"access_token", nil];
        user = [[NSDictionary alloc]initWithObjectsAndKeys:
                userInfo[@"user_id"],@"user_id",
                userInfo[@"user_name"],@"user_name",
                userInfo[@"nick_name"],@"nick_name",
                userInfo[@"mobile_phone"],@"mobile_phone",
                userInfo[@"mobile_phone"],@"mobile_phone",
                nil];
        [mutableDic addEntriesFromDictionary:@{@"user":user}];

    }

    NSString *typeStr = @"";
    if (type == 0) {      //激活上报
        typeStr = @"active";
    }else if(type == 1){  //进入游戏上报
        typeStr = @"enter";
    }else if(type == 2){  //创角上报
        typeStr = @"create";
    }else if(type == 3){  //角色升级上报
        typeStr = @"levelup";
    }else if(type == 4){  //穿山甲之类的小游戏广告位数据
        typeStr = @"adFlows";
        NSDictionary *RoleInfo = @{@"event_type":@"",
                                   @"ad_code_id":@""};
        [mutableDic addEntriesFromDictionary:@{@"ad_flows":RoleInfo}];
    }else if (type == 5)
    {
        typeStr = @"logout";
    }
    
    else{
        typeStr = @"";
    }
    
    if (type != 0) {
        [mutableDic addEntriesFromDictionary:@{@"params":tokenDic}];
    }
    if (info !=nil) {
        [mutableDic addEntriesFromDictionary:@{@"role":info}];

    }
    
    
    NSString *URL = [NSString stringWithFormat:@"%@/v1/api/log/%@",GameTop,typeStr];

    NSDictionary *tempdic = nil;
    if (mutableDic.count == 0) {
        tempdic = @{};
    }else{
        tempdic = mutableDic;
    }
    [QF_NewSDKNet QF_requestWithURLString:URL parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        NSInteger code = [responseObject[@"code"] integerValue];
        if (code == 0) {
        }else{
            [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
        }
        
        
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    
}

@end
