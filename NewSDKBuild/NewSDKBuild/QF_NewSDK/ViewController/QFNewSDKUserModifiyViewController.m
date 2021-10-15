//
//  QFNewSDKUserModifiyViewController.m
//  HYGameSDK
//
//  Created by K on 2020/12/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "QFNewSDKUserModifiyViewController.h"
#import "acountTextFied.h"
#import "passwordTextField.h"
#import "codeTextField.h"

@interface QFNewSDKUserModifiyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIView *BgView;
@property (weak, nonatomic) IBOutlet acountTextFied *usernameTextField;
@property (weak, nonatomic) IBOutlet codeTextField *codeTextField;
@property (weak, nonatomic) IBOutlet passwordTextField *passwordTextField;

@end

@implementation QFNewSDKUserModifiyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
