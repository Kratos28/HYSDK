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

@class KLUTBeforeFilter;
typedef NSString* (^CountDownChanging)(KLUTBeforeFilter *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(KLUTBeforeFilter *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(KLUTBeforeFilter *countDownButton,NSInteger tag);

@interface KLUTBeforeFilter : UIButton
@property(nonatomic,strong) id userInfo;
///倒计时按钮点击回调
- (void)bindProvidertoClass:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)clearCacheWithRequest:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)setProtocolwithAdaptertag:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)publisheronMemberExitWithUserIdreason:(NSUInteger)second;
///停止倒计时
- (void)textViewshouldLongPressHighlightinRange;
@end



