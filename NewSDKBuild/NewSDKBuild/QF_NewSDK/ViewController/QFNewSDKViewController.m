//
//  QF_NewSDKViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKViewController.h"
#import "QFNewSDKAcountLogin.h"
#import "QF_PanoramaView.h"
#import "QF_NewSDKNet.h"
#import "QF_HZActivityIndicatorView.h"
#import "QF_MenuButton.h"
#import "QF_Option.h"
#import "QF_CountDownButton.h"
#import "QFForgotViewController.h"
#import <SafariServices/SafariServices.h>
#import "phoneRegiterView.h"
#import "UIView+IBinspectable.h"
#import "QFNewSDKServiceViewController.h"
#import "QFNewSDKAuthenticationViewController.h"

#define contentH 90

@interface QFNewSDKViewController () <HZMenuButtonDelegate>
@property (weak, nonatomic) IBOutlet UIButton *forgotpasswordButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKLogin;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKAutoRegister;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKPhoneLogin;
///账号登录框
@property (strong,nonatomic)QFNewSDKAcountLogin *QF_accountLoginView;
///一键注册登录框
@property (strong,nonatomic)QFNewSDKAcountLogin *QF_quickLoginView;
///手机号码登录框
@property (strong,nonatomic)phoneRegiterView *QF_phoneLoginView;
@property (nonatomic, strong) QF_PanoramaView *QF_weakPanoramaView;
@property (weak, nonatomic) IBOutlet UIView *QF_bgVIew;
@property (weak, nonatomic) IBOutlet UIButton *loginButtion;
@property (weak, nonatomic) IBOutlet UIButton *QF_supportUrlButton;
@property (weak, nonatomic) IBOutlet UIButton *QF_PrivacyButton;
@property (weak, nonatomic) IBOutlet UIButton *QF_forgotButton;

@property (nonatomic,strong) QF_CountDownButton *QF_RegistersendMsg;
@property (weak, nonatomic) IBOutlet UIButton *userprotocolbutton;

@property (weak, nonatomic) IBOutlet UIButton *agreemeetButton;
@property (copy,nonatomic) NSString *account;
@property (copy,nonatomic) NSString *password;

@property (nonatomic, assign) BOOL QF_isdisPlay;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation QFNewSDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//
    [self configButonStyle];
//    [self configPanoramaView];
    self.QF_bgVIew.layer.cornerRadius = 10;
    self.QF_bgVIew.layer.masksToBounds = true;

    

    
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self QF_NewSDKLoginClick:self.QF_NewSDKLogin];

    [self agreementClick: self.agreemeetButton];

}


- (void)closeButtonClick
{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    
//    
//    [UIView animateWithDuration:0.5f animations:^{
//
//        window.alpha =0;
//
//
//    } completion:^(BOOL finished) {
//
//    exit(0);
//
//    }];

}


-(void)viewWillAppear:(BOOL)animated{

    [self beginAppearanceTransition: YES animated: animated];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self endAppearanceTransition];


     [self.QF_weakPanoramaView QF_stopAnimating];
    [self.QF_weakPanoramaView QF_startAnimating];

}

#pragma mark 联系我们
- (IBAction)contactUsClick:(id)sender {
    QFNewSDKServiceViewController *cc =   [[QFNewSDKServiceViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKServiceViewController class]) bundle:[NSBundle bundleForClass:[QFNewSDKServiceViewController class]]];
    cc.isForgotEnter = true;
         if (@available(iOS 13.0, *)) {
               cc.modalPresentationStyle = UIModalPresentationFullScreen;
           }
         cc.modalPresentationStyle = UIModalPresentationOverFullScreen;
         [self presentViewController:cc animated:false completion:nil];

//    QFNewSDKAuthenticationViewController *cc =   [[QFNewSDKAuthenticationViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKAuthenticationViewController class]) bundle:[NSBundle bundleForClass:[QFNewSDKAuthenticationViewController class]]];
//          if (@available(iOS 13.0, *)) {
//                cc.modalPresentationStyle = UIModalPresentationFullScreen;
//            }
//          cc.modalPresentationStyle = UIModalPresentationOverFullScreen;
//          [self presentViewController:cc animated:false completion:nil];
//
}


-(void)QF_ddButton:(QF_MenuButton *)ddbtn tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *temp =    ddbtn.mainTableDataArray[indexPath.row];
    self.QF_accountLoginView.QF_AccountTextField.text = temp[@"account"];
    if ([temp[@"password"] integerValue] > 0) {
        self.QF_accountLoginView.QF_passwordTextField.text = [NSString stringWithFormat:@"%ld",[temp[@"password"] integerValue]];
    }else
    {
       self.QF_accountLoginView.QF_passwordTextField.text = temp[@"password"];
    }
}

- (void)configButonStyle
{
    self.QF_NewSDKLogin.layer.cornerRadius = 5;
//    self.QF_NewSDKLogin.backgroundColor = [UIColor colorWithRed:78/255.0 green:173/255.0 blue:243/255.0 alpha:1];
    self.QF_NewSDKLogin.layer.masksToBounds = true;
    self.QF_NewSDKLogin.layer.borderWidth = 1;
    [self.QF_NewSDKLogin setTitleColor:[UIColor colorWithRed:78/255.0 green:173/255.0 blue:243/255.0 alpha:1] forState:UIControlStateNormal];
//    self.QF_NewSDKLogin.layer.borderColor = [UIColor colorWithRed:78/255.0 green:173/255.0 blue:243/255.0 alpha:1].CGColor;
    
    
    self.QF_NewSDKAutoRegister.layer.cornerRadius = 5;
    self.QF_NewSDKAutoRegister.layer.masksToBounds = true;
    [self.QF_NewSDKAutoRegister setTitleColor:[UIColor colorWithRed:130/255.0 green:217/255.0 blue:153/255.0 alpha:1] forState:UIControlStateNormal];
    
    
    self.QF_NewSDKPhoneLogin.layer.cornerRadius = 5;
    self.QF_NewSDKPhoneLogin.layer.masksToBounds = true;
    [self.QF_NewSDKPhoneLogin setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    
    self.loginButtion.layer.cornerRadius = 5;
    self.loginButtion.layer.masksToBounds = true;
    self.loginButtion.layer.borderWidth = 1;
    self.loginButtion.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    
    
    
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:@"技术支持"];
   NSRange contentRange = {0, [content length]};
   [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
       [content addAttribute:NSForegroundColorAttributeName value: [UIColor orangeColor] range:contentRange];
   [self.QF_supportUrlButton setAttributedTitle:content forState:UIControlStateNormal];
    [self.QF_supportUrlButton addTarget:self action:@selector(supportURLClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.QF_supportUrlButton.layer.cornerRadius = 5;
    self.QF_supportUrlButton.layer.masksToBounds = true;
    self.QF_supportUrlButton.layer.borderWidth = 1;
    self.QF_supportUrlButton.layer.borderColor = [UIColor whiteColor].CGColor;

    
    
    
        self.QF_PrivacyButton.layer.cornerRadius = 5;
       self.QF_PrivacyButton.layer.masksToBounds = true;
       self.QF_PrivacyButton.layer.borderWidth = 1;
       self.QF_PrivacyButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    
     self.QF_forgotButton.layer.cornerRadius = 5;
    self.QF_forgotButton.layer.masksToBounds = true;
    self.QF_forgotButton.layer.borderWidth = 1;
    self.QF_forgotButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
     NSMutableAttributedString *content1 = [[NSMutableAttributedString alloc] initWithString:@"用户协议"];
    NSRange contentRange1 = {0, [content length]};
    [content1 addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange1];
        [content1 addAttribute:NSForegroundColorAttributeName value: [UIColor orangeColor] range:contentRange1];
    [self.userprotocolbutton setAttributedTitle:content1 forState:UIControlStateNormal];
    [self.userprotocolbutton addTarget:self action:@selector(userprotocolbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    [self.agreemeetButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.agreemeetButton setImage:[QF_Tool QF_SetBundleImageName:@"checkboxkuang" bundleName:@"Bundle"] forState:UIControlStateNormal];
    [self.agreemeetButton setImage:[QF_Tool QF_SetBundleImageName:@"checkboxgou" bundleName:@"Bundle"] forState:UIControlStateSelected];
    

    
    
}
- (void)userprotocolbuttonClick
{
  
}

- (void)configPanoramaView
{
    self.QF_weakPanoramaView = [[QF_PanoramaView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) image:[QF_Tool QF_SetBundleImageName:@"1" bundleName:@"Bundle"]];
    self.QF_weakPanoramaView.QF_animationSpeed = 5.0f;
    self.QF_weakPanoramaView.startPosition = SKPanoramaStartPositionRight;
    [self.QF_bgVIew insertSubview:self.QF_weakPanoramaView atIndex:0];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (self.QF_isdisPlay) {
           QF_MenuButton *rightView0 = [[QF_MenuButton alloc] initWithFrame:CGRectMake(0, 0,35, 30) fromView:self.QF_accountLoginView.QF_AccountTextField];
           rightView0.mainTableDataArray =  [QF_Tool QF_getAccount].mutableCopy;
           rightView0.delegate = self;
           rightView0.QF_menuMode = SingleMenu;
           self.QF_accountLoginView.QF_AccountTextField.rightView = rightView0;
           self.QF_accountLoginView.QF_AccountTextField.rightViewMode = UITextFieldViewModeAlways;
           self.QF_isdisPlay = false;
           [self.QF_bgVIew insertSubview:self.QF_weakPanoramaView atIndex:0];
       }
    self.QF_isdisPlay = true;
}


#pragma mark -账号登录
- (IBAction)QF_NewSDKLoginClick:(UIButton *)sender {
    self.titleLabel.text = @"账号登录";
    self.password = nil;
    self.account = nil;
    self.QF_NewSDKLogin.selected =true;
    self.QF_NewSDKLogin.layer.borderColor = [UIColor colorWithRed:78/255.0 green:173/255.0 blue:243/255.0 alpha:1].CGColor;
        self.QF_NewSDKAutoRegister.layer.borderColor = [UIColor clearColor].CGColor;
    self.QF_NewSDKAutoRegister.selected =false;
    self.QF_NewSDKPhoneLogin.selected =false;
    self.QF_NewSDKPhoneLogin.layer.borderColor =  [UIColor clearColor].CGColor;
    [self.loginButtion setTitle:@"登录" forState:UIControlStateNormal];
    [self removeLoginView];
    
    
    
    
    
//      QFNewSDKAuthenticationViewController *qf =  [[QFNewSDKAuthenticationViewController alloc] initWithNibName:NSStringFromClass([QFNewSDKAuthenticationViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKAuthenticationViewController class]]];
//
    
    
    NSBundle *dynamicBundle = [NSBundle bundleForClass:[QFNewSDKAcountLogin class]];
    
    
      self.QF_accountLoginView =[[dynamicBundle loadNibNamed:NSStringFromClass([QFNewSDKAcountLogin class]) owner:nil options:nil]firstObject];
    

    
    
    
    
  
    
    
    
    self.QF_accountLoginView.frame = CGRectMake(30, 60, self.QF_bgVIew.frame.size.width-60, contentH);
    [self.QF_bgVIew addSubview:self.QF_accountLoginView];
    
    
//    self.QF_accountLoginView.QF_accountTextImage.image = [QF_Tool QF_SetBundleImageName:@"AA_img_account_BB" bundleName:@"kkBundle"];
//    self.QF_accountLoginView.QF_passwordTextFieldImageView.image = [QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"kkBundle"];
    
    
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    UIImageView *leftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_account_BB" bundleName:@"kkBundle"]];
//    leftViewImageView.frame = leftView.bounds;
//    [leftView addSubview:leftViewImageView];
//    self.QF_accountLoginView.QF_AccountTextField.leftView = leftView;
//    self.QF_accountLoginView.QF_AccountTextField.leftViewMode = UITextFieldViewModeAlways;

    
    
//    UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"kkBundle"]];
//    passleftViewImageView.frame = passleftView.bounds;
//    [passleftView addSubview:passleftViewImageView];
//    self.QF_accountLoginView.QF_passwordTextField.leftView = passleftView;
//    self.QF_accountLoginView.QF_passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.QF_accountLoginView.QF_AccountTextField.placeholder = @"请输入账号";
    self.QF_accountLoginView.QF_passwordTextField.placeholder = @"请输入密码";
    
    
    
    
    UIButton *showPwd = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35,30)];
    [showPwd setTitle:@"=" forState:UIControlStateNormal];
    [showPwd setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showPwd addTarget:self action:@selector(QF_showPwdClick:) forControlEvents:UIControlEventTouchUpInside];
    self.QF_accountLoginView.QF_passwordTextField.rightView = showPwd;
    self.QF_accountLoginView.QF_passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    self.QF_accountLoginView.QF_passwordTextField.secureTextEntry = true;
    
    
    NSDictionary *arrtay =   [QF_Tool QF_getLastPasswordAndAccount];
    if (arrtay.allKeys >0) {
        NSDictionary *accountAndPassword = arrtay;
        self.QF_accountLoginView.QF_AccountTextField.text = accountAndPassword[@"account"];
        self.QF_accountLoginView.QF_passwordTextField.text = accountAndPassword[@"password"];
        self.account =   self.QF_accountLoginView.QF_AccountTextField.text;
        self.password =   self.QF_accountLoginView.QF_passwordTextField.text;
    }
    
    
    self.QF_accountLoginView.QF_AccountTextField.accessibilityLabel = @"QF_accountLoginView.QF_AccountTextField";
    self.QF_accountLoginView.QF_passwordTextField.accessibilityLabel = @"QF_accountLoginView.QF_passwordTextField";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_accountLoginView.QF_AccountTextField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_accountLoginView.QF_passwordTextField];
    
}

- (void)QF_showPwdClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.QF_accountLoginView.QF_passwordTextField.secureTextEntry =  !sender.isSelected;
}


#pragma mark ---登录点击
- (IBAction)clickLogin:(id)sender {
    NSDictionary *dict =  [QF_Tool QF_getInitInfo];
    
    if (dict == nil )
          {
              [QF_Tool QF_alertView:@"获取id失败,请重新打开应用" withcompletion:nil];
              return;
          }
    
    
  
     NSString *account =  self.account;
    NSString *password =  self.password;
    
    

     if (account.length == 0)
     {
         [QF_Tool QF_alertView:@"账号不能为空" withcompletion:nil];
         return;
     }
     if (password.length == 0)
     {
         [QF_Tool QF_alertView:@"密码不能为空" withcompletion:nil];
         return;
     }
    
    if (self.QF_NewSDKLogin.selected == true)
    {
           
        NSString *url = [NSString stringWithFormat:@"%@/v1/api/user/login",GameTop];
       NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    account,@"username",
                                    [QF_Tool QF_md5:password],@"password",nil];
        NSDictionary *tempdic = @{@"params":dic};
        [QF_HZActivityIndicatorView showLoading:@""];
        [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
            [QF_HZActivityIndicatorView hide];
            if (responseObject[@"data"]!= nil) {
                if ([responseObject[@"data"] isKindOfClass:[NSDictionary class]])
                {
                    NSDictionary *data = responseObject[@"data"];
                    if ([data.allKeys count] == 0) {
                        [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];

                        return;
                    }
                    [QF_Tool QF_saveAccount:account withPassword:password];
                    [[NSNotificationCenter defaultCenter]postNotificationName:kloginSueeces object:data];
                }
            }
            if ([responseObject[@"code"] integerValue] != 0) {
                [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
            }
        } failure:^(NSError * _Nonnull error) {
            [QF_HZActivityIndicatorView hide];
        }];
    }else if (self.QF_NewSDKAutoRegister.selected == true)
    {
        
        NSString *url =  [NSString stringWithFormat:@"%@/v1/api/user/reg",GameTop];
     
        [QF_HZActivityIndicatorView showLoading:@""];
        
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    account,@"username",
                                    [QF_Tool QF_md5:password],@"password",nil];
        NSDictionary *tempdic = @{@"params":dic};

             [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
                 [QF_HZActivityIndicatorView hide];
                 if (responseObject == nil) return;
                 NSDictionary *response = responseObject[@"data"];
                 if (![response isKindOfClass:[NSDictionary class]] || response.allKeys.count ==0 )
                 {
                     [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                     return;
                 }
                 if (response== nil) return;
                 [QF_Tool QF_screenShots:self.view completionHandle:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
                     if (error == nil) {
                         [QF_Tool QF_alertView:@"账号密码已经保存到您的相册中" withcompletion:nil];
                         
                         [QF_Tool QF_saveUserInfo:responseObject[@"data"]];
                         [QF_Tool QF_saveAccount:account withPassword:password];
                         [[NSNotificationCenter defaultCenter] postNotificationName:kloginSueeces object:responseObject[@"data"]];
                     }
                 }];
             } failure:^(NSError * _Nonnull error) {
                 [QF_HZActivityIndicatorView hide];
             }];
        
        
    }else if (self.QF_NewSDKPhoneLogin.selected == true)
    {
        if (self.QF_phoneLoginView.QF_AccountTextField.text.length == 0 ||
            self.QF_phoneLoginView.QF_passwordTextField.text.length == 0||
            self.QF_phoneLoginView.QF_codeTextField.text.length == 0)
        {
            [QF_Tool QF_alertView:@"请填写信息" withcompletion:nil];
            return;
        }
        
        
        NSString *url =  [NSString stringWithFormat:@"%@/v1/api/user/phone_reg",GameTop];
           NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      self.QF_phoneLoginView.QF_AccountTextField.text,@"phone",
                                      self.QF_phoneLoginView.QF_codeTextField.text,@"code",
                                      [QF_Tool QF_md5:password],@"password",nil];
          NSDictionary *tempdic = @{@"params":dic};
        
          [QF_HZActivityIndicatorView showLoading:@""];
          [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
              [QF_HZActivityIndicatorView hide];
              
              if ([responseObject[@"code"] integerValue] != 0) {
                  [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                  return;
                }
              
              if (responseObject[@"data"]!= nil) {
                  if ([responseObject[@"data"] isKindOfClass:[NSDictionary class]])
                  {
                      NSDictionary *data = responseObject[@"data"];
                      if (responseObject[@"data"] != nil) {
                          NSString *str  = password;
                          if (str != nil && str.length > 0) {
                              [QF_Tool QF_saveAccount:account withPassword:str];
                              [QF_Tool QF_saveUserInfo:data];
                              [[NSNotificationCenter defaultCenter] postNotificationName:kloginSueeces object:data];
                          }
                      }
                  }
              }
         
              
          } failure:^(NSError * _Nonnull error) {
              [QF_HZActivityIndicatorView hide];

          }];
    }

    
}


- (void)removeLoginView
{
    [self.QF_accountLoginView removeFromSuperview];
    [self.QF_quickLoginView removeFromSuperview];
    [self.QF_phoneLoginView removeFromSuperview];
    self.QF_accountLoginView = nil;
    self.QF_quickLoginView = nil;
    self.QF_accountLoginView = nil;

}

#pragma  mark 一键注册点击
- (IBAction)QF_NewSDKAutoRegisterClick:(UIButton *)sender {
    self.titleLabel.text = @"账号注册";
    self.QF_NewSDKAutoRegister.selected =true;
    self.QF_NewSDKAutoRegister.layer.borderWidth = 1;
    self.QF_NewSDKAutoRegister.layer.borderColor = [UIColor colorWithRed:136/255.0 green:219/255.0 blue:171/255.0 alpha:1].CGColor;

    [self.loginButtion setTitle:@"一键注册" forState:UIControlStateNormal];
    self.QF_NewSDKLogin.selected =false;
    self.QF_NewSDKLogin.layer.borderColor = [UIColor clearColor].CGColor;
    self.password = nil;
    self.account = nil;
    self.QF_NewSDKPhoneLogin.selected =false;
    
    self.QF_NewSDKPhoneLogin.layer.borderColor =  [UIColor clearColor].CGColor;
    
    [self removeLoginView];
    
    
    
    
    
    NSBundle *dynamicBundle = [NSBundle bundleForClass:[QFNewSDKAcountLogin class]];
    
    
      self.QF_quickLoginView =[[dynamicBundle loadNibNamed:NSStringFromClass([QFNewSDKAcountLogin class]) owner:nil options:nil]firstObject];
    
    

    self.QF_quickLoginView.frame = CGRectMake(30, 60, self.QF_bgVIew.frame.size.width-60, contentH);
    [self.QF_bgVIew addSubview:self.QF_quickLoginView];
    
    

    
    self.QF_quickLoginView.QF_AccountTextField.placeholder = @"请输入账号";
    self.QF_quickLoginView.QF_passwordTextField.placeholder = @"请输入密码";


   
    
    
    
    
    [QF_HZActivityIndicatorView showLoading:@""];
    NSString *url =  [NSString stringWithFormat:@"%@/v1/api/user/random",GameTop];
    
    NSString *timeStr = [QF_Tool QF_getNowTimeTimestamp];
      NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  timeStr,@"time",nil];
    NSDictionary *tempdic = @{@"params":dic};

    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
         [QF_HZActivityIndicatorView hide];
         NSDictionary *  response = responseObject;
         if ([response  isKindOfClass:[NSDictionary class]])
         {
             NSDictionary *user = [response objectForKey:@"data"];
             
             
             if ([user objectForKey:@"username"] != nil) {
                 self.QF_quickLoginView.QF_AccountTextField.text = [user objectForKey:@"username"];
                 self.account =  self.QF_quickLoginView.QF_AccountTextField.text;

             }
             if ([user objectForKey:@"password"]  != nil) {
                 if ([[user objectForKey:@"password"] integerValue] > 0)
                 {
                     NSInteger password = [[user objectForKey:@"password"] integerValue];
                     self.QF_quickLoginView.QF_passwordTextField.text = [NSString stringWithFormat:@"%ld",(long)password];
                     self.password = self.QF_quickLoginView.QF_passwordTextField.text;

                 }
             }
         }
     } failure:^(NSError * _Nonnull error) {
         
     }];
    
    
    self.QF_quickLoginView.QF_AccountTextField.accessibilityLabel = @"QF_quickLoginView.QF_AccountTextField";
       self.QF_quickLoginView.QF_passwordTextField.accessibilityLabel = @"QF_quickLoginView.QF_passwordTextField";
 [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_quickLoginView.QF_AccountTextField];
 [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_quickLoginView.QF_passwordTextField];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void) viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];

    [self beginAppearanceTransition: NO animated: animated];

}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self endAppearanceTransition];
}

- (void)textFieldDidEndEditing:(NSNotification *)note
{
    
    UITextField *fw =  note.object;
    if ([fw.accessibilityLabel isEqualToString:@"QF_quickLoginView.QF_AccountTextField"]) {
        self.account = fw.text;
    }else if ([fw.accessibilityLabel isEqualToString:@"QF_quickLoginView.QF_passwordTextField"])
    {
        self.password = fw.text;

    }else if ([fw.accessibilityLabel isEqualToString:@"QF_accountLoginView.QF_AccountTextField"])
    {
        self.account = fw.text;
    }
    else if ([fw.accessibilityLabel isEqualToString:@"QF_accountLoginView.QF_passwordTextField"])
    {
        self.password = fw.text;
    }else if ([fw.accessibilityLabel isEqualToString:@"QF_phoneLoginView.QF_AccountTextField"])
    {
        self.account = fw.text;
    }
    else if ([fw.accessibilityLabel isEqualToString:@"QF_phoneLoginView.QF_passwordTextField"])
    {
        self.password = fw.text;

    }
}

#pragma mark -我已阅读并且同意
- (IBAction)agreementClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    
    
}

#pragma mark - 用户协议
- (IBAction)userprotocolClick:(id)sender {
    
    NSString *str = [QF_Option share].QF_userAgentLink;
     NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
     str = [str stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
     NSURL *url = [NSURL URLWithString:str];
     if (@available(iOS 9.0, *)) {
         if ([[UIApplication sharedApplication]canOpenURL:url]) {
             SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
             
             
             if (@available(iOS 13.0, *)) {
                     safariViewController.modalPresentationStyle = UIModalPresentationFullScreen;
                 }
             
             [self presentViewController:safariViewController animated:YES completion:^{
             }];
         }
     }else{
         if ([[UIApplication sharedApplication]canOpenURL:url]) {
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
         }
     }
    
    
}
#pragma mark 选中手机号码登录选项卡
- (IBAction)QF_NewSDKPhoneLoginClick:(UIButton *)sender {
    self.password = nil;
    self.titleLabel.text = @"手机注册";
       self.account = nil;
    self.QF_NewSDKPhoneLogin.selected =true;
    self.QF_NewSDKPhoneLogin.layer.borderWidth =1;
    self.QF_NewSDKPhoneLogin.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.loginButtion setTitle:@"注册" forState:UIControlStateNormal];
    self.QF_NewSDKAutoRegister.selected =false;
    self.QF_NewSDKAutoRegister.layer.borderColor = [UIColor clearColor].CGColor;
    self.QF_NewSDKLogin.selected =false;
    self.QF_NewSDKLogin.layer.borderColor = [UIColor clearColor].CGColor;
    [self removeLoginView];
    
    
    
    
    NSBundle *dynamicBundle = [NSBundle bundleForClass:[phoneRegiterView class]];
       self.QF_phoneLoginView =[[dynamicBundle loadNibNamed:NSStringFromClass([phoneRegiterView class]) owner:nil options:nil]firstObject];
    
     self.QF_phoneLoginView.frame = CGRectMake(30, 35, self.QF_bgVIew.frame.size.width-60, 120);
     [self.QF_bgVIew addSubview:self.QF_phoneLoginView];
     

    
    
    
  
    
     self.QF_phoneLoginView.QF_AccountTextField.placeholder = @"请输入手机号码";
     self.QF_phoneLoginView.QF_passwordTextField.placeholder = @"请输入密码";
    self.QF_phoneLoginView.QF_codeTextField.placeholder = @"请输入验证码";

    self.QF_phoneLoginView.QF_AccountTextField.keyboardType =  UIKeyboardTypePhonePad;
    self.QF_RegistersendMsg = [[QF_CountDownButton alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
      
      self.QF_RegistersendMsg.layer.cornerRadius = 3;
      
      self.QF_RegistersendMsg.clipsToBounds = YES;
      self.QF_RegistersendMsg.contentMode = UIViewContentModeCenter;
      self.QF_RegistersendMsg.titleLabel.font = [UIFont systemFontOfSize: 14.0];
      [self.QF_RegistersendMsg setTitle:@"获取验证码" forState:UIControlStateNormal];
      [self.QF_RegistersendMsg setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
      
    
    
    __weak typeof(self) weakSelf = self;
    
    UIView *QF_RegistersendMsgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, 40)];
    

    [QF_RegistersendMsgView addSubview:self.QF_RegistersendMsg];
    
    self.QF_phoneLoginView.QF_AccountTextField.rightView = QF_RegistersendMsgView;
    self.QF_phoneLoginView.QF_AccountTextField.rightViewMode = UITextFieldViewModeAlways;
    
    
//    //设置leftView
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    UIImageView *leftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_account_BB" bundleName:@"kkBundle"]];
//    leftViewImageView.frame = leftView.bounds;
//    [leftView addSubview:leftViewImageView];
//    self.QF_phoneLoginView.QF_AccountTextField.leftView = leftView;
//    self.QF_phoneLoginView.QF_AccountTextField.leftViewMode = UITextFieldViewModeAlways;


    
    
    
    
//    UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"kkBundle"]];
//    passleftViewImageView.frame = passleftView.bounds;
//    [passleftView addSubview:passleftViewImageView];
//    self.QF_phoneLoginView.QF_passwordTextField.leftView = passleftView;
//    self.QF_phoneLoginView.QF_passwordTextField.leftViewMode = UITextFieldViewModeAlways;
//    
    
    
    
    
    
//    UIView *codeleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    UIImageView *codeleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"kkBundle"]];
//    codeleftViewImageView.frame = codeleftView.bounds;
//    [codeleftView addSubview:codeleftViewImageView];
//    self.QF_phoneLoginView.QF_codeTextField.leftView = codeleftView;
//    self.QF_phoneLoginView.QF_codeTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    
    
    
    
    [self.QF_RegistersendMsg QF_countDownButtonHandler:^(QF_CountDownButton *countDownButton, NSInteger tag) {
          if (![QF_Tool QF_valiMobile:weakSelf.QF_phoneLoginView.QF_AccountTextField.text]) {
              [QF_Tool QF_alertView:@"请输入正确的手机号码" withcompletion:nil];
              return;
          }
          countDownButton.enabled = NO;
          [countDownButton QF_startCountDownWithSecond_XJ:60];
          
          
          
          
          NSString *url = [NSString stringWithFormat:@"%@/v1/api/sms_code",GameTop];
     
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    weakSelf.QF_phoneLoginView.QF_AccountTextField.text,@"phone",
                                    @"reg",@"tag",nil];

        NSDictionary *tempdic = @{@"params":dic};
        
          
          [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
                          if ([responseObject[@"code"] integerValue] !=0) {
                              [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                               [countDownButton XJ_stopCountDown_XJ];
                          }
              
          } failure:^(NSError * _Nonnull error) {
              [countDownButton XJ_stopCountDown_XJ];

          }];
          [countDownButton QF_countDownChanging:^NSString *(QF_CountDownButton *countDownButton, NSUInteger second) {
              return [NSString stringWithFormat:@"%lds",second];
          }];
          [countDownButton QF_countDownFinished:^NSString *(QF_CountDownButton *countDownButton, NSUInteger second) {
              countDownButton.enabled = YES;
              return @"获取验证码";
          }];
      }];
    
    
    
    self.QF_phoneLoginView.QF_AccountTextField.accessibilityLabel = @"QF_phoneLoginView.QF_AccountTextField";
      self.QF_phoneLoginView.QF_passwordTextField.accessibilityLabel = @"QF_phoneLoginView.QF_passwordTextField";
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_phoneLoginView.QF_AccountTextField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidEndEditing:) name:UITextFieldTextDidChangeNotification object:self.QF_phoneLoginView.QF_passwordTextField];
    
    
    
     
}
#pragma  mark 技术支持点击了
- (IBAction)supportURLClick:(id)sender {
    [self QF_userAgentclick:[QF_Option share].QF_supprotLimk];

}
#pragma  mark 用户协议点击了
- (IBAction)PrivacyURLClick:(id)sender {
    [self QF_userAgentclick:[QF_Option share].QF_userAgentLink];

    
}
- (IBAction)forgotPass:(id)sender {
    
    
    if ([QF_Tool QF_getInitInfo] == nil)
         {
             [QF_Tool QF_alertView:@"获取id失败,请重新打开应用" withcompletion:nil];
             return;
         }
    
    QFForgotViewController *Register =  [[QFForgotViewController alloc] initWithNibName:NSStringFromClass([QFForgotViewController class]) bundle:[NSBundle bundleForClass:[QFForgotViewController class]]];
    if (@available(iOS 13.0, *)) {
           Register.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self presentViewController:Register animated:false completion:nil];
}

///用户注册协议
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
            
            [self presentViewController:safariViewController animated:YES completion:^{
            }];
        }
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }
}



@end
