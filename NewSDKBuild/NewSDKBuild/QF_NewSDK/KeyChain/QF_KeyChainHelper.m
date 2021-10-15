//
//  KeyChainHelper.m
//  GameSDK
//
//  Created by zhang wenjie on 2019/1/8.
//  Copyright © 2019 MeiAnKeJi. All rights reserved.
//

#import "QF_KeyChainHelper.h"
#import <Security/Security.h>


@implementation QF_KeyChainHelper
static NSMutableDictionary * queryDIC;
+ (NSMutableDictionary *)MAgetKeychainQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword, (id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible, nil];
//    if (!queryDIC) {
//        queryDIC = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                    (id)kSecClassGenericPassword, (id)kSecClass,
//                    service, (id)kSecAttrService,
//                    service, (id)kSecAttrAccount,
//                    (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible, nil];
//    }
//    return queryDIC;
}

+ (void)QF_save:(NSString *)service data:(id)data
{
    NSMutableDictionary *keychainQuery = [self MAgetKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data]
                      forKey:(__bridge id<NSCopying>)(kSecValueData)];
    SecItemAdd((__bridge CFDictionaryRef)(keychainQuery), NULL);
}

+ (id)load:(NSString *)service
{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self MAgetKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id<NSCopying>)(kSecReturnData)];
    [keychainQuery setObject:(__bridge id)(kSecMatchLimitOne) forKey:(__bridge id<NSCopying>)(kSecMatchLimit)];

    CFTypeRef result = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, &result) == noErr)
    {
        ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData*)result];
    }
    return ret;
}

+ (void)QF_deleteKeyChain:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self MAgetKeychainQuery:service];
    SecItemDelete((__bridge CFDictionaryRef)(keychainQuery));
}

@end
