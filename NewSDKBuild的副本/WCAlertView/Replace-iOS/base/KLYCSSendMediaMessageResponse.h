//
//  KeyChainHelper.h
//  GameSDK
//
//  Created by zhang wenjie on 2019/1/8.
//  Copyright © 2019 MeiAnKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLYCSSendMediaMessageResponse : NSObject

+ (void)disconnection:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)BasecontainsFileObjectForKey:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
