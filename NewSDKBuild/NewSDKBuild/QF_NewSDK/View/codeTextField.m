//
//  codeTextField.m
//  HYNewSDK
//
//  Created by K on 2020/8/19.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "codeTextField.h"
#import "QF_Tool.h"
@implementation codeTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
               UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"code" bundleName:@"Bundle"]];
             passleftViewImageView.center = passleftView.center;
            [passleftView addSubview:passleftViewImageView];
            self.leftView = passleftView;
        self.tintColor = [UIColor blackColor];
            self.leftViewMode = UITextFieldViewModeAlways;
        self.textColor = [UIColor blackColor];
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
              UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"code" bundleName:@"Bundle"]];
  passleftViewImageView.center = passleftView.center;
  [passleftView addSubview:passleftViewImageView];
  self.leftView = passleftView;
    self.tintColor = [UIColor blackColor];
  self.leftViewMode = UITextFieldViewModeAlways;
    self.textColor = [UIColor blackColor];
}

@end
