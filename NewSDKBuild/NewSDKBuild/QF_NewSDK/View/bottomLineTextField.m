//
//  bottomLineTextField.m
//  HYNewSDK
//
//  Created by K on 2020/8/19.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "bottomLineTextField.h"
#import <objc/runtime.h>

@implementation bottomLineTextField

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    [[UIColor colorWithRed:199/255.0 green:197/255.0 blue:197/255.0 alpha:199/255.0] set];//设置下划线颜色 这里是红色 可以自定义

    CGFloat y = CGRectGetHeight(self.frame);

    CGContextMoveToPoint(context, 0, y);

    CGContextAddLineToPoint(context, CGRectGetWidth(self.frame), y);


    CGContextSetLineWidth(context, 2);


    CGContextStrokePath(context);
    
    
    Ivar ivar = class_getInstanceVariable([UITextField class], "_placeholderLabel");
       UILabel *placeholderLabel = object_getIvar(self, ivar);
       placeholderLabel.textColor = [UIColor lightGrayColor];
}

@end
