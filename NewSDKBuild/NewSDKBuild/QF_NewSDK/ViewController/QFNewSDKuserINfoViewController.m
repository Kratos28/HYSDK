//
//  QF_NewSDKuserINfoViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKuserINfoViewController.h"
#import "QF_Tool.h"

@interface QFNewSDKuserINfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *zhanghao;
@property (weak, nonatomic) IBOutlet UILabel *QF_sex;
@property (weak, nonatomic) IBOutlet UILabel *QF_birthday;
@property (weak, nonatomic) IBOutlet UILabel *QF_bangdingPhone;

@end

@implementation QFNewSDKuserINfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *logindapi = [QF_Tool getaccountlogindapi];
    guard(logindapi[@"usercentral"]) else{
        return;
    }
    
    NSDictionary *userinfo = logindapi[@"usercentral"];
    guard(userinfo) else{return;}
    self.zhanghao.text = [NSString stringWithFormat:@"账号:%@",userinfo[@"username"]];
    self.QF_sex.text = [NSString stringWithFormat:@"性别:%@",userinfo[@"gender"]];
    self.QF_birthday.text = [NSString stringWithFormat:@"生日:%@",userinfo[@"birth"]];
    
    
    
    if ([userinfo[@"mobile"] length] >=8) {
        NSString *numberString = [userinfo[@"mobile"] stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];


           
           self.QF_bangdingPhone.text = [NSString stringWithFormat:@"绑定手机:%@",numberString];
    }else
    {
        self.QF_bangdingPhone.text = [NSString stringWithFormat:@"绑定手机:你未绑定手机"];

    }
   

    
}


- (IBAction)QF_GoBackClick:(id)sender {
     [self dismissViewControllerAnimated:false completion:^{
        [[NSNotificationCenter defaultCenter]postNotificationName:@"uploaduserData" object:nil];
    }];
}

@end
