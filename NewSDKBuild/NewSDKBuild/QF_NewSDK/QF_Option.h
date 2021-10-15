//
//  QF_option.h
//  QFSDK
//
//  Created by K on 2019/6/4.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QF_Option : NSObject
@property (nonatomic,copy,nonnull) NSString *QF_gameID;
@property (nonatomic,copy,nonnull)NSString *QF_gameKey;
@property (nonatomic,copy) NSString *payKey;


@property (nonatomic,copy,nonnull) NSString *QF_pkg;
@property (nonatomic,copy,nonnull) NSString *QF_CID;
@property (nonatomic,copy,nonnull) NSString *QF_appleIPAURL;
@property (nonatomic,copy,nullable) NSString *QF_DataKey;
@property (nonatomic,copy,readonly,nullable) NSString *QF_exmodel;
@property (nonatomic,copy,readonly,nullable) NSString *QF_idfa;
@property (nonatomic,copy,readonly,nullable) NSString *QF_version;
@property (nonatomic,copy,readonly,nullable) NSString *QF_sdkver;
@property (nonatomic,copy,nullable,getter=getQF_chid) NSString *QF_chidID;
@property (nonatomic,copy,nonnull) NSString *QF_bundleName;
@property (nonatomic,copy,nonnull,getter=getQF_bundleID) NSString *QF_bundleID;
@property (nonatomic,copy,nonnull) NSString *QF_userAgentLink;
@property (nonatomic,copy,nonnull) NSString *QF_supprotLimk;
@property (nonatomic,copy,nonnull) NSString *QF_curidfa;







@property (nonatomic,copy) NSString *QF_countryCode;
@property (nonatomic,copy) NSString *QF_currencyCode;

//uid
@property (nonatomic,copy)NSString *QF_uid;
//fee
@property (nonatomic,copy)NSString *QF_fee;
//goods
@property (nonatomic,copy)NSString *QF_des;
//sid
@property (nonatomic,copy)NSString *QF_sid;
//attach
@property (nonatomic,copy)NSString *QF_attach;
//appleMeiShu
@property (nonatomic,copy)NSString *QF_appleMeiShu;
@property (nonatomic,copy)NSString *QF_vip;

@property (nonatomic,copy)NSString *QF_token;

//角色信息
@property (nonatomic,strong) NSDictionary *roleInfo;
//商品信息
@property (nonatomic,strong) NSDictionary *goodsInfo;



@property (nonatomic,copy)NSString *QF_appEnv;
@property (nonatomic,copy)NSString *QF_SystemVersion;

@property (nonatomic,copy) NSString *QF_ip;
@property (nonatomic,copy) NSString *QF_outTradeNo;

//拓展参数
@property (nonatomic,strong) NSDictionary *expandDict;

+ (instancetype)share;

@end

NS_ASSUME_NONNULL_END
