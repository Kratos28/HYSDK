//
//  NSTimer+eocBlockSupports.h
//  The7Elders
//
//  Created by K on 2020/5/13.
//  Copyright © 2020 com.SwipeView.ios. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (eocBlockSupports)
+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeat;
@end

NS_ASSUME_NONNULL_END
