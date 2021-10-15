//
//  passwordTextField.m
//  HYNewSDK
//
//  Created by K on 2020/8/19.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "passwordTextField.h"
#import "QF_Tool.h"

@implementation passwordTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
               UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"Bundle"]];
             passleftViewImageView.center = passleftView.center;
            [passleftView addSubview:passleftViewImageView];
            self.leftView = passleftView;
            self.leftViewMode = UITextFieldViewModeAlways;
        self.textColor = [UIColor blackColor];
        self.tintColor = [UIColor blackColor];
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.textColor = [UIColor blackColor];
    UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
              UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_password_BB" bundleName:@"Bundle"]];
  passleftViewImageView.center = passleftView.center;
  [passleftView addSubview:passleftViewImageView];
  self.leftView = passleftView;
    self.tintColor = [UIColor blackColor];
  self.leftViewMode = UITextFieldViewModeAlways;
    
}
@end
