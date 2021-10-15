
#import <UIKit/UIKit.h>

@interface PushGiftimageurlOverPetrify : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (nonatomic,weak) UIImage* imgFlippedUnsendcount;
@property (atomic,assign) char chPopLevel;
@property (nonatomic,strong) UIColor* colorDataNavigationbartitleviewstyle;
@property (atomic,strong) NSObject* objResPunishment;
@property (atomic,retain) UITableView* tableViewClientConfig;
@property (atomic,assign) float floatTableGuidetextimageview;
@property (atomic,retain) UISwitch* swtchResponseSuperadministrator;

- (NSDictionary*)popPaddingUntilChoseactorblock:(UISlider*)param0;
@end

@implementation PushGiftimageurlOverPetrify

- (NSDictionary*)popPaddingUntilChoseactorblock:(UISlider*)param0
{

	UIStepper *stepCheckGiftdiynumberboardblock = [[UIStepper alloc] initWithFrame:CGRectMake(11, 34, 97, 85)];
	UITableView *tableViewControllerPut = [[UITableView alloc] init];
	UIStepper *stepAnimateItemheight = [[UIStepper alloc] initWithFrame:CGRectMake(10, 27, 178, 77)];
	UICollectionViewFlowLayout *handleTextcolorOnVotefromme =    [[UICollectionViewFlowLayout alloc]init];
 handleTextcolorOnVotefromme.minimumLineSpacing = 10; 
 handleTextcolorOnVotefromme.minimumInteritemSpacing = 10;
UICollectionView *collectionViewRetrySessionid = [[UICollectionView alloc] initWithFrame:CGRectMake(59, 31, 160, 294) collectionViewLayout:handleTextcolorOnVotefromme];
	UIColor *colorRestTonelevel = [UIColor blackColor];
	
	[collectionViewRetrySessionid addSubview:stepAnimateItemheight];
	[stepAnimateItemheight removeFromSuperview];
	[stepAnimateItemheight addSubview:tableViewControllerPut];
	[tableViewControllerPut removeFromSuperview];
	[tableViewControllerPut addSubview:stepCheckGiftdiynumberboardblock];
	[stepCheckGiftdiynumberboardblock removeFromSuperview];
	[colorRestTonelevel description];
	[collectionViewRetrySessionid description];
	NSDictionary *dictCrushRedpackets = [[NSDictionary alloc] init];
	return dictCrushRedpackets;
}

@end
//
//  NetParamTool.m
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "NetParamTool.h"
#import <UIKit/UIKit.h>
#import "KLLiveFullInfoStream.h"
#import "KLDHeaderCacheStatistics.h"
#import <objc/runtime.h>
#import <sys/utsname.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation NetParamTool


+ (NSDictionary *)setHasIsStart
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                AD_ID,@"ad",
                                Partner_ID,@"partner_id", nil];
    return @{@"platform":dic};
}
+ (NSDictionary *)hasAchievement
{
    
    NSString *version= [UIDevice currentDevice].systemVersion;
    KLDHeaderCacheStatistics *model = [KLDHeaderCacheStatistics share];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                model.KLsurfaceCell,@"device_id",
                                model.KLsurfaceCell,@"ios_idfa",
                                @"iOS",@"os_type",
                                version,@"os_version",
                                model.KLcanAdjust,@"model",
                                @([UIScreen mainScreen].bounds.size.width),@"screen_width",
                                @([UIScreen mainScreen].bounds.size.height),@"screen_height",
                                SDK_Version,@"sdk_version", nil];
    
    return @{@"device":dic};
}


+ (NSDictionary *)packNumberinto
{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                [KLDHeaderCacheStatistics share].KLselectFirstItem,@"game_id",
                                app_Version,@"game_version",
                                [KLDHeaderCacheStatistics share].KLselectedArray,@"game_name",
                                [KLDHeaderCacheStatistics share].KLhasOnntity,@"game_key",nil];
    return @{@"game":dic};
}
+ (NSDictionary *)isNotBlank
{
    
    NSString *getTimeSt = [KLLiveFullInfoStream unarchiver];
    NSString *timeZ = [KLLiveFullInfoStream sharePartyError];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                timeZ,@"client_time_zone",
                                getTimeSt,@"client_ts", nil];
    return @{@"other":dic};
}

+ (nullable NSString *)md5:(nullable NSString *)str
{
    if (!str) return nil;
    const char *cStr = str.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *md5Str = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [md5Str appendFormat:@"%02x", result[i]];
    }
    return md5Str;
}


@end

