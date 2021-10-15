//
//  KLTFeedPlayerFullscreenPlugin.h
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^callBack)(BOOL report);

NS_ASSUME_NONNULL_BEGIN

@interface KLTFeedPlayerFullscreenPlugin : NSObject
/** 角色信息上报*/
+ (void)ktvPlayIsStalling:(callBack)block;
@end

NS_ASSUME_NONNULL_END
