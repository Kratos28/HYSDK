//
//  KeyChainHelper.h
//  GameSDK
//
//  Created by zhang wenjie on 2019/1/8.
//  Copyright © 2019 MeiAnKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QF_KeyChainHelper : NSObject

+ (void)QF_save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)QF_deleteKeyChain:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
