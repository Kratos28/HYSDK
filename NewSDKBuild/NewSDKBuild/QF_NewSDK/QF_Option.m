//
//  QF_option.m
//  QFSDK
//
//  Created by K on 2019/6/4.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "QF_Option.h"
#import "QF_Tool.h"

@implementation QF_Option
static id _instance;

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}


- (instancetype)init
{
    if (self = [super init]) {
        _QF_exmodel = [QF_Tool QF_getDeiceName];
        _QF_idfa =  [QF_Tool QF_GetIDFA];
        _QF_curidfa =   [QF_Tool QF_curIDFA];
        _QF_version = [QF_Tool QF_getVersion];
        _QF_CID = @"";
        _QF_sdkver = @"1.4";
        _QF_SystemVersion =  [QF_Tool QF_systemVersion];
        NSString *bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        _QF_bundleID =  bundleID;
        NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"chid"];
        if (str.length > 0) {
            _QF_chidID = str;
        }
        
    }
    return self;
}

- (NSString *)getQF_bundleID
{
    if (_QF_bundleID == nil) {
        _QF_bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    }
    return _QF_bundleID;
}





- (NSString *)getQF_chid
{
    if (_QF_chidID == nil) {
         NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"chid"];
        if (str.length > 0) {
            _QF_chidID = str;
        }
    }
    return _QF_chidID;
}




@end
