//
//  QF_NewSDKLabelCopyButton.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QF_NewSDKLabelCopyButton.h"

@implementation QF_NewSDKLabelCopyButton



- (void)awakeFromNib
{
    [super awakeFromNib];
    
       UILabel *we = [[UILabel alloc] init];
        we.font = [UIFont systemFontOfSize:14];
        we.translatesAutoresizingMaskIntoConstraints = NO;
       [self addSubview:we];
       self.QF_textlabel = we;
               
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = 5;
               
               
               
       NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:we attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
       NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:we attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0];
               

       NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:we attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
               
       NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:we attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
               
       [self addConstraint:constraint1];
       [self addConstraint:constraint2];
       [self addConstraint:constraint3];
       [self addConstraint:constraint4];
    
    
    
       
     UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font =  [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:button];
    self.QF_copyButton = button;
    
    
    NSLayoutConstraint *buttonconstraint1 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        NSLayoutConstraint *buttonconstraint2 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0];
                

        NSLayoutConstraint *buttonconstraint3 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
                
        NSLayoutConstraint *buttonconstraint4 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0];
                
        [self addConstraint:buttonconstraint1];
        [self addConstraint:buttonconstraint2];
        [self addConstraint:buttonconstraint3];
        [self addConstraint:buttonconstraint4];
    
    
    
               
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
- (void)buttonClick:(UIButton *)bten
{
    if ([self.buttonDelegate respondsToSelector:@selector(QF_NewSDKLabelCopyButtonClickedLabelandButton:button:LabelCopyButton:)]) {
        [self.buttonDelegate QF_NewSDKLabelCopyButtonClickedLabelandButton:self.QF_textlabel button:self.QF_copyButton LabelCopyButton:self];
    }
}


@end
