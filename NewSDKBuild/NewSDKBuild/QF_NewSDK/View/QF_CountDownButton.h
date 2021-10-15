//
//  JKCountDownButton.h
//  JKCountDownButton
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSTimer (JKCountDownBlocksSupport)
+ (NSTimer *)jkcd_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                           block:(void(^)(void))block
                                         repeats:(BOOL)repeats;
@end

@class QF_CountDownButton;
typedef NSString* (^CountDownChanging)(QF_CountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(QF_CountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(QF_CountDownButton *countDownButton,NSInteger tag);

@interface QF_CountDownButton : UIButton
@property(nonatomic,strong) id userInfo;
///倒计时按钮点击回调
- (void)QF_countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)QF_countDownChanging:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)QF_countDownFinished:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)QF_startCountDownWithSecond_XJ:(NSUInteger)second;
///停止倒计时
- (void)XJ_stopCountDown_XJ;
@end



