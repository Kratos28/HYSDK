//
//  QF_NewSDKOnlineTimeObject.m
//  11QF_NewSDK
//
//  Created by K on 2020/5/26.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QF_NewSDKOnlineTimeObject.h"
#import <UIKit/UIKit.h>
#import "NSTimer+eocBlockSupports.h"
#import "QF_NewSDKNet.h"
#import "QF_Tool.h"
#import "QFNewSDKAuthenticationViewController.h"

#define onlineTimeInterval @"onlineTimeInterval"

static id  sharedSingletonTimeObject;

@interface QF_NewSDKOnlineTimeObject()
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation QF_NewSDKOnlineTimeObject
+(instancetype)shared{
    if (!sharedSingletonTimeObject) {
            sharedSingletonTimeObject = [[super allocWithZone:NULL] init];
            

            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

            if ([[userDefaults objectForKey:onlineTimeInterval]integerValue] >  0) {
                [userDefaults removeObjectForKey:onlineTimeInterval];
            }
            
            if ([[userDefaults objectForKey:@"onlineTime"] integerValue] > 0) {
                [userDefaults removeObjectForKey:@"onlineTime"];
            }
            
            
            NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970]*1000;
              
              long long theTime = [[NSNumber numberWithDouble:nowtime] longLongValue];
              
            NSString *curTime = [NSString stringWithFormat:@"%llu",theTime];
                  //获取NSUserDefaults对象
            [userDefaults setObject:curTime forKey:onlineTimeInterval];
            
            [userDefaults synchronize];
            
            
               
              [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackgroundNotification) name:UIApplicationDidEnterBackgroundNotification object:nil];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForegroundNotification) name:UIApplicationWillEnterForegroundNotification object:nil];
            
            [self startTimer];
            
    }
    return sharedSingletonTimeObject;
}


+ (void)clearTimer
{
    
    
    [[QF_NewSDKOnlineTimeObject shared].timer invalidate];
     [QF_NewSDKOnlineTimeObject shared].timer = nil;
    
    sharedSingletonTimeObject = nil;
    
}
+  (void)applicationDidEnterBackgroundNotification
{

    
    [[QF_NewSDKOnlineTimeObject shared].timer  invalidate];
      NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970]*1000;
                   
           long long theTime = [[NSNumber numberWithDouble:nowtime] longLongValue];
                   
       NSString *endTime = [NSString stringWithFormat:@"%llu",theTime];
       NSUserDefaults *userDefaults1 = [NSUserDefaults standardUserDefaults];
      
      
   
    NSString * startTime  = [userDefaults1 objectForKey:onlineTimeInterval];
               
      float time = ([endTime integerValue]-[startTime integerValue]);
      float sumTime= time/1000;
      
      if ([[userDefaults1 objectForKey:@"onlineTime"] integerValue] > 0 )
        {
            NSInteger   onlineTime  = [[userDefaults1 objectForKey:@"onlineTime"] integerValue];
              sumTime  = sumTime + onlineTime;
        }
        
      
      [userDefaults1 setFloat:sumTime forKey:@"onlineTime"];
      [userDefaults1 synchronize];
}

+ (void)applicationWillEnterForegroundNotification
{
    
    NSTimeInterval nowtime1 = [[NSDate date] timeIntervalSince1970]*1000;
    long long theTime1 = [[NSNumber numberWithDouble:nowtime1] longLongValue];
    NSUserDefaults *userDefaults1 = [NSUserDefaults standardUserDefaults];
    NSString *curTime1 = [NSString stringWithFormat:@"%llu",theTime1];
    [userDefaults1 setObject:curTime1 forKey:onlineTimeInterval];
    [userDefaults1 synchronize];
    [self startTimer];


}



+ (void)startTimer
{

    
    [[QF_NewSDKOnlineTimeObject shared].timer invalidate];
    [QF_NewSDKOnlineTimeObject shared].timer = nil;
    
    [QF_NewSDKOnlineTimeObject shared].timer = [NSTimer eocScheduledTimerWithTimeInterval:300 block:^{
              NSUserDefaults *userDefaults1 = [NSUserDefaults standardUserDefaults];
              NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970]*1000;
              long long theTime = [[NSNumber numberWithDouble:nowtime] longLongValue];
              
              NSString *endTime = [NSString stringWithFormat:@"%llu",theTime];
              NSString * startTime  = [userDefaults1 objectForKey:@"onlineTimeInterval"];
              float time = ([endTime integerValue]-[startTime integerValue]);

              float sumTime= time/1000;

              if ([[userDefaults1 objectForKey:@"onlineTime"] integerValue] > 0 ) {
                  NSInteger   onlineTime  = [[userDefaults1 objectForKey:@"onlineTime"] integerValue];
                  sumTime  = sumTime + onlineTime;
                  
                  
              }
              int minutes = floor(sumTime/60);
              NSString * fieldSumTime1 = [NSString stringWithFormat:@"%d",minutes];
              NSLog(@"%@",fieldSumTime1);
            
            
        NSDictionary *dcit = [NSDictionary dictionaryWithObjectsAndKeys:fieldSumTime1,@"minute", nil];
        NSString *url = [NSString stringWithFormat:@"%@/user/user/onlinereportapi",GameTop];
        [QF_NewSDKNet QF_requestWithURLString:url parameters:dcit type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                if ([responseObject[@"code"] intValue] == 1) {
                    NSDictionary *data = responseObject[@"data"];
                    if (data == nil) {
                        return;
                    }
                    
                    if ([data[@"verify"] intValue] == 1) {
                        //强制认证
                        
                        
                        [self alertVerify:true];
                        
                    }else if ([data[@"verify"] intValue] == 2){
                    [self alertVerify:false];
                    }
                    
                }else if ([responseObject[@"code"]intValue] == 0)
                {
                    [QF_Tool QF_alertView:responseObject[@"msg"] withcompletion:nil];
                }
            }
            
        } failure:^(NSError * _Nonnull error) {
            
        }];
        
        
            
        } repeats:true];
       
    
}

+ (void)alertVerify:(BOOL)isbackButton
{
    
    
         QFNewSDKAuthenticationViewController *qf =  [[QFNewSDKAuthenticationViewController alloc] initWithNibName:NSStringFromClass([QFNewSDKAuthenticationViewController class])  bundle:[NSBundle bundleForClass:[QFNewSDKAuthenticationViewController class]]];
    
    
   __block BOOL isre = false;

    [[QF_Tool QF_weakVC].childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[QFNewSDKAuthenticationViewController class]]) {
            isre = true;
            *stop = true;
        }
        
    }];
    

    if (isre == true) {
        return;
    }
 
    
        
        [[QF_Tool QF_weakVC].view addSubview:qf.view];
        [[QF_Tool QF_weakVC] addChildViewController:qf];
        qf.view.frame = [QF_Tool QF_weakVC].view.frame;
    qf.QF_NewSDKAuthenticationGoBack.hidden =  isbackButton;

    
}

@end
