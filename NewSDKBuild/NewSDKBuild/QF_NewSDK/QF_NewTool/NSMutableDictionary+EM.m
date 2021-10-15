//
//  NSMutableDictionary+EM.m
//  36Game
//
//  Created by K on 2021/8/4.
//

#import "NSMutableDictionary+EM.h"

@implementation NSMutableDictionary (EM)
+ (void)load
{
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(em_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}



- (void)em_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject == nil) {
        
    }else {
        [self em_setObject:emObject forKey:key];
    }
}


@end
