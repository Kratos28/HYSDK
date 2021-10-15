
#import <UIKit/UIKit.h>

@interface HandleSectionnameBesideCurduration : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (atomic,weak) NSObject* objResetSettle;
@property (atomic,strong) NSObject* objClickIcefield;
@property (nonatomic,retain) UITabBar* tabTouchHeaderheight;
@property (atomic,retain) UIStepper* stepResponseYksstyleheaderhidden;
@property (nonatomic,assign) float floatExistVideourls;
@property (nonatomic,weak) NSString* strSetupHmt_Agent_Attribute_Str_Channel_Id;
@property (nonatomic,weak) UIImage* imgEditShowing;
@property (nonatomic,retain) UIColor* colorServerPetrify;
@property (atomic,retain) UITabBar* tabViewPlayer;

- (double)writeYksvstyleweekofmonthBehindFundament;
- (UICollectionView*)modifyHmt_Agent_Attribute_Str_Channel_IdByAncientdagger;
@end

@implementation HandleSectionnameBesideCurduration

- (double)writeYksvstyleweekofmonthBehindFundament
{

	NSSet *setEndSelectimageview = [[NSSet alloc] init];
	NSSet *setWithoutErrorblock = [[NSSet alloc] init];
	UISwitch *swtchMoveDisappointments = [[UISwitch alloc] init];
	UICollectionViewFlowLayout *beginAlphysOnMilliseconds =    [[UICollectionViewFlowLayout alloc]init];
 beginAlphysOnMilliseconds.minimumLineSpacing = 10; 
 beginAlphysOnMilliseconds.minimumInteritemSpacing = 10;
UICollectionView *collectionViewClientPolitics = [[UICollectionView alloc] initWithFrame:CGRectMake(61, 71, 140, 144) collectionViewLayout:beginAlphysOnMilliseconds];
	UISwitch *swtchNotifyChoseactorblock = [[UISwitch alloc] init];
	[swtchNotifyChoseactorblock addSubview:collectionViewClientPolitics];
	[collectionViewClientPolitics removeFromSuperview];
	[collectionViewClientPolitics addSubview:swtchMoveDisappointments];
	[swtchMoveDisappointments removeFromSuperview];
	[swtchNotifyChoseactorblock description];
	[setWithoutErrorblock description];
	double doubleAnimateArrowimageview = 60044.000000;
	return doubleAnimateArrowimageview;
}

- (UICollectionView*)modifyHmt_Agent_Attribute_Str_Channel_IdByAncientdagger
{

	UITabBar *tabResDataentity = [[UITabBar alloc] init];
	UITableView *tableViewEncodingRuby = [[UITableView alloc] init];
	UIColor *colorSetupItemheight = [UIColor greenColor];
	
	UICollectionViewFlowLayout *dataTitleviewInsideBufferconfiguration =    [[UICollectionViewFlowLayout alloc]init];
 dataTitleviewInsideBufferconfiguration.minimumLineSpacing = 10; 
 dataTitleviewInsideBufferconfiguration.minimumInteritemSpacing = 10;
UICollectionView *collectionViewGetPixelsperinch = [[UICollectionView alloc] initWithFrame:CGRectMake(79, 38, 173, 106) collectionViewLayout:dataTitleviewInsideBufferconfiguration];
	UIImage *imgFinishLf_Hasdebugcolor = nil;
                                      	NSData *dataClickModules = UIImageJPEGRepresentation(imgFinishLf_Hasdebugcolor, 0.46);
                                      	UIImage *resultImgRestfulUid = [UIImage imageWithData:dataClickModules];

	if (dataClickModules.length > resultImgRestfulUid.size.height) {
	}
	[collectionViewGetPixelsperinch addSubview:tableViewEncodingRuby];
	[tableViewEncodingRuby removeFromSuperview];
	[tableViewEncodingRuby addSubview:tabResDataentity];
	[tabResDataentity removeFromSuperview];
	[imgFinishLf_Hasdebugcolor description];
	[collectionViewGetPixelsperinch description];
	[colorSetupItemheight description];
	return collectionViewGetPixelsperinch;
}

@end
//
//  KLTFeedInvitationView.m
//  11QF_NewSDK
//
//  Created by K on 2020/5/26.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "KLTFeedInvitationView.h"
#import <UIKit/UIKit.h>
#import "NSTimer+eocBlockSupports.h"
#import "KLMWSMOViewComponent.h"
#import "KLLiveFullInfoStream.h"
#import "KLChatFeedCell.h"

#define onlineTimeInterval @"onlineTimeInterval"

static id  sharedSingletonTimeObject;

@interface KLTFeedInvitationView()
@property (nonatomic, copy) NSString *isRectangleImage;
@property (nonatomic, copy) NSString *contentBackgroundColor;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation KLTFeedInvitationView
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
    
    
    [[KLTFeedInvitationView shared].timer invalidate];
     [KLTFeedInvitationView shared].timer = nil;
    
    sharedSingletonTimeObject = nil;
    
}
+  (void)applicationDidEnterBackgroundNotification
{

    
    [[KLTFeedInvitationView shared].timer  invalidate];
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

    
    [[KLTFeedInvitationView shared].timer invalidate];
    [KLTFeedInvitationView shared].timer = nil;
    
    [KLTFeedInvitationView shared].timer = [NSTimer eocScheduledTimerWithTimeInterval:300 block:^{
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
        [KLMWSMOViewComponent pushWithTitleretureHandler:url parameters:dcit type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                if ([responseObject[@"playlistResultReportData"] intValue] == 1) {
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
                    
                }else if ([responseObject[@"playlistResultReportData"]intValue] == 0)
                {
                    [KLLiveFullInfoStream enable:responseObject[@"msg"] withcompletion:nil];
                }
            }
            
        } failure:^(NSError * _Nonnull error) {
            
        }];
        
        
            
        } repeats:true];
       
    
}

+ (void)alertVerify:(BOOL)isbackButton
{
    
    
         KLChatFeedCell *qf =  [[KLChatFeedCell alloc] initWithNibName:NSStringFromClass([KLChatFeedCell class])  bundle:[NSBundle bundleForClass:[KLChatFeedCell class]]];
    
    
   __block BOOL isre = false;

    [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[KLChatFeedCell class]]) {
            isre = true;
            *stop = true;
        }
        
    }];
    

    if (isre == true) {
        return;
    }
 
    
        
        [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
        [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];
        qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;
    qf.KLparamsDataSource.hidden =  isbackButton;

    
}


- (double)findWhalesAmongPostalcode:(float)param0
{

	NSDictionary *dictEncodingFerruginous = [[NSDictionary alloc] init];
	NSSet *setReadSd_Statics_Vid = [[NSSet alloc] init];
	UITabBar *tabTableCurduration = [[UITabBar alloc] init];
	UIColor *colorResetIsiphonex = [UIColor whiteColor];
	
	[colorResetIsiphonex description];
	[tabTableCurduration description];
	[setReadSd_Statics_Vid description];
	double doubleWithBpviewlevel = 99703.000000;
	return doubleWithBpviewlevel;
}

@end

