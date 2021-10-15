//
//  acountTextFied.m
//  HYNewSDK
//
//  Created by K on 2020/8/19.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "acountTextFied.h"
#import "QF_Tool.h"
@implementation acountTextFied


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
               UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_account_BB" bundleName:@"Bundle"]];
         passleftViewImageView.center = passleftView.center;
            [passleftView addSubview:passleftViewImageView];
        [passleftViewImageView sizeToFit];
        self.textColor =[UIColor blackColor];
        self.tintColor = [UIColor blackColor];
            self.leftView = passleftView;
            self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}





- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIView *passleftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *passleftViewImageView = [[UIImageView alloc] initWithImage:[QF_Tool QF_SetBundleImageName:@"AA_img_account_BB" bundleName:@"Bundle"]];
    passleftViewImageView.centerX = passleftView.centerX;
    passleftViewImageView.centerY = passleftView.centerY;
    [passleftViewImageView sizeToFit];

  [passleftView addSubview:passleftViewImageView];
    
    self.textColor =[UIColor blackColor];
    self.tintColor = [UIColor blackColor];
  self.leftView = passleftView;
  self.leftViewMode = UITextFieldViewModeAlways;
    
}



@end
