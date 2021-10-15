//
//  QF_IAPManager.h
//  QFSDK
//
//  Created by K on 2020/2/17.
//  Copyright © 2020 GameSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QF_IAPManager : NSObject
+(instancetype)shared;

- (void)startManager;


- (void)QF_InAppPurcharseWithInfo:(NSDictionary *)info withUserInfo:(NSDictionary *)userinfo
                            Block:(void (^)(NSDictionary *dict,NSError *error))block;

+ (void)QF_presentSafariViewController:(NSString *)url;




- (void)QF_PurchaseProduct:(NSString *)productID  QF_Success:(void (^)(NSString * invalidProductIdentifiers,NSDictionary *info))success Kratos_failure:(void (^)(NSString *errormsg))failure;

@end

NS_ASSUME_NONNULL_END
