//
//  QF_NewSDKAuthenticationViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/11.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKAuthenticationViewController.h"
#import "QFNewSDKAcountLogin.h"
#import "QF_NewSDKNet.h"
#import "QF_Option.h"
#import "acountTextFied.h"
#import "codeTextField.h"
#import "passwordTextField.h"
#define contentH 90

@interface QFNewSDKAuthenticationViewController ()
@property (weak, nonatomic) IBOutlet UIView *QF_NewSDKAuthenticationView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,strong)QFNewSDKAcountLogin *QFNewSDKAcountLogincontentView;
@end

@implementation QFNewSDKAuthenticationViewController
- (IBAction)gobackClick:(id)sender {
    
    [self dismissViewControllerAnimated:false completion:nil];
    
}
- (IBAction)AutehnticationClick:(id)sender {
    if (self.accountTextField.text.length == 0 && self.passwordTextField.text.length == 0) {
        [QF_Tool QF_alertView:@"请输入姓名和身份证号码" withcompletion:nil];
        return;
    }
    
    
    
     NSDictionary *user = [QF_Tool QF_getUserInfo];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          user[@"access_token"],@"access_token",
                          self.accountTextField.text,@"truename",
                          self.passwordTextField.text,@"idno",
                           nil];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];

    
    [QF_NewSDKNet QF_requestWithURLString:[NSString stringWithFormat:@"%@/v1/api/user/id_card",GameTop] parameters:params type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            return;
        }
        if ([responseObject[@"code"] intValue]== 0) {
            

            [QF_Tool QF_alertView:@"修改成功" withcompletion:^{
                [self QF_NewSDKAuthenticationGoBackClick:nil];

            }];

        }
        if ([responseObject[@"code"] intValue] != 0) {
            [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
        }
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint:CGPointMake(25, 5)];
    [polygonPath addLineToPoint:CGPointMake(15, 15)];
    [polygonPath addLineToPoint:CGPointMake(25, 25)];
    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
    polygonLayer.lineWidth = 3;
    polygonLayer.strokeColor = [UIColor grayColor].CGColor;
    polygonLayer.path = polygonPath.CGPath;
    polygonLayer.fillColor = nil; // 默认为blackColor
//    [self.QF_NewSDKAuthenticationGoBack.layer addSublayer:polygonLayer];
    
    [self.QF_NewSDKAuthenticationGoBack setTitle:@"< 返回" forState:UIControlStateNormal];
    
    
    self.accountTextField.leftView =nil;
    UILabel *label = [[UILabel alloc] init];
    label.text = @"真实姓名:";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    self.accountTextField.leftView = label;
    
    
    
    self.passwordTextField.leftView =nil;
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"身份证号:";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor lightGrayColor];
    self.passwordTextField.leftView = label1;
    
    NSDictionary *userinfo = [QF_Tool QF_getUserInfo];
    
    
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 userinfo[@"access_token"],@"access_token",nil];
        NSDictionary *tempdic = @{@"params":dic1};
    
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/user/token_login",GameTop];
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            guard([responseObject[@"code"] intValue]  == 0)else
            {
                [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                return;
            }
            
            
            NSDictionary *user =  responseObject[@"data"];
            self.accountTextField.text = user[@"realname"];
            self.passwordTextField.text = user[@"idno"];
            if([user[@"realname"] length] > 0 && [user[@"idno"] length] > 0)
            {
                [self.submitButton setTitle:@"修改验证" forState:UIControlStateNormal];
            }else
            {
                [self.submitButton setTitle:@"实名验证" forState:UIControlStateNormal];
            }
            

            
            
        }
        
        

        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    

    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)confimButtonClick:(id)sender {
    
    
  
}


- (void)textFieldDidEndEditing:(NSNotification *)note
{
    UITextField *textField = note.object;
    if (textField == self.QFNewSDKAcountLogincontentView.QF_AccountTextField)
    {
    }else if (textField == self.QFNewSDKAcountLogincontentView.QF_passwordTextField)
    {
    }
}

-(IBAction)QF_NewSDKAuthenticationGoBackClick:(id)sender
{
    [self dismissViewControllerAnimated:false completion:nil];

}



@end
