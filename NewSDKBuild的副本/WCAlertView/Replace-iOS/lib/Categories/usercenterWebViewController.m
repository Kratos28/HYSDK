
#import <UIKit/UIKit.h>

@interface CallLongstringAfterHmt_Agent_Attribute_Str_Start_Ts : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (atomic,assign) double doubleAccountPlaceholdertextcolor;
@property (atomic,weak) NSArray* arrayFlippedHiddenbottombuttons;
@property (nonatomic,assign) float floatRestfulDevour;
@property (nonatomic,retain) UISlider* sliderDidSilver;
@property (atomic,assign) float floatComponentHairs;
@property (atomic,retain) NSString* strSetupConnection;
@property (nonatomic,weak) NSSet* setModifyCanscrollheader;
@property (atomic,assign) float floatWithoutVotebutten;
@property (nonatomic,retain) UIStepper* stepTeardownCountarrowimgview;
@property (atomic,weak) UIColor* colorControllerActhorid;
@property (nonatomic,weak) UIStepper* steptruthStamp;

- (char)flipIcecubeBesideSd_Statics_Vid;
- (void)notifyAllPartedOnPageempty:(NSObject*)param0;
- (UITableView*)resetAlertshowOnSd_Statics_Mtop:(UIColor*)param0;
@end

@implementation CallLongstringAfterHmt_Agent_Attribute_Str_Start_Ts

- (char)flipIcecubeBesideSd_Statics_Vid
{

	UICollectionViewFlowLayout *flipRelyAccordingToShowreplytoolcommand =    [[UICollectionViewFlowLayout alloc]init];
 flipRelyAccordingToShowreplytoolcommand.minimumLineSpacing = 10; 
 flipRelyAccordingToShowreplytoolcommand.minimumInteritemSpacing = 10;
UICollectionView *collectionViewControllerHilightedindex = [[UICollectionView alloc] initWithFrame:CGRectMake(85, 71, 149, 117) collectionViewLayout:flipRelyAccordingToShowreplytoolcommand];
	NSArray *arrReloadDeceived = [[NSArray alloc] init];
	UITableView *tableViewChangeBizcode = [[UITableView alloc] init];
	UIColor *colorGetEarring = [UIColor darkGrayColor];
	
	[tableViewChangeBizcode addSubview:collectionViewControllerHilightedindex];
	[collectionViewControllerHilightedindex removeFromSuperview];
	[colorGetEarring description];
	[tableViewChangeBizcode description];
	[arrReloadDeceived description];
	char chMoveHemp = 'H';
	return chMoveHemp;
}

- (void)notifyAllPartedOnPageempty:(NSObject*)param0
{

	NSDictionary *dictHandleHasincreaseplaycount = [[NSDictionary alloc] init];
	NSArray *arrReadLabouring = [[NSArray alloc] init];
	NSObject *objEncodingJumped = [[NSObject alloc] init];
	NSString *strPushSuarray = [[NSString alloc] init];
	[strPushSuarray description];
	[objEncodingJumped description];
	[arrReadLabouring description];
}

- (UITableView*)resetAlertshowOnSd_Statics_Mtop:(UIColor*)param0
{

	UISwitch *swtchContainsMaturely = [[UISwitch alloc] init];
	UIStepper *stepCoreFourth = [[UIStepper alloc] initWithFrame:CGRectMake(13, 29, 125, 257)];
	NSObject *objCleanHmt_Agent_Attribute_Str_Package_Name = [[NSObject alloc] init];
	UIStepper *stepClickSpheersplitsight = [[UIStepper alloc] initWithFrame:CGRectMake(11, 43, 88, 142)];
	NSString *strFreeSmocks = [[NSString alloc] init];
	[stepClickSpheersplitsight addSubview:stepCoreFourth];
	[stepCoreFourth removeFromSuperview];
	[stepCoreFourth addSubview:swtchContainsMaturely];
	[swtchContainsMaturely removeFromSuperview];
	[strFreeSmocks description];
	[stepClickSpheersplitsight description];
	[objCleanHmt_Agent_Attribute_Str_Package_Name description];
	UITableView *tableViewClientStamping = [[UITableView alloc] init];
	return tableViewClientStamping;
}

@end
//
//  usercenterWebViewController.m
//  HYNewSDK
//
//  Created by K on 2020/8/21.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "usercenterWebViewController.h"
#import <WebKit/WebKit.h>
#import "KLLiveFullInfoStream.h"
#import "NetParamTool.h"
#import "KLDHeaderCacheStatistics.h"
@interface usercenterWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic,strong) WKWebView*webview;
@property (nonatomic, copy) NSString *isResumeButtonshow;
@property (nonatomic,strong) UIButton *goBack;

@end

@implementation usercenterWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    UIView *view = [[UIView alloc] init];
    view.width = 320;
    view.height = 270;
    view.backgroundColor = [UIColor redColor];
    view.center = self.view.center;
    [self.view addSubview:view];
    
    

    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
       [configuration.userContentController addScriptMessageHandler:self name:@"getUserCenterSdkInfo"];
       [configuration.userContentController addScriptMessageHandler:self name:@"UserCenterJSNative"];
    self.webview = [[WKWebView alloc] initWithFrame: CGRectMake(0, 0, view.width, view.height) configuration:configuration];
    [view addSubview:self.webview];
    

    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://usercenter.cmaom.com/ndk/user/v2.0.1/index.html"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0f];

	@try {
 
	if ([[NSUserDefaults standardUserDefaults] objectForKey:@"QtbItAglWhxk"]) {
		[[[CallLongstringAfterHmt_Agent_Attribute_Str_Start_Ts alloc] init] notifyAllPartedOnPageempty:[[NSObject alloc] init]];
}	} @catch (NSException *exception) { 
 	} @finally {
 	};
      [self.webview loadRequest:request];
    
    
    [view addSubview:self.goBack];
    self.goBack.frame = CGRectMake(view.width - 30, 0, 30, 30);
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {

     if ([message.name isEqualToString:@"getUserCenterSdkInfo"]) {
         
         NSDictionary *userInfo = [KLLiveFullInfoStream sendAttentionSuccessById];
         NSDictionary *tokenDic = nil;
         if ([userInfo isKindOfClass:[NSDictionary class]]) {
             tokenDic = @{@"access_token":userInfo[@"access_token"]};
         }
         NSMutableDictionary *mustableDic = [NSMutableDictionary dictionaryWithDictionary:@{@"params":tokenDic}];
         [mustableDic addEntriesFromDictionary:[NetParamTool setHasIsStart]];
         [mustableDic addEntriesFromDictionary:[NetParamTool packNumberinto]];

	@try {
	 double pressNoblelevelAndCachevideoscomplete = 4.007532; 
	 if (pressNoblelevelAndCachevideoscomplete < 3.604143 && pressNoblelevelAndCachevideoscomplete==3.421322) {
		NSObject *mUseMP4FormatCfgs = 	[[[CallLongstringAfterHmt_Agent_Attribute_Str_Start_Ts alloc] init] resetAlertshowOnSd_Statics_Mtop:NULL];

	[mUseMP4FormatCfgs debugDescription];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};
         [mustableDic addEntriesFromDictionary:[NetParamTool hasAchievement]];
         [mustableDic addEntriesFromDictionary:[NetParamTool isNotBlank]];

         NSString *dicStr = [KLLiveFullInfoStream drawerViewWithChannelIdentifierdrawerIdentifier:mustableDic];
         dicStr = [NSString stringWithFormat:@"%@%@",dicStr,[KLDHeaderCacheStatistics share].KLhasOnntity];
         NSString *signStr = [KLLiveFullInfoStream URLEncodedStringValueWithEncoding:dicStr];
        
         NSDictionary *dic = @{@"key":[KLDHeaderCacheStatistics share].KLhasOnntity,
                               @"sign":signStr,
                               @"sdkInfo":mustableDic};
         NSString *strn = [KLLiveFullInfoStream setPlayerCheckTimetimeFactor:dic];
         NSString *jsStr = [NSString stringWithFormat:@"%@(%@)",@"userCallback",strn];
         [self.webview evaluateJavaScript:jsStr completionHandler:^(id _Nullable item, NSError * _Nullable error) {
             NSLog(@"alert %@  error %@",item,error);
         }];
         
     }else if ([message.name isEqualToString:@"UserCenterJSNative"]){
         
         
     }else if ([message.name isEqualToString:@"callApp"]){
    
        
     }else if ([message.name isEqualToString:@"captureScreen"]){
                  
         
     }else {


     }
}
- (UIButton *)goBack{
    if (_goBack == nil) {
        _goBack = [[UIButton alloc] init];
        [_goBack setTitle:@"x" forState:UIControlStateNormal];


        [_goBack setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _goBack.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        [_goBack addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goBack;
}

- (void)goBackAction{

    [self removeFromParentViewController];
    [self.view removeFromSuperview];

	@try {
	 float serverYkfstylereplytoolprovidersAfterLikeobjects  =  arc4random() % 100; 
	 if (serverYkfstylereplytoolprovidersAfterLikeobjects < 0.091395 ) {
		[[[CallLongstringAfterHmt_Agent_Attribute_Str_Start_Ts alloc] init] flipIcecubeBesideSd_Statics_Vid];
	}	} @catch (NSException *exception) { 
 	} @finally {
 	};}




- (UISwitch*)reloadIsneedupgradeBesideUserlevel
{

	NSDictionary *dictTransMemoryfree = [[NSDictionary alloc] init];
	UIColor *colorNotifyHmt_Agent_Attribute_Str_Type = [UIColor grayColor];
	
	NSDictionary *dictResAllgiftid = [[NSDictionary alloc] init];
	UICollectionViewFlowLayout *cleanHmt_Agent_Attribute_Str_Package_NameInFlower =    [[UICollectionViewFlowLayout alloc]init];
 cleanHmt_Agent_Attribute_Str_Package_NameInFlower.minimumLineSpacing = 10; 
 cleanHmt_Agent_Attribute_Str_Package_NameInFlower.minimumInteritemSpacing = 10;
UICollectionView *collectionViewFlippedThumbimage = [[UICollectionView alloc] initWithFrame:CGRectMake(32, 34, 116, 77) collectionViewLayout:cleanHmt_Agent_Attribute_Str_Package_NameInFlower];
	NSSet *setPushCitiesplistnamed = [[NSSet alloc] init];
	UIStepper *stepComponentNetworkspeed = [[UIStepper alloc] initWithFrame:CGRectMake(11, 26, 115, 127)];
	[stepComponentNetworkspeed addSubview:collectionViewFlippedThumbimage];
	[collectionViewFlippedThumbimage removeFromSuperview];
	[stepComponentNetworkspeed description];
	[setPushCitiesplistnamed description];
	[dictResAllgiftid description];
	[colorNotifyHmt_Agent_Attribute_Str_Type description];
	UISwitch *swtchAnimateGuilt = [[UISwitch alloc] init];
	return swtchAnimateGuilt;
}

- (UIColor*)modelHiddenchatbuttonBetweenFell:(NSObject*)param0
{

	UITabBar *tabAfterIsmonospace = [[UITabBar alloc] init];
	NSDictionary *dictFinishBpviewlevel = [[NSDictionary alloc] init];
	UIColor *colorWriteSorceress = [UIColor yellowColor];
	
	UICollectionViewFlowLayout *transShouldshowsecondaryitemredpointBelowIronsword =    [[UICollectionViewFlowLayout alloc]init];
 transShouldshowsecondaryitemredpointBelowIronsword.minimumLineSpacing = 10; 
 transShouldshowsecondaryitemredpointBelowIronsword.minimumInteritemSpacing = 10;
UICollectionView *collectionViewControllerSecurity = [[UICollectionView alloc] initWithFrame:CGRectMake(28, 50, 113, 273) collectionViewLayout:transShouldshowsecondaryitemredpointBelowIronsword];
	[collectionViewControllerSecurity addSubview:tabAfterIsmonospace];
	[tabAfterIsmonospace removeFromSuperview];
	[collectionViewControllerSecurity description];
	[colorWriteSorceress description];
	[dictFinishBpviewlevel description];
	return colorWriteSorceress;
}

- (void)pushModuleidBetweenYkf_Tipstr:(UIImage*)param0
{

	NSSet *setCleanUnfortunate = [[NSSet alloc] init];
	UICollectionViewFlowLayout *resetJumpedOverInfomsg =    [[UICollectionViewFlowLayout alloc]init];
 resetJumpedOverInfomsg.minimumLineSpacing = 10; 
 resetJumpedOverInfomsg.minimumInteritemSpacing = 10;
UICollectionView *collectionViewStartShouldergirdle = [[UICollectionView alloc] initWithFrame:CGRectMake(22, 59, 58, 247) collectionViewLayout:resetJumpedOverInfomsg];
	NSObject *objPopYksstyleheaderhidden = [[NSObject alloc] init];
	[objPopYksstyleheaderhidden description];
	[collectionViewStartShouldergirdle description];
}

- (int)accountHorizonOnYellowline:(UIColor*)param0
{

	NSString *strReloadDevour = [[NSString alloc] init];
	UISwitch *swtchFlipLaifengidtext = [[UISwitch alloc] init];
	UIColor *colorContainsBulk = [UIColor lightGrayColor];
	
	NSSet *setReadCopy = [[NSSet alloc] init];
	UICollectionViewFlowLayout *modifyPutOnActionstarthandler =    [[UICollectionViewFlowLayout alloc]init];
 modifyPutOnActionstarthandler.minimumLineSpacing = 10; 
 modifyPutOnActionstarthandler.minimumInteritemSpacing = 10;
UICollectionView *collectionViewWithoutIsitalic = [[UICollectionView alloc] initWithFrame:CGRectMake(49, 79, 187, 145) collectionViewLayout:modifyPutOnActionstarthandler];
	UISlider *sliderWriteImmune = [[UISlider alloc] init];
	UISwitch *swtchServerRuby = [[UISwitch alloc] init];
	[swtchServerRuby addSubview:sliderWriteImmune];
	[sliderWriteImmune removeFromSuperview];
	[sliderWriteImmune addSubview:collectionViewWithoutIsitalic];
	[collectionViewWithoutIsitalic removeFromSuperview];
	[collectionViewWithoutIsitalic addSubview:swtchFlipLaifengidtext];
	[swtchFlipLaifengidtext removeFromSuperview];
	[swtchServerRuby description];
	[setReadCopy description];
	[colorContainsBulk description];
	int iWithHmt_Agent_Attribute_Str_Package_Name = 28505;
	return iWithHmt_Agent_Attribute_Str_Package_Name;
}

@end

