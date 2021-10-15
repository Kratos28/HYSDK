//
//  QF_ForgotViewController.m
//  QFSDK
//
//  Created by K on 2019/6/26.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "QFForgotViewController.h"
#import "QF_NewSDKNet.h"
#import "QFNewSDKServiceViewController.h"
#import "QF_PanoramaView.h"
@interface QFForgotViewController () <UITextFieldDelegate>
@property(nonatomic ,strong) UITextField * firstResponderTextF;//记录将要编辑的输入框
@property (nonatomic, strong) QF_PanoramaView *QF_weakQForgotViewControllerPanoramaView;
@property (weak, nonatomic) IBOutlet UIView *QF_forgotBGView;
@property (weak, nonatomic) IBOutlet UIButton *weibindPhone;
@property (weak, nonatomic) IBOutlet UIButton *zhaohui;

@end

@implementation QFForgotViewController

- (IBAction)QF_comfirmBtnClick:(id)sender {
    NSString *phone = self.QF_baseAccountTextField.text;
    NSString *password = self.QF_basePasswordTextField.text;
    NSString *sms = self.QF_baseCodeTextField.text;
    
    if (phone == nil || phone.length == 0) {
        [QF_Tool QF_alertView:@"请填写手机号码" withcompletion:nil];
        return;
    }
    
    
    if (sms == nil || sms.length == 0) {
        [QF_Tool QF_alertView:@"请填验证码" withcompletion:nil];
        return;
    }
    if (password == nil || password.length == 0) {
        [QF_Tool QF_alertView:@"请填写密码" withcompletion:nil];
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/user/forget_pwd",GameTop];
    
    

    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    phone,@"phone",
                                    sms,@"code",
                                    [QF_Tool QF_md5:password],@"password",nil];
        NSDictionary *tempdic = @{@"params":dic};
    
    
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] != 0) {
            if (responseObject[@"msg"])
            {
                [QF_Tool QF_alertView:responseObject[@"msg"] withcompletion:nil];
            }
            return;
        }
        
        if ([responseObject[@"code"] integerValue] == 0) {
      
            [QF_Tool QF_alertView:@"修改成功" withcompletion:^{
                
                [self dismissViewControllerAnimated:false completion:nil];
            }];


        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (IBAction)weibindingClick:(id)sender {
      QFNewSDKServiceViewController *Register =  [[QFNewSDKServiceViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKServiceViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKServiceViewController class]]];
    if (@available(iOS 13.0, *)) {
           Register.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    Register.isForgotEnter = true;
    [self presentViewController:Register animated:false completion:nil];
}

- (IBAction)serveiceClick:(id)sender {
     QFNewSDKServiceViewController *qf =  [[QFNewSDKServiceViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKServiceViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKServiceViewController class]]];
    qf.isForgotEnter = true;
    qf.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:qf animated:false completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.QF_forgotBGView.layer.cornerRadius = 10;
       self.QF_forgotBGView.layer.masksToBounds = true;
    
    self.QF_forgotsendMsg = [[QF_CountDownButton alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
    self.QF_forgotsendMsg.layer.cornerRadius = 3;
    self.QF_forgotsendMsg.clipsToBounds = YES;
    self.QF_forgotsendMsg.contentMode = UIViewContentModeCenter;
    self.QF_forgotsendMsg.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [self.QF_forgotsendMsg setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.QF_forgotsendMsg setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    UIView *bgrightVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
    [bgrightVIew addSubview:self.QF_forgotsendMsg];
    
    self.QF_baseAccountTextField .rightView = bgrightVIew;
    self.QF_baseAccountTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.QF_baseAccountTextField.rightViewMode = UITextFieldViewModeAlways;
    [self.goback setImage:[QF_Tool QF_SetBundleImageName:@"arrow_back" bundleName:@"Bundle"] forState:UIControlStateNormal];
//    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
//    [polygonPath moveToPoint:CGPointMake(25, 10)];
//    [polygonPath addLineToPoint:CGPointMake(15, 20)];
//    [polygonPath addLineToPoint:CGPointMake(25, 30)];
//    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
//    polygonLayer.lineWidth = 3;
//    polygonLayer.strokeColor = [UIColor colorWithRed:162/255.0 green:135/255.0 blue:162/255.0 alpha:1].CGColor;
//    polygonLayer.path = polygonPath.CGPath;
//    polygonLayer.fillColor = nil; // 默认为blackColor
//    [self.goback.layer addSublayer:polygonLayer];
    [self.goback setTitle:@"< 返回" forState:UIControlStateNormal];
    
    
    
    
     NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:@"未绑定手机,可联系客服找回密码"];
    NSRange contentRange = {7, [content length] - 7};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    [content addAttribute:NSForegroundColorAttributeName value: [UIColor grayColor] range:(NSRange){0,7}];
    [content addAttribute:NSForegroundColorAttributeName value: [UIColor orangeColor] range: contentRange];
    [self.zhaohui setAttributedTitle:content forState:UIControlStateNormal];
    
    
    __weak typeof(self) weakSelf = self;
    
    [self.QF_forgotsendMsg QF_countDownButtonHandler:^(QF_CountDownButton *countDownButton, NSInteger tag) {
        if (![QF_Tool QF_valiMobile:weakSelf.QF_baseAccountTextField.text]) {
            [QF_Tool QF_alertView:@"请输入正确的手机号码" withcompletion:nil];
            return;
        }
        
        countDownButton.enabled = NO;
        [countDownButton QF_startCountDownWithSecond_XJ:60];
        
        
        
        NSString *url = [NSString stringWithFormat:@"%@/v1/api/sms_code",GameTop];
   NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     self.QF_baseAccountTextField.text,@"phone",
                                     @"edit_pwd",@"tag",nil];
        NSDictionary *tempdic = @{@"params":dic};
        [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
            if ([responseObject[@"code"] integerValue] != 0) {
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
    
    
    //监听键盘展示和隐藏的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.QF_baseAccountTextField.delegate = self;
    self.QF_basePasswordTextField.delegate = self;
    self.QF_baseCodeTextField.delegate = self;
    
    
    
    self.QF_weakQForgotViewControllerPanoramaView = [[QF_PanoramaView alloc] initWithFrame:CGRectMake(0, 0, self.QF_forgotBGView.frame.size.width, self.QF_forgotBGView.frame.size.height) image:[QF_Tool QF_SetBundleImageName:@"1" bundleName:@"Bundle"]];
    self.QF_weakQForgotViewControllerPanoramaView.QF_animationSpeed = 10.0f;
    self.QF_weakQForgotViewControllerPanoramaView.startPosition = SKPanoramaStartPositionRight;
    

    
    
     NSDictionary *indeapi = [QF_Tool getaccountlogindapi];
      guard(indeapi) else return;
      NSDictionary *user = indeapi[@"usercentral"];
      guard(user)else return;
    
    if ([user[@"mobile"] length] > 0) {
        self.weibindPhone.hidden = true;
            
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_QF_weakQForgotViewControllerPanoramaView QF_startAnimating];
}

- (IBAction)goback:(id)sender {
    
     [self dismissViewControllerAnimated:false completion:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"uploaduserData" object:nil];
    }];
}
#pragma maek UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.firstResponderTextF = textField;//当将要开始编辑的时候，获取当前的textField
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)keyboardWillShow:(NSNotification *)notification{
    CGRect rect = [self.firstResponderTextF.superview convertRect:self.firstResponderTextF.frame toView:self.view];//获取相对于self.view的位置
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];//获取弹出键盘的fame的value值
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:self.view.window];//获取键盘相对于self.view的frame ，传window和传nil是一样的
    CGFloat keyboardTop = keyboardRect.origin.y;
    NSNumber * animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];//获取键盘弹出动画时间值
    NSTimeInterval animationDuration = [animationDurationValue doubleValue];
    if (keyboardTop < CGRectGetMaxY(rect)) {//如果键盘盖住了输入框
        CGFloat gap = keyboardTop - CGRectGetMaxY(rect) - 10;//计算需要网上移动的偏移量（输入框底部离键盘顶部为10的间距）
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:animationDuration animations:^{
            weakSelf.view.frame = CGRectMake(weakSelf.view.frame.origin.x, gap, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
        }];
    }
}
- (void)keyboardWillHide:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSNumber * animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];//获取键盘隐藏动画时间值
    NSTimeInterval animationDuration = [animationDurationValue doubleValue];
    if (self.view.frame.origin.y < 0) {//如果有偏移，当影藏键盘的时候就复原
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:animationDuration animations:^{
            weakSelf.view.frame = CGRectMake(weakSelf.view.frame.origin.x, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
        }];
    }
}


- (void)dealloc{
    //移除键盘通知监听者
    [_QF_weakQForgotViewControllerPanoramaView QF_stopAnimating];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}


@end
