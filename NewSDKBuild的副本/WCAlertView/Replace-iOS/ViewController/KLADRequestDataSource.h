//
//  KLADRequestDataSource.h
//  QFSDK
//
//  Created by K on 2020/2/17.
//  Copyright © 2020 GameSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLADRequestDataSource : NSObject
+(instancetype)shared;

- (void)startManager;


- (void)loadMoreDataWithSuccessfailure:(NSDictionary *)info withUserInfo:(NSDictionary *)userinfo
                            Block:(void (^)(NSDictionary *dict,NSError *error))block;

+ (void)reloadTableView:(NSString *)url;




- (void)setFragmentTextureswithRange:(NSString *)productID  sendVoiceVerification:(void (^)(NSString * invalidProductIdentifiers,NSDictionary *info))success Kratos_failure:(void (^)(NSString *errormsg))failure;

@end

NS_ASSUME_NONNULL_END
