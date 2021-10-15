//
//  QF_unbindVC.m
//  11QF_NewSDK
//
//  Created by K on 2020/5/27.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFbindVC.h"
#import "QF_Tool.h"
#import "QF_HZActivityIndicatorView.h"
#import "QF_NewSDKNet.h"
#import "acountTextFied.h"
#import "codeTextField.h"

@interface QFbindVC ()
@property(nonatomic ,strong) UITextField * firstResponderTextF;//记录将要编辑的输入框
@property (nonatomic,weak) UIView *bgView;
@property (nonatomic,weak)UILabel *userLabel;
@end

@implementation QFbindVC

- (void)viewDidLoad {
    [self setup_Ui];
        
        self.QF_bingdsendMsg = [[QF_CountDownButton alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
        self.QF_bingdsendMsg.layer.cornerRadius = 3;
        self.QF_bingdsendMsg.clipsToBounds = YES;
        self.QF_bingdsendMsg.contentMode = UIViewContentModeCenter;
        self.QF_bingdsendMsg.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [self.QF_bingdsendMsg setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.QF_bingdsendMsg setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        UIView *bgrightVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
        [bgrightVIew addSubview:self.QF_bingdsendMsg];
        
        
        self.QF_accountTextField .rightView = bgrightVIew;
        self.QF_accountTextField.keyboardType = UIKeyboardTypeNumberPad;
        self.QF_accountTextField.rightViewMode = UITextFieldViewModeAlways;

      
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
//        [self.goBackBtn.layer addSublayer:polygonLayer];

        
        __weak typeof(self) weakSelf = self;
        
    [self.QF_bingdsendMsg QF_countDownButtonHandler:^(QF_CountDownButton *countDownButton, NSInteger tag) {
  
        
        guard(weakSelf.QF_accountTextField.text.length >0) else
        {
            [QF_Tool QF_alertView:@"手机号码不能为空" withcompletion:nil];
            return;;
        }
            
          
              
          
        
            countDownButton.enabled = NO;
            [countDownButton QF_startCountDownWithSecond_XJ:60];
                


                
                NSString *url = [NSString stringWithFormat:@"%@/v1/api/sms_code",GameTop];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                               weakSelf.QF_accountTextField.text,@"phone",
                                   @"bind",@"tag",
                               nil];
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];
                 [QF_NewSDKNet QF_requestWithURLString:url parameters:params type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
                     guard([responseObject[@"code"] integerValue] == 0)else
                     {
                         [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                         [countDownButton XJ_stopCountDown_XJ];

                         return;;
                     }
                     
                 
                    if ([responseObject[@"code"] integerValue] == 0)
                     {

         
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
    
    
    

    
    
    
    
        
        


        self.QF_code.keyboardType = UIKeyboardTypeNumberPad;
    // Do any additional setup after loading the view.
}


- (IBAction)gobackClick:(id)sender {
//    [self dismissViewControllerAnimated:false completion:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
    [self dismissViewControllerAnimated:false completion:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"uploaduserData" object:nil];
    }];

}


- (void)setup_Ui
{
    
    
    
    
    NSDictionary *dict =  [QF_Tool QF_getUserInfo];
    
    UIView *bgView = [[UIView alloc]init];
    bgView.translatesAutoresizingMaskIntoConstraints = false;
    bgView.layer.cornerRadius = 5;
    bgView.clipsToBounds = YES;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    self.bgView = bgView;
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:bgView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:bgView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *centerW = [NSLayoutConstraint constraintWithItem:bgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:320];
    NSLayoutConstraint *centerH= [NSLayoutConstraint constraintWithItem:bgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:250];
    
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    [bgView addConstraint:centerW];
    [bgView addConstraint:centerH];

    
    
    ///绑定title
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    titlelabel.text = @"用户中心";
    titlelabel.textColor = [UIColor orangeColor];
    titlelabel.font = [UIFont boldSystemFontOfSize:13];
    titlelabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [bgView addSubview:titlelabel];
    NSLayoutConstraint *titlelabeltop = [NSLayoutConstraint constraintWithItem:titlelabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *titlelabelcenterX = [NSLayoutConstraint constraintWithItem:titlelabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *titlelabelcenterW = [NSLayoutConstraint constraintWithItem:titlelabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80];
    NSLayoutConstraint *titlelabelcenterH= [NSLayoutConstraint constraintWithItem:titlelabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [bgView addConstraint:titlelabeltop];
    [bgView addConstraint:titlelabelcenterX];
    [titlelabel addConstraint:titlelabelcenterH];
    [titlelabel addConstraint:titlelabelcenterW];

    
    

    
    
    
    
    ///返回按钮
    UIButton *backButton = [[UIButton alloc] init];
    backButton.translatesAutoresizingMaskIntoConstraints = false;
    [backButton addTarget:self action:@selector(gobackClick:) forControlEvents:UIControlEventTouchUpInside];
    self.goBackBtn = backButton;
    [self.bgView addSubview:backButton];
//    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
//    // 这些点的位置都是相对于所在视图的
//    // 起点
//    [polygonPath moveToPoint:CGPointMake(25, 10)];
//    // 其他点
//    [polygonPath addLineToPoint:CGPointMake(15, 20)];
//    [polygonPath addLineToPoint:CGPointMake(25, 30)];
//    //    [polygonPath closePath]; // 添加一个结尾点和起点相同
//    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
//    polygonLayer.lineWidth = 3;
//    polygonLayer.strokeColor = [UIColor whiteColor].CGColor;
//    polygonLayer.path = polygonPath.CGPath;
//    polygonLayer.fillColor = nil; // 默认为blackColor
//    [self.goBackBtn.layer addSublayer:polygonLayer];
    [self.goBackBtn setTitle:@"< 返回" forState:UIControlStateNormal];
    self.goBackBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.goBackBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    NSLayoutConstraint *backButtonTop = [NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *backButtonLeft = [NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *backButtonW = [NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    NSLayoutConstraint *backButtonH= [NSLayoutConstraint constraintWithItem:backButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [self.view addConstraint:backButtonTop];
    [self.view addConstraint:backButtonLeft];
    [backButton addConstraint:backButtonW];
    [backButton addConstraint:backButtonH];
    
    
    
    
    
    
    
    
    
    
    UIView *lineview = [[UIView alloc] init];
    [bgView addSubview:lineview];
    lineview.translatesAutoresizingMaskIntoConstraints = false;
    lineview.backgroundColor = [UIColor orangeColor];
    NSLayoutConstraint *lineviewTop = [NSLayoutConstraint constraintWithItem:lineview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:backButton attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *lineviewLeft = [NSLayoutConstraint constraintWithItem:lineview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    NSLayoutConstraint *lineviewRight = [NSLayoutConstraint constraintWithItem:lineview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    
    NSLayoutConstraint *lineviewButtonH= [NSLayoutConstraint constraintWithItem:lineview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    [self.bgView addConstraint:lineviewTop];
    [self.bgView addConstraint:lineviewLeft];
    [self.bgView addConstraint:lineviewRight];
    [lineview addConstraint:lineviewButtonH];
    
    
    
    
    
    UILabel *userNamelabel = [[UILabel alloc] init];
    userNamelabel.textAlignment = NSTextAlignmentCenter;
    userNamelabel.textColor = [UIColor blackColor];
    userNamelabel.font = [UIFont systemFontOfSize:12];
    if (self.isModifyBind == false) {
        
        userNamelabel.text = [NSString stringWithFormat:@"账户ID:%@",dict[@"user_name"]];
    }else
    {
        userNamelabel.text = [NSString stringWithFormat:@"温馨提示:您正在更改绑定手机号码!账户ID:%@ ",dict[@"user_name"]];
    }
    userNamelabel.translatesAutoresizingMaskIntoConstraints = false;
    [bgView addSubview:userNamelabel];
    
    NSLayoutConstraint *userNamelabelTop = [NSLayoutConstraint constraintWithItem:userNamelabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lineview attribute:NSLayoutAttributeBottom multiplier:1 constant:8];
    
    NSLayoutConstraint *userNamelabelLeft = [NSLayoutConstraint constraintWithItem:userNamelabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
      NSLayoutConstraint *userNamelabelright = [NSLayoutConstraint constraintWithItem:userNamelabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
      NSLayoutConstraint *userNamelabelH= [NSLayoutConstraint constraintWithItem:userNamelabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
    [bgView addConstraint:userNamelabelTop];
      [bgView addConstraint:userNamelabelLeft];
      [bgView addConstraint:userNamelabelright];
      [userNamelabel addConstraint:userNamelabelH];
    self.userLabel = userNamelabel;
    
    
    
    
    
    
    acountTextFied *accountTextField = [[acountTextFied alloc]init];
//    accountTextField.borderStyle =  UITextBorderStyleRoundedRect;
    accountTextField.font = [UIFont systemFontOfSize:15];
    accountTextField.placeholder = @"手机号码";
    accountTextField.translatesAutoresizingMaskIntoConstraints = false;
//    accountTextField.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:accountTextField];
    NSLayoutConstraint *accountTextFieldTop = [NSLayoutConstraint constraintWithItem:accountTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:userNamelabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *accountTextFieldLeft = [NSLayoutConstraint constraintWithItem:accountTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
      NSLayoutConstraint *accountTextFieldright = [NSLayoutConstraint constraintWithItem:accountTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
      NSLayoutConstraint *accountTextFieldH= [NSLayoutConstraint constraintWithItem:accountTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35];
    [bgView addConstraint:accountTextFieldTop];
      [bgView addConstraint:accountTextFieldLeft];
      [bgView addConstraint:accountTextFieldright];
      [accountTextField addConstraint:accountTextFieldH];
    self.QF_accountTextField = accountTextField;
    
    
  
    
    
    
    
    
    codeTextField *passwordTextField = [[codeTextField alloc]init];
    passwordTextField.placeholder = @"验证码";
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
    [bgView addSubview:passwordTextField];
    NSLayoutConstraint *passwordTextFieldTop = [NSLayoutConstraint constraintWithItem:passwordTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:accountTextField attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    NSLayoutConstraint *passwordTextFieldLeft = [NSLayoutConstraint constraintWithItem:passwordTextField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
      NSLayoutConstraint *passwordTextFieldRight = [NSLayoutConstraint constraintWithItem:passwordTextField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
    
      NSLayoutConstraint *passwordTextFieldHeight = [NSLayoutConstraint constraintWithItem:passwordTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35];
    [bgView addConstraint:passwordTextFieldTop];
      [bgView addConstraint:passwordTextFieldLeft];
      [bgView addConstraint:passwordTextFieldRight];
      [passwordTextField addConstraint:passwordTextFieldHeight];
    self.QF_code = passwordTextField;
    
    
    
    
    
    UIButton *confimButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confimButton.translatesAutoresizingMaskIntoConstraints = false;
    if (self.isModifyBind == false) {
        
        [confimButton setTitle:@"绑定手机" forState:UIControlStateNormal];
    }else
    {
        [confimButton setTitle:@"修改绑定" forState:UIControlStateNormal];
    }

    confimButton.titleLabel.font = [UIFont systemFontOfSize:15];
    confimButton.layer.cornerRadius = 5;
    confimButton.clipsToBounds = YES;
    [confimButton addTarget:self action:@selector(bindClick:) forControlEvents:UIControlEventTouchUpInside];
    confimButton.backgroundColor =  [UIColor colorWithRed:252/255.0 green:153/255.0 blue:38/255.0 alpha:1];
    [bgView addSubview:confimButton];
    

    NSLayoutConstraint *confimButtonTop = [NSLayoutConstraint constraintWithItem:confimButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:passwordTextField attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    NSLayoutConstraint *confimButtonLeft = [NSLayoutConstraint constraintWithItem:confimButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
      NSLayoutConstraint *confimButtonRight = [NSLayoutConstraint constraintWithItem:confimButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
    
    NSLayoutConstraint *confimButtonHeight = [NSLayoutConstraint constraintWithItem:confimButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [bgView addConstraint:confimButtonTop];
    [bgView addConstraint:confimButtonLeft];
    [bgView addConstraint:confimButtonRight];
    [confimButton addConstraint:confimButtonHeight];
    self.QF_registerBtn = confimButton;
    
    
    UILabel *tip = [[UILabel alloc] init];
    tip.translatesAutoresizingMaskIntoConstraints = false;
    tip.textColor =[UIColor lightGrayColor];
    tip.font = [UIFont systemFontOfSize:12];
    tip.textAlignment = NSTextAlignmentCenter;
    tip.numberOfLines = 0;
    tip.text = @"为了您的账号安全，请进行手机号码绑定\n绑定之后可以自行找回密码，保护账号安全";
    [bgView addSubview:tip];
    

    
    NSLayoutConstraint *tipTop = [NSLayoutConstraint constraintWithItem:tip attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:confimButton attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    NSLayoutConstraint *tipLeft = [NSLayoutConstraint constraintWithItem:tip attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
      NSLayoutConstraint *tipRight = [NSLayoutConstraint constraintWithItem:tip attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:bgView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *tipHeight = [NSLayoutConstraint constraintWithItem:tip attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [bgView addConstraint:tipTop];
    [bgView addConstraint:tipLeft];
    [bgView addConstraint:tipRight];
    [tip addConstraint:tipHeight];
    
    
}

- (IBAction)bindClick:(id)sender
{
    NSString *phone = self.QF_accountTextField.text;
       NSString *msg = self.QF_code.text;
       
       if (phone == nil || phone.length == 0) {
           [QF_Tool QF_alertView:@"请填写手机号码" withcompletion:nil];
           return;
       }
       
       
       
       if (msg == nil || msg.length == 0) {
           [QF_Tool QF_alertView:@"请输入验证码" withcompletion:nil];
           return;
       }
       
       
    
       
       
 
    {
        NSDictionary *uid = [QF_Tool QF_getUserInfo];
        NSString *time = [QF_Tool QF_getNowTimeTimestamp];
        
        
        NSString *url =  [NSString stringWithFormat:@"%@/v1/api/user/bind_phone",GameTop];
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                               uid[@"access_token"],@"access_token",
                               @0,@"type",
                               phone,@"phone",
                               msg,@"code",
                               nil];
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];
        
        
        
        
        [QF_NewSDKNet QF_requestWithURLString:url parameters:params type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
    
            
            
            guard([responseObject[@"code"] integerValue]  == 0) else
            {
                [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                return;
            }
            
            
            if ([responseObject[@"code"] integerValue]  == 0)
            {
             
                [self.presentingViewController.presentingViewController dismissViewControllerAnimated:false completion:^{
                    [QF_Tool QF_alertView:@"绑定成功,您可以使用新绑定手机号进行登录，原绑定手机将无效" withcompletion:^{
                        
                    }];

              
                }];
              
    
            }
            
            
        } failure:^(NSError * _Nonnull error) {
            [QF_Tool QF_alertView:@"绑定手机失败" withcompletion:nil];

        }];
        
    }

       
}



@end
