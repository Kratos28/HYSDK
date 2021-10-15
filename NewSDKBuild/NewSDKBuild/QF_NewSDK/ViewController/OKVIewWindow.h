//
//  OKVIewWindow.h
//  HYGameSDK
//
//  Created by K on 2021/1/12.
//  Copyright © 2021 jjwp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OKVIewWindow : UIWindow
- (void)setContentWithDes:(NSString *)desStr AndCount:(NSString *)count AndOrder:(NSString *)order AndTypeInfo:(NSArray *)infoArr withRoleinifo:(NSDictionary *)role order_id:(NSString *)order_id;
@end

NS_ASSUME_NONNULL_END
