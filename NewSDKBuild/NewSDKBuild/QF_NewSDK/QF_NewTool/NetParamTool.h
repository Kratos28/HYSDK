//
//  NetParamTool.h
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetParamTool : NSObject
+ (NSDictionary *)QFGetPlatformInfo;
+ (NSDictionary *)QFGetDeviceInfo;
+ (NSDictionary *)QFGetGameInfo;
+ (NSDictionary *)QFGetOtherInfo;



//字符串 MD5加密
+ (nullable NSString *)md5:(nullable NSString *)str;
@end

NS_ASSUME_NONNULL_END
