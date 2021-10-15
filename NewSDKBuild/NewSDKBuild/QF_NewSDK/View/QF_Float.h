//
//  GArConstraint.h
//  WJGameSDK
//
//  Created by 张文杰 on 2018/12/3.
//  Copyright © 2018年 MeiAnKeJi. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface QF_Float : UIView


@property(nonatomic, copy)NSString *  QF_constantsText;
@property(nonatomic, assign)NSInteger  returnDebugF;
@property(nonatomic, assign)int  home;



@property (nonatomic,copy) void(^clickBolcks)(NSInteger i,NSString *title,QF_Float *FloatW);

- (instancetype)QF_initMenu;
- (void)QF_dissmissWindow_XJ;
- (void)QF_showWindow_XJ;
@end
