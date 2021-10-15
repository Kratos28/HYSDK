//
//  QF_NewSDKServiceViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKServiceViewController.h"
#import <SafariServices/SafariServices.h>
#import "QFNewSDKTipViewController.h"
#import "QF_Tool.h"
#import "QF_NewSDKNet.h"
#import "QFNewSDKOfficialAccountsViewController.h"
#import "QF_Option.h"
#import "QF_HZActivityIndicatorView.h"
@interface QFNewSDKServiceViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QF_servicegobackBtn;
@property (weak, nonatomic) IBOutlet UIButton *dianhuakefu;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UIButton *onlineKefu;
@property (weak, nonatomic) IBOutlet UIButton *QQkefu;

@property (weak, nonatomic) IBOutlet UILabel *QQnumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *telNumberLabel;
@property (weak, nonatomic) IBOutlet UIView *qqkefubackground;
@property (weak, nonatomic) IBOutlet UIView *dianhuakefubackground;
@property (weak, nonatomic) IBOutlet UIView *onlineServerbackground;
@property (weak, nonatomic) IBOutlet UIImageView *qqImageView;
@property (weak, nonatomic) IBOutlet UIImageView *telImageView;
@property (weak, nonatomic) IBOutlet UIImageView *serverImageView;
@property (weak, nonatomic) IBOutlet UILabel *weichatButton;

@end

@implementation QFNewSDKServiceViewController


- (void)officialClick
{
      QFNewSDKOfficialAccountsViewController *qf =  [[QFNewSDKOfficialAccountsViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKOfficialAccountsViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKOfficialAccountsViewController class]]];
      qf.modalPresentationStyle = UIModalPresentationOverFullScreen;
      [self presentViewController:qf animated:true completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *dianhuatap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(QF_tel:)];
    [self.dianhuakefubackground addGestureRecognizer:dianhuatap];
    
    
    
    UITapGestureRecognizer *qqtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(QF_QQ:)];
    [self.qqkefubackground addGestureRecognizer:qqtap];
    
    
    

    
    
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
        
        // 这些点的位置都是相对于所在视图的
        // 起点
    [polygonPath moveToPoint:CGPointMake(25, 5)];
      [polygonPath addLineToPoint:CGPointMake(15, 15)];
      [polygonPath addLineToPoint:CGPointMake(25, 25)];
    
    //    [polygonPath closePath]; // 添加一个结尾点和起点相同
    
    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
    polygonLayer.lineWidth = 3;
    polygonLayer.strokeColor = [UIColor grayColor].CGColor;
    polygonLayer.path = polygonPath.CGPath;
    polygonLayer.fillColor = nil; // 默认为blackColor
//    [self.QF_servicegobackBtn.layer addSublayer:polygonLayer];
    
    [self.QF_servicegobackBtn setTitle:@"< 返回" forState:UIControlStateNormal];
    
    
   
    
//    self.dianhuakefubackground.hidden = YES;
//    self.qqkefubackground.hidden = YES;
//    self.onlineServerbackground.hidden = YES;
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(QF_QQ:)];
    [self.onlineServerbackground  addGestureRecognizer:tap];

    self.qqImageView.image =  [QF_Tool QF_SetBundleImageName:@"qqkefu" bundleName:@"Bundle"];
    self.telImageView.image =  [QF_Tool QF_SetBundleImageName:@"dianhuakefu" bundleName:@"Bundle"];
    self.serverImageView.image =  [QF_Tool QF_SetBundleImageName:@"zaixiankefu" bundleName:@"Bundle"];

    QF_Option *open =  [QF_Option share];
    
    
    NSString *timestamp = [QF_Tool QF_getNowTimeTimestamp];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 open.QF_gameID,@"game_id",timestamp,@"ts",nil];
        NSDictionary *tempdic = @{@"params":dic1};
    
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/get_customer_service",GameTop];
    [QF_HZActivityIndicatorView showLoading:@""];
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        [QF_HZActivityIndicatorView hide];
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *kf =  responseObject[@"data"];
            

            

            self.dianhuakefubackground.hidden = ![kf[@"tel"]length];
            self.QQnumberLabel.text = kf[@"qq"];
            self.telNumberLabel.text = kf[@"tel"];
            self.dianhuakefubackground.accessibilityLabel = kf[@"tel"];
            self.dianhuakefu.accessibilityLabel = [kf[@"tel"]length] ? kf[@"tel"]: @"";
            self.qqkefubackground.hidden = ![kf[@"qq"]length];
            self.qqkefubackground.accessibilityLabel = [kf[@"qq"]length] ? kf[@"qq"]: @"";
            self.QQkefu.accessibilityLabel = [kf[@"qq"]length] ? kf[@"qq"]: @"";
            self.onlineServerbackground.hidden = ![kf[@"oa"]length];
            self.onlineServerbackground.accessibilityLabel = [kf[@"oa"]length] ? kf[@"oa"]: @"";
            self.weichatButton.text =  [kf[@"oa"]length] ? kf[@"oa"]: @"";
            
            self.tipLabel.text = @"请通过以下方式联系客服";


            self.tipLabel.hidden = false;

     
            
            
        }
        
        

        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    NSDictionary *logindApi  =  [QF_Tool getaccountlogindapi];
       guard(logindApi) else return;
       NSDictionary *kf = logindApi[@"kf"];
       guard(kf) else return;
    
    
    
    
    

    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)QF_NewSdkGoBackClick:(id)sender {

    if (self.isForgotEnter  == true) {
        [self dismissViewControllerAnimated:false completion:nil];

    }else
    {
        [self.view removeFromSuperview];
           [self removeFromParentViewController];
    }
   
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}



- (IBAction)QF_QQ:(UITapGestureRecognizer *)sender {

    UIView *view = [sender view];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];

            
    pasteboard.string =  view.accessibilityLabel;
    [QF_Tool QF_alertView:@"复制成功" withcompletion:nil];
    
}
- (IBAction)QF_tel:(UITapGestureRecognizer *)sender {
    
    
    
    
    UIView *view = sender.view;
 
          
          

          
          NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",view.accessibilityLabel];
          
          if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:str]])
          {
              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

          }
          
        
          
      
    
    
    

}
- (IBAction)QF_online:(UIButton *)sender {
    
 
    NSURL *url = [NSURL URLWithString:sender.accessibilityLabel];
    if  ([[UIApplication sharedApplication]canOpenURL:url])
    {
        SFSafariViewController *sf = [[SFSafariViewController alloc]initWithURL:url];
        [self presentViewController:sf animated:true completion:nil];
    }
    
    
}



///用户注册协议
- (void)QF_NewSDKServiceURL:(NSString *)string;
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

@end
