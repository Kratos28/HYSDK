//
//  NetParamTool.m
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "NetParamTool.h"
#import <UIKit/UIKit.h>
#import "QF_Tool.h"
#import "QF_Option.h"
#import <objc/runtime.h>
#import <sys/utsname.h>
#import <CommonCrypto/CommonCrypto.h>

@implementation NetParamTool


+ (NSDictionary *)QFGetPlatformInfo
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                AD_ID,@"ad",
                                Partner_ID,@"partner_id", nil];
    return @{@"platform":dic};
}
+ (NSDictionary *)QFGetDeviceInfo
{
    
    NSString *version= [UIDevice currentDevice].systemVersion;
    QF_Option *model = [QF_Option share];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                model.QF_idfa,@"device_id",
                                model.QF_idfa,@"ios_idfa",
                                @"iOS",@"os_type",
                                version,@"os_version",
                                model.QF_exmodel,@"model",
                                @([UIScreen mainScreen].bounds.size.width),@"screen_width",
                                @([UIScreen mainScreen].bounds.size.height),@"screen_height",
                                SDK_Version,@"sdk_version", nil];
    
    return @{@"device":dic};
}


+ (NSDictionary *)QFGetGameInfo
{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                [QF_Option share].QF_gameID,@"game_id",
                                app_Version,@"game_version",
                                [QF_Option share].QF_pkg,@"game_name",
                                [QF_Option share].QF_gameKey,@"game_key",nil];
    return @{@"game":dic};
}
+ (NSDictionary *)QFGetOtherInfo
{
    
    NSString *getTimeSt = [QF_Tool QF_getNowTimeTimestamp];
    NSString *timeZ = [QF_Tool QFgetTimezone];
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
