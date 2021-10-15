//
//  UIView+QF_NewSDKViewIBInspectable.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//



#import <UIKit/UIKit.h>



typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
 UIBorderSideTypeAll = 0,
 UIBorderSideTypeTop = 1 << 0,
 UIBorderSideTypeBottom = 1 << 1,
 UIBorderSideTypeLeft = 1 << 2,
 UIBorderSideTypeRight = 1 << 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IBinspectable)
@property(nonatomic,assign) IBInspectable CGFloat cornerRadius;
@property(nonatomic,assign) IBInspectable CGFloat borderWidth;
@property(nonatomic,assign) IBInspectable UIColor *borderColor;

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;



@end

NS_ASSUME_NONNULL_END
