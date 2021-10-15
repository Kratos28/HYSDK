//
//  QFReport.h
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^callBack)(BOOL report);

NS_ASSUME_NONNULL_BEGIN

@interface QFReport : NSObject
/** 角色信息上报*/
+ (void)XJReportActionBlock:(callBack)block;
@end

NS_ASSUME_NONNULL_END
