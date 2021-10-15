//
//  NSTimer+eocBlockSupports.m
//  The7Elders
//
//  Created by K on 2020/5/13.
//  Copyright © 2020 com.SwipeView.ios. All rights reserved.
//

#import "NSTimer+eocBlockSupports.h"



@implementation NSTimer (eocBlockSupports)

+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(void))block repeats:(BOOL)repeat
{
    return  [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(startTimer:) userInfo:[block copy] repeats:repeat];
}


+(void)startTimer:(NSTimer *)timer{
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
     
}

@end
