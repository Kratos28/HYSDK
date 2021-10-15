//
//  QF_NewSDKUserViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKUserViewController.h"
#import "QFNewSDKuserINfoViewController.h"
#import "QF_Tool.h"
#import "QFForgotViewController.h"
#import "QF_NewSDKNet.h"
#import "QFbindVC.h"
#import "QFmodifyBindVC.h"
#import "QFNewSDKAuthenticationViewController.h"
#import "QF_HZActivityIndicatorView.h"
@interface QFNewSDKUserViewController ()
@property (weak, nonatomic) IBOutlet UIButton *user;
@property (weak, nonatomic) IBOutlet UIButton *bangding;
@property (weak, nonatomic) IBOutlet UIButton *Modify;
@property (weak, nonatomic) IBOutlet UIButton *goback;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (nonatomic,strong) NSDictionary *userINfo;
@end

@implementation QFNewSDKUserViewController
- (IBAction)logoutClick:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:klogoutNotication object:nil];
    [self goback:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
      
      // 这些点的位置都是相对于所在视图的
      // 起点
      [polygonPath moveToPoint:CGPointMake(25, 10)];
      // 其他点
      [polygonPath addLineToPoint:CGPointMake(15, 20)];
      [polygonPath addLineToPoint:CGPointMake(25, 30)];
      
      //    [polygonPath closePath]; // 添加一个结尾点和起点相同
      
      CAShapeLayer *polygonLayer = [CAShapeLayer layer];
      polygonLayer.lineWidth = 3;
      polygonLayer.strokeColor = [UIColor whiteColor].CGColor;
      polygonLayer.path = polygonPath.CGPath;
      polygonLayer.fillColor = nil; // 默认为blackColor
      [self.goback.layer addSublayer:polygonLayer];
    
    
    
    
    [self.Modify setBackgroundImage:[QF_Tool QF_SetBundleImageName:@"imgPassword" bundleName:@"Bundle"] forState:UIControlStateNormal];


    [self.bangding setBackgroundImage:[QF_Tool QF_SetBundleImageName:@"other_7" bundleName:@"Bundle"] forState:UIControlStateNormal];

    
    [self.user setBackgroundImage:[QF_Tool QF_SetBundleImageName:@"realName_5" bundleName:@"Bundle"] forState:UIControlStateNormal];
    
    [self.logoutButton setBackgroundImage:[QF_Tool QF_SetBundleImageName:@"AA_logout_5" bundleName:@"Bundle"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}





- (void)uploadData
{
    NSDictionary *user = [QF_Tool QF_getUserInfo];
    
    
    NSString * access_token = user[@"access_token"];
    guard(access_token!= nil) else
    {
        return;;
    }
    
      NSString *url = [NSString stringWithFormat:@"%@/v1/api/user/token_login",GameTop];
    
    
    
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                access_token,@"access_token",nil];
    NSDictionary *tempdic = @{@"params":dic};
    [QF_HZActivityIndicatorView showLoading:@""];
      [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
          [QF_HZActivityIndicatorView hide];
          
          

          guard([responseObject[@"code"] intValue] == 0) else
          {
              [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
              return;;
          }
          
          
          NSDictionary *data = responseObject[@"data"] ;
          
          
          
          guard(data.count > 0) else
          {
              return;
          }
          self.UserName.text = [NSString stringWithFormat:@"账户ID:%@",data[@"user_name"]];
          self.userINfo = data;
          
          
      } failure:^(NSError * _Nonnull error) {

      }];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(uploadData) name:@"uploaduserData" object:nil];
    [self uploadData];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (IBAction)userClick:(id)sender {
    
    QFNewSDKAuthenticationViewController *cc =   [[QFNewSDKAuthenticationViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKAuthenticationViewController class]) bundle:[NSBundle bundleForClass:[QFNewSDKAuthenticationViewController class]]];
    if (@available(iOS 13.0, *)) {
          cc.modalPresentationStyle = UIModalPresentationFullScreen;
      }
    cc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:cc animated:false completion:nil];
}

- (IBAction)bangding:(id)sender {
    
    NSDictionary *indeapi = [QF_Tool QF_getUserInfo];
    guard(indeapi) else return;

    

    if ([indeapi[@"mobile_phone"] length] > 0) {
        
        
        
        QFmodifyBindVC *Register =  [[QFmodifyBindVC alloc]init];
        if (@available(iOS 13.0, *)) {
            Register.modalPresentationStyle = UIModalPresentationFullScreen;
          }
        Register.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:Register animated:false completion:nil];
        
    }else
    {
        
        QFbindVC *Register =  [[QFbindVC alloc]init];
        Register.isModifyBind = false;
        if (@available(iOS 13.0, *)) {
            Register.modalPresentationStyle = UIModalPresentationFullScreen;
          }
        Register.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:Register animated:false completion:nil];
   

    }
    
    

    
    
}
- (IBAction)modifyPassword:(id)sender {
    
    NSDictionary *indeapi = self.userINfo;
      guard(indeapi!=nil) else return;
    NSDictionary *user = indeapi;
      guard(user)else return;
    
    if ([user[@"mobile_phone"] length] == 0) {
        
             
            typeof(self) weakSelf = self;
          UIAlertController *ac =   [UIAlertController alertControllerWithTitle:@"由于您未绑定手机号，请先绑定手机，才能修改密码" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                   
               }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        QFbindVC *Register =  [[QFbindVC alloc]init];
        Register.isModifyBind = true;
           if (@available(iOS 13.0, *)) {
//                      Register.modalPresentationStyle = UIModalPresentationFullScreen;
           }
           Register.modalPresentationStyle = UIModalPresentationOverFullScreen;
           [weakSelf presentViewController:Register animated:false completion:nil];
                       
                         
    }];
    
    
    [ac addAction:cancel];
    [ac addAction:ok];
    [self presentViewController:ac animated:true completion:nil];
        return;
    }
    
    
    QFForgotViewController *Register =  [[QFForgotViewController alloc] initWithNibName:NSStringFromClass([QFForgotViewController class]) bundle:[NSBundle bundleForClass:[QFForgotViewController class]]];
    if (@available(iOS 13.0, *)) {
           Register.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    Register.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:Register animated:false completion:nil];
    
}
- (IBAction)goback:(id)sender {
    [self.view removeFromSuperview];
      [self removeFromParentViewController];
}


@end
