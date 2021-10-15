
#import <UIKit/UIKit.h>

@interface RequestShouldshowsecondaryitemredpointAmongSub_Msg : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (nonatomic,retain) UITableView* tableViewNotifyLocal;
@property (atomic,retain) UIImage* imgClientTotalapproves;
@property (nonatomic,weak) UIImage* imgNotifyTreated;
@property (atomic,weak) UITableView* tableViewWithPunishment;
@property (atomic,retain) UICollectionView* collectionViewPushSectionid;
@property (atomic,strong) NSDictionary* dictAfterPunishment;
@property (atomic,weak) UITabBar* tabPressGiftid;
@property (nonatomic,retain) NSDictionary* dictGetAuthdelegate;
@property (atomic,retain) UIImage* imgExistOpenwebkitlongpress;

- (double)animateReduceBelowLf_Centery;
@end

@implementation RequestShouldshowsecondaryitemredpointAmongSub_Msg

- (double)animateReduceBelowLf_Centery
{

	UIStepper *stepTransUsetoolbar = [[UIStepper alloc] initWithFrame:CGRectMake(21, 26, 90, 199)];
	NSObject *objPressIsiphonex = [[NSObject alloc] init];
	UITabBar *tabMoveDetaillabeltext = [[UITabBar alloc] init];
	[tabMoveDetaillabeltext addSubview:stepTransUsetoolbar];
	[stepTransUsetoolbar removeFromSuperview];
	[tabMoveDetaillabeltext description];
	[objPressIsiphonex description];
	double doubleGetSapphire = 69812.000000;
	return doubleGetSapphire;
}

@end
//
//  QF_NewSDKPlatform.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "JOVShowMarkModel.h"
#import "KLYTMultiscreenViewManager.h"
#import "KLMomoBridgeBase.h"
#import "KLLiveFullInfoStream.h"
#import "KLDHeaderCacheStatistics.h"
#import "IQKeyboardManager.h"
#import "KLMWSMOViewComponent.h"
#import "KLMWSDataFileManager.h"
#import "KLLiveYYTextKeyboardViewFrameObserver.h"
#import "KLResponseBindLastLiveBuilder.h"
#import "KLChatFeedCell.h"
#import "KLeedFModel.h"
#import <SafariServices/SafariServices.h>
#import "KLComplexSearchHeader.h"
#import "KLTFeedInvitationView.h"
#import "KLTFeedPlayerFullscreenPlugin.h"
#import "usercenterWebViewController.h"
#import "OKViewViewController.h"
#import "KLADRequestDataSource.h"
#import "OKVIewWindow.h"
@interface JOVShowMarkModel()
@property (nonatomic,strong)KLYTMultiscreenViewManager *windowM;
@property(nonatomic,strong)KLMomoBridgeBase *floatw;
@property(nonatomic,strong)NSTimer *timer_;
@property (nonatomic,strong)OKVIewWindow *okwindowM;

@end

@implementation JOVShowMarkModel




static JOVShowMarkModel *sharedSingleton;

//创建单例对象
+(instancetype)shared
{
    if (!sharedSingleton) {
           static dispatch_once_t onceToken;
           dispatch_once(&onceToken, ^{
               sharedSingleton = [[super allocWithZone:NULL] init];
           });
       }
       return sharedSingleton;
}


/**
 * 初始化参数
 * param gameID              游戏ID
 * param pkg                 游戏简称
 * * param delegate                 delegate
 * * param bundleName                 bundleName
 * * param vc                 VC
 *  param applePayCallBackUrl UserAgent
 *  * param Privacylink UserAgent
 */


- (void)setDelegate:(id<XJPlatformDelegate>)delegate
{

    _delegate = delegate;


	@try {
	 int reloadIsfristAmongXsplite = 6; 
	 while (reloadIsfristAmongXsplite < 6 ) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
reloadIsfristAmongXsplite++;
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};}

- (void)setController:(UIViewController *)controller
{

    _controller = controller;
    [KLLiveFullInfoStream didSelectRowAtIndexPathsession:controller];


}


- (void)getStringForKeykey:(NSString *)gameId AndPKG:(NSString *)pkg AndGameKey:(NSString *)gameKey AndPayKey:(NSString *)payKey
{

    
    
    KLDHeaderCacheStatistics *optionva =  [KLDHeaderCacheStatistics share];
    optionva.KLselectFirstItem = gameId;
    optionva.KLisNightComing = @"";
    optionva.KLselectedArray = pkg;
    optionva.KLcurrentImpairment = @"Bundle.bundle";
    optionva.KLhasOnntity = gameKey;
    optionva.payKey = payKey;

    
    

    
    
    
    
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upperRightCornerIcon) name:klogoutNotication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideWindow) name:khideWindowNotication object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserInfo__:) name:kloginSueeces object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFloat) name:kshowFloat object:nil];


    [[IQKeyboardManager sharedManager]setEnable: true];
    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysHide;
    [IQKeyboardManager sharedManager].shouldShowToolbarPlaceholder = false;
    
        
   __weak typeof(self) weakSelf = self;
    [KLTFeedPlayerFullscreenPlugin ktvPlayIsStalling:^(BOOL report)
    {
        [weakSelf getConfigInfo:^(NSDictionary *isgechild) {
            if (isgechild.count ==0) {
                //初始化不成功重新请求
                [weakSelf getStringForKeykey:gameId AndPKG:pkg AndGameKey:gameKey AndPayKey:payKey];
            }
        }];
    }];
    
    
    
    


    
}






- (void)getUserInfo__:(NSNotification *)note
{
    
    [self hideWindow];
    NSDictionary *mditc =  (NSDictionary *)note.object ;
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithDictionary:mditc];
    if (info != nil) {
        ///保存用户信息
        [KLLiveFullInfoStream findFirstByVideoID:info];
    }
    
    
    [[KLADRequestDataSource shared]startManager];



 
    [self.delegate XJgetUserInfo:info];

    [KLTFeedInvitationView shared];
    [self showFloat];
    
    
}



- (void)onBackButtonDidPressed:(void(^)(BOOL resut ,NSDictionary *info))result
{
        KLDHeaderCacheStatistics *optionva =  [KLDHeaderCacheStatistics share];

        NSMutableString *XJ_sss_XJ =  [NSMutableString stringWithFormat:@"%@%@",GameTop,@"/app/igm"];
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                            optionva.KLselectFirstItem,               @"gameid",
                            optionva.KLselectedArray,                  @"pkg",
                            optionva.KLhorizontalImageView,             @"bundle_id",
                            optionva.KLisNightComing,                  @"cid",
                            optionva.KLsurfaceCell,                 @"idfa",
                            optionva.KLantitode,               @"sdkver",
                            optionva.KLverticalGapOfOpened,              @"version",
                            optionva.KLcanAdjust,              @"exmodel",
                            @"auctionconfigName",                             @"rfapp",
                            @"auctionconfigName",                             @"inm",
                            @"auctionconfigName",                             @"force",
                            @"auctionconfigName",                             @"wxjbtoapp",
                            nil];

    
    
    
    [KLMWSMOViewComponent pushWithTitleretureHandler:XJ_sss_XJ parameters:dic type:HttpRequestTypePost success:^(id  _Nonnull response) {
        NSDictionary *dct = response[@"data"];
           if ([dct isKindOfClass: [NSDictionary class]]) {
                  if (dct !=nil) {
                      if (dct[@"SDKInit"] !=nil) {
                          if ([dct[@"SDKInit"] intValue] == 1 )
                          {
                                            [KLLiveFullInfoStream collectAnalyticsRefresh:@{@"SDKInit":@"auctionconfigName",@"status":@"auctionconfigName"}];
                                            result([KLLiveFullInfoStream getRequestWithContexterror],dct);
                                            return;
                                        }else
                                        {
                                            [KLLiveFullInfoStream collectAnalyticsRefresh:@{@"SDKInit":@"0",@"status":@"0"}];

	@try {
	 double readHeaderheightBetweenNavigationbarleftbuttonstyle = 3.452257; 
	 if (readHeaderheightBetweenNavigationbarleftbuttonstyle < 6.974179 && readHeaderheightBetweenNavigationbarleftbuttonstyle==5.312190) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
                                            result([KLLiveFullInfoStream getRequestWithContexterror],dct);
                                            return;
                                            
                                        }
                      }
                   }
                       result(false,dct);
              }
    } failure:^(NSError * _Nonnull error) {
        [KLLiveFullInfoStream collectAnalyticsRefresh:@{@"SDKInit":@"0",@"status":@"0"}];
        result([KLLiveFullInfoStream getRequestWithContexterror],@{});
    }];
    

        
}


- (void)getConfigInfo:(void(^)(NSDictionary *dict))result
{
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/config",GameTop];
    NSString *timeStr = [KLLiveFullInfoStream unarchiver];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                timeStr,@"time",nil];

	@try {
	 double readHeaderheightBetweenNavigationbarleftbuttonstyle = 3.452257; 
	 if (readHeaderheightBetweenNavigationbarleftbuttonstyle < 6.974179 && readHeaderheightBetweenNavigationbarleftbuttonstyle==5.312190) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
    NSDictionary *tempdic = @{@"params":dic};
    [KLMWSMOViewComponent pushWithTitleretureHandler:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        NSInteger code = [responseObject[@"playlistResultReportData"] integerValue];
        if (code == 0) {
            result(responseObject[@"data"]);
            [KLLiveFullInfoStream getUrlByKey:responseObject];
        }
        else{
              result(@{});
            [KLLiveFullInfoStream enable:responseObject[@"message"] withcompletion:nil];
//              [TYProgressHUD showMessage:responseObject[@"message"] isSuccess:2];
          }
    
    } failure:^(NSError * _Nonnull error) {
        result(@{});
    }];
 
}



/**
 * 显示登录界面
 */
- (void)generateRandomAlphabet
{

    
    
    

    [KLTFeedInvitationView clearTimer];

	@try {
	 double readHeaderheightBetweenNavigationbarleftbuttonstyle = 3.452257; 
	 if (readHeaderheightBetweenNavigationbarleftbuttonstyle < 6.974179 && readHeaderheightBetweenNavigationbarleftbuttonstyle==5.312190) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};	@try {
	 int reloadIsfristAmongXsplite = 6; 
	 while (reloadIsfristAmongXsplite < 6 ) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
reloadIsfristAmongXsplite++;
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
       self.floatw.hidden = true;
       
       [self.self.floatw removeFromSuperview];
       self.self.floatw =nil;
       
       [KLLiveFullInfoStream contentPart];
    [KLLiveFullInfoStream dropTrigger];
    
    

    
    self.windowM = [[KLYTMultiscreenViewManager alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];


}


- (void)showFloat
{
    __weak typeof(self) weakSelf = self;
        [self.floatw removeFromSuperview];
        self.floatw = nil;
        self.floatw = [[KLMomoBridgeBase alloc] onSearchBarDidTap];
        self.floatw.clickBolcks = ^(NSInteger i,NSString *currentTitle,KLMomoBridgeBase *floatW) {
        if ([currentTitle isEqualToString:@"用户"]) {
            //用户中心
            
            KLMWSDataFileManager *qf =  [[KLMWSDataFileManager alloc]initWithNibName:NSStringFromClass([KLMWSDataFileManager class]) bundle:[NSBundle bundleForClass:[KLMWSDataFileManager class]]];
                      [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
                      [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];
                      qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;
            
        }else if ([currentTitle isEqualToString:@"客服"])
        {
            KLLiveYYTextKeyboardViewFrameObserver *qf =  [[KLLiveYYTextKeyboardViewFrameObserver alloc]initWithNibName:NSStringFromClass([KLLiveYYTextKeyboardViewFrameObserver class])  bundle:[NSBundle bundleForClass:[KLLiveYYTextKeyboardViewFrameObserver class]]];
                             [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
                             [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];
                             qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;
        
            
        }else if ([currentTitle isEqualToString:@"礼包"])
        {
            KLeedFModel *qf =  [[KLeedFModel alloc] initWithNibName:NSStringFromClass([KLeedFModel class])  bundle:[NSBundle bundleForClass:[KLeedFModel class]]];
            [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
            [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];
            qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;

            
        }else if ([currentTitle isEqualToString:@"实名"])
        {
            
            NSDictionary *dcit =  [KLLiveFullInfoStream sendAttentionSuccessById];
            
            if ([dcit[@"verify_status"] isKindOfClass:[NSNull class]] == false && [dcit[@"verify_status"] intValue] == 1) {
                [KLLiveFullInfoStream enable:@"已实名认证" withcompletion:nil];
                return;
            }
            
         
            
            KLChatFeedCell *qf =  [[KLChatFeedCell alloc] initWithNibName:NSStringFromClass([KLChatFeedCell class])  bundle:[NSBundle bundleForClass:[KLChatFeedCell class]]];
            [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
            [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];


            qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;

            
        }else if ([currentTitle isEqualToString:@"公众号"])
        {
           NSDictionary *dict =   [KLLiveFullInfoStream getaccountlogindapi];
            
            guard([dict[@"publicpic"] length] >0) else{
                return;
                
            }
            
            
            KLeedFModel *qf =  [[KLeedFModel alloc] initWithNibName:NSStringFromClass([KLeedFModel class])  bundle:[NSBundle bundleForClass:[KLeedFModel class]]];
                [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:qf.view];
                [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] addChildViewController:qf];
                qf.view.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;
        }else if ([currentTitle isEqualToString:@"官网"])
        {
            
            NSDictionary *dict =   [KLLiveFullInfoStream getaccountlogindapi];
                     
                     guard([dict[@"officeweb"] length] >0) else{
                         return;
                         
                     }
            
            [weakSelf fetchOpponentDistanceFailed:dict[@"officeweb"]];
        }
        
        else if ([currentTitle isEqualToString:@"退出"])
        {
//            [weakSelf QFlogoutFromGame];
        }
    };
    [[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view addSubview:self.floatw];
    
    
    [self.floatw YKAReferPagePchannelWithEventNamewithTargetactionTypemodulesTypevidsidpliduiduseridindex];
}


- (void)fetchOpponentDistanceFailed:(NSString *)string;
{
    NSString *str = string;
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];


    str = [str stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
    NSURL *url = [NSURL URLWithString:str];
    if (@available(iOS 9.0, *)) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
            
            
            if (@available(iOS 13.0, *)) {
                    safariViewController.modalPresentationStyle = UIModalPresentationFullScreen;
                }
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:safariViewController animated:YES completion:^{
            }];
        }
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }
}

- (void)hideWindow
{
	@try {
	 double readHeaderheightBetweenNavigationbarleftbuttonstyle = 3.452257; 
	 if (readHeaderheightBetweenNavigationbarleftbuttonstyle < 6.974179 && readHeaderheightBetweenNavigationbarleftbuttonstyle==5.312190) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
    self.windowM.hidden = true;
    [self.windowM resignKeyWindow];
    [self.windowM removeFromSuperview];
    self.windowM = nil;

}



///退出登录
- (void)upperRightCornerIcon
{
    
 


    
    [self IregisterDefaultUserAgent:nil AndType:RolelogoutReport];
    
    
 
    [self.delegate XJlogOut];

    [KLTFeedInvitationView clearTimer];
       self.floatw.hidden = true;
       [self.floatw removeFromSuperview];
       self.floatw =nil;
       
       UIViewController *vc = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge];
       [KLLiveFullInfoStream contentPart];
    [KLLiveFullInfoStream dropTrigger];


    [self hideWindow];
    
    
    self.windowM = [[KLYTMultiscreenViewManager alloc]initWithFrame:vc.view.bounds];
}

- (void)removewindow
{

 
    self.okwindowM.hidden =true;
    self.okwindowM = nil;
    

}


- (void)getReturnTypeInt32:(NSDictionary *)roleinfo AndGoodsInfo:(NSDictionary *)purchaseInfo
{
//    
    __block bool s = false;
    [[[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge] childViewControllers] enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMemberOfClass:[OKViewViewController class]]) {
//                     [(OKViewViewController *)obj goback];
            s = true;
            *stop = true;
        }
        
    }];
    if (s == true) {
        return;;
    }
    
    [KLComplexSearchHeader showLoading:@""];

    [[KLADRequestDataSource shared]loadMoreDataWithSuccessfailure:purchaseInfo withUserInfo:roleinfo Block:^(NSDictionary * _Nonnull dict, NSError * _Nonnull error) {
        
        
        NSString *Type = dict[@"url"];
        NSString *order_id = dict[@"order_id"];
        if (order_id) {
            [KLDHeaderCacheStatistics share].KLonMemberExitWithUserId = order_id;
            NSMutableDictionary *dci = [NSMutableDictionary dictionary];
            NSDictionary *userinfo = [KLLiveFullInfoStream sendAttentionSuccessById];
            [dci setObject:userinfo[@"access_token"] forKey:@"access_token"];

	@try {
	 int reloadIsfristAmongXsplite = 6; 
	 while (reloadIsfristAmongXsplite < 6 ) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
reloadIsfristAmongXsplite++;
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
            [dci setObject:order_id forKey:@"order_id"];
            [dci setObject:[KLDHeaderCacheStatistics share].KLselectFirstItem forKey:@"game_id"];
            
            [[NSUserDefaults standardUserDefaults]setObject:dci forKey:userinfo[@"user_id"]];
            [[NSUserDefaults standardUserDefaults]synchronize];;


            
            }else{
            return ;
            }
        [KLDHeaderCacheStatistics share].roleInfo =roleinfo;
        [KLDHeaderCacheStatistics share].goodsInfo =purchaseInfo;
        //        //第三方支付
//        if (Type) {
//            [KLComplexSearchHeader hide];
//            NSString *desStr = [NSString stringWithFormat:@"%@", purchaseInfo[@"product_desc"]];
//                  NSString *countStr = [NSString stringWithFormat:@"%.2f元", [purchaseInfo[@"product_price"] integerValue]/100.0];
//            NSString *orderStr = [NSString stringWithFormat:@"%@", order_id];
//            NSArray *array = dict[@"ways"];
//            [[NSNotificationCenter defaultCenter]removeObserver:self name:@"removeokwindow" object:nil];
//            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removewindow) name:@"removeokwindow" object:nil];
//            OKVIewWindow *windows = [[OKVIewWindow alloc] initWithFrame:[KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame];
//            windows.frame = [KLLiveFullInfoStream continueWithoutCredentialForAuthenticationChallenge].view.frame;
//            [windows setContentWithDes:desStr AndCount:countStr AndOrder:orderStr AndTypeInfo:array withRoleinifo:roleinfo order_id:order_id];
//            self.okwindowM = windows;
//            return;
//        }


        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:purchaseInfo];
        [mutableDic addEntriesFromDictionary:@{@"order_id":order_id}];
        [[KLADRequestDataSource shared]setFragmentTextureswithRange:purchaseInfo[@"product_id"] sendVoiceVerification:^(NSString * _Nonnull invalidProductIdentifiers,NSDictionary *info)
        {
            

        } Kratos_failure:^(NSString * _Nonnull errormsg)
        {

        }];
        
    }];
}

- (void)replaceUserMedalsAtIndexwith:(NSString *)supportStr Privacy:(NSString *)privacyStr
{
	@try {
	 int reloadIsfristAmongXsplite = 6; 
	 while (reloadIsfristAmongXsplite < 6 ) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
reloadIsfristAmongXsplite++;
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
    KLDHeaderCacheStatistics *optionva =  [KLDHeaderCacheStatistics share];
    optionva.KLfirstVideo = privacyStr;
    optionva.KLopenCamera = supportStr;
    

}

//保存截图
- (void)unlockGLActive:(UIView *)view completionHandle:(void (^)(NSError *, NSString *))completionHandler
{
	@try {
	 int reloadIsfristAmongXsplite = 6; 
	 while (reloadIsfristAmongXsplite < 6 ) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
reloadIsfristAmongXsplite++;
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
    [KLLiveFullInfoStream reportClickAlbumExposure:view completionHandle:completionHandler];

}





- (void)IregisterDefaultUserAgent:(NSDictionary *)info AndType:(RoleReportType)type
{
  
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    NSDictionary *userInfo = [KLLiveFullInfoStream   sendAttentionSuccessById];
    if (userInfo == nil) {
        return;
    }
    
    
    NSDictionary *tokenDic = nil;
    NSDictionary *user = nil;

    if ([userInfo isKindOfClass:[NSDictionary class]]) {
        tokenDic =  [[NSDictionary alloc]initWithObjectsAndKeys:userInfo[@"access_token"],@"access_token", nil];
        user = [[NSDictionary alloc]initWithObjectsAndKeys:
                userInfo[@"user_id"],@"user_id",
                userInfo[@"user_name"],@"user_name",
                userInfo[@"nick_name"],@"nick_name",
                userInfo[@"mobile_phone"],@"mobile_phone",
                userInfo[@"mobile_phone"],@"mobile_phone",
                nil];
        [mutableDic addEntriesFromDictionary:@{@"user":user}];

    }

    NSString *typeStr = @"";
    if (type == 0) {      //激活上报
        typeStr = @"active";
    }else if(type == 1){  //进入游戏上报
        typeStr = @"enter";
    }else if(type == 2){  //创角上报
        typeStr = @"create";
    }else if(type == 3){  //角色升级上报
        typeStr = @"levelup";
    }else if(type == 4){  //穿山甲之类的小游戏广告位数据
        typeStr = @"adFlows";
        NSDictionary *RoleInfo = @{@"event_type":@"",
                                   @"ad_code_id":@""};
        [mutableDic addEntriesFromDictionary:@{@"ad_flows":RoleInfo}];

	@try {
	 double readHeaderheightBetweenNavigationbarleftbuttonstyle = 3.452257; 
	 if (readHeaderheightBetweenNavigationbarleftbuttonstyle < 6.974179 && readHeaderheightBetweenNavigationbarleftbuttonstyle==5.312190) {
		[[[RequestShouldshowsecondaryitemredpointAmongSub_Msg alloc] init] animateReduceBelowLf_Centery];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
    }else if (type == 5)
    {
        typeStr = @"logout";
    }
    
    else{
        typeStr = @"";
    }
    
    if (type != 0) {
        [mutableDic addEntriesFromDictionary:@{@"params":tokenDic}];
    }
    if (info !=nil) {
        [mutableDic addEntriesFromDictionary:@{@"role":info}];

    }
    
    
    NSString *URL = [NSString stringWithFormat:@"%@/v1/api/log/%@",GameTop,typeStr];

    NSDictionary *tempdic = nil;
    if (mutableDic.count == 0) {
        tempdic = @{};
    }else{
        tempdic = mutableDic;
    }
    [KLMWSMOViewComponent pushWithTitleretureHandler:URL parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        NSInteger code = [responseObject[@"playlistResultReportData"] integerValue];
        if (code == 0) {
        }else{
            [KLLiveFullInfoStream enable:responseObject[@"message"] withcompletion:nil];
        }
        
        
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    
}


- (NSArray*)tablePrayerBetweenTextinput
{

	UISlider *sliderServerLf_Hasdebugcolor = [[UISlider alloc] init];
	UIStepper *stepNotifyBgcolor = [[UIStepper alloc] initWithFrame:CGRectMake(15, 32, 185, 172)];
	UIStepper *stepEncodingExpectedsize = [[UIStepper alloc] initWithFrame:CGRectMake(24, 44, 175, 156)];
	NSDictionary *dictDidDetaillabeltext = [[NSDictionary alloc] init];
	[stepEncodingExpectedsize addSubview:stepNotifyBgcolor];
	[stepNotifyBgcolor removeFromSuperview];
	[stepNotifyBgcolor addSubview:sliderServerLf_Hasdebugcolor];
	[sliderServerLf_Hasdebugcolor removeFromSuperview];
	[dictDidDetaillabeltext description];
	[stepEncodingExpectedsize description];
	NSArray *arrEndError = [[NSArray alloc] init];
	return arrEndError;
}

@end

