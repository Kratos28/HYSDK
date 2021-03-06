//
//  QF_Net.m
//  QFSDK
//
//  Created by K on 2019/6/5.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "QF_NewSDKNet.h"
#import "QF_Option.h"
#import "QF_Tool.h"
#import "QF_HZActivityIndicatorView.h"
#import "NetParamTool.h"


#define PublicKey @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCgD1/ABcZyC5145bg5jEEPpNqi0clh5/LZjGqJLZsPJff1va4u2WDsiLqcZdCdOEVxVBZoVBOC6oi34gFpFKJXkSxspQBCPXGIIjGUzulpz7YKwwu5O6dZ7zww1FaGp35q0g578jLOPPnALkn2FVmYuT2lSkdQwP50b1feGEXlFQIDAQAB"

@interface SSQ_AFQueryStringPair : NSObject
@property (readwrite, nonatomic, strong) id field;
@property (readwrite, nonatomic, strong) id value;
- (instancetype)initWithField:(id)field value:(id)value;
- (NSString *)QF_URLEncodedStringValue;
@end
@implementation SSQ_AFQueryStringPair
- (instancetype)initWithField:(id)field value:(id)value {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.field = field;
    self.value = value;
    return self;
}
NSString * SSQ_AFPercentEscapedStringFromString(NSString *string) {
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@";
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    static NSUInteger const batchSize = 50;
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    while (index < string.length) {
        NSUInteger length = MIN(string.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        range = [string rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [string substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        index += range.length;
    }
    return escaped;
}

- (NSString *)QF_URLEncodedStringValue {
    if (!self.value || [self.value isEqual:[NSNull null]]) {
        return SSQ_AFPercentEscapedStringFromString([self.field description]);
    } else {
        return [NSString stringWithFormat:@"%@=%@", SSQ_AFPercentEscapedStringFromString([self.field description]), SSQ_AFPercentEscapedStringFromString([self.value description])];
    }
}

@end



#define StringWithData(data) [[NSString alloc] initWithData:(data) encoding:NSUTF8StringEncoding]
#define DataWithString(str) [(str) dataUsingEncoding:NSUTF8StringEncoding]

@implementation QF_NewSDKNet
+ (void)QF_requestWithURLString:(NSString *)URLString  parameters:(id __nullable )parameters type:(QF_HttpRequestType)type success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure
{

    NSMutableDictionary *mustableDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [mustableDic addEntriesFromDictionary:[NetParamTool QFGetPlatformInfo]];
    [mustableDic addEntriesFromDictionary:[NetParamTool QFGetGameInfo]];
    [mustableDic addEntriesFromDictionary:[NetParamTool QFGetDeviceInfo]];
    [mustableDic addEntriesFromDictionary:[NetParamTool QFGetOtherInfo]];
    
    
    NSString *key = [QF_Option share].QF_gameKey;
       if ([URLString containsString:@"order"] || [URLString containsString:@"payment"]) {
           key = [QF_Option share].payKey;
    }
    
    NSString *dicStr = [QF_Tool QFStringSortedWithDic:mustableDic];
    dicStr = [NSString stringWithFormat:@"%@%@",dicStr,key];
    NSString *signStr = [QF_Tool QF_md5:dicStr];
    [mustableDic addEntriesFromDictionary:@{@"sign":signStr}];
    
    
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
      configuration.timeoutIntervalForRequest  = 30;
      NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
      NSString *pathStr = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
      NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
      [request setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
      if (type == HttpRequestTypeGet) {
          [request setHTTPMethod:@"GET"];
      }else
      {
          
          NSString *body = SSQ_AFQueryStringFromParameters(mustableDic);
          NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
          [request setHTTPBody:bodyData];
          [request setHTTPMethod:@"POST"];
          NSString * userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
          [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
          [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)bodyData.length] forHTTPHeaderField:@"Content-Length"];
          [request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
          [request setValue:@"; IOS" forHTTPHeaderField:@"User-Agent"];
     
      }

    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data)
            {
               NSString *s =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"sssss = %@",s);
                //利用iOS自带原生JSON解析data数据 保存为Dictionary
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                success(dict);
            }else{
                failure(error);
            }
        });
    }];
    [task resume];
    
    

    
    
}
#pragma mark -获取Chid
+ (void)QF_getChid:(void(^)(bool isgechild))result
{
        QF_Option *optionva =  [QF_Option share];

       NSString * chid =  [[NSUserDefaults standardUserDefaults]objectForKey:@"chid"];
       if (chid.length > 0) {
           result(true);
           return;
       }
       
       
       
    NSString *XJ_sss_XJ =  [NSString stringWithFormat:@"%@/app/repact",GameTop];

    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                               optionva.QF_gameID,               @"gameid",
                               optionva.QF_pkg,                  @"pkg",
                               optionva.QF_bundleID,             @"bundle_id",
                               optionva.QF_CID,                  @"cid",
                               optionva.QF_idfa,                 @"idfa",
                               optionva.QF_sdkver,               @"sdkver",
                               optionva.QF_version,              @"version",
                               optionva.QF_exmodel,              @"exmodel",
                               @"1",                             @"rfapp",
                               @"1",                             @"inm",
                               @"1",                             @"force",
                               @"1",                             @"wxjbtoapp",
                                optionva.QF_curidfa,              @"curidfa",
                               nil];
    
    
    
       
       
       [QF_NewSDKNet QF_requestWithURLString:XJ_sss_XJ parameters:dic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
           NSString *chid = [responseObject objectForKey:@"chid"];;
           if (chid.length > 0) {
               optionva.QF_chidID = chid;
               [[NSUserDefaults standardUserDefaults] setObject:chid forKey:@"chid"];
               [[NSUserDefaults standardUserDefaults]synchronize];
               result(true);
           }


       } failure:^(NSError * _Nonnull error) {
           result(false);
       }];
    
    
  
       
}

+ (void)QF_requestNOEncryptionWithURLString:(NSString *)URLString parameters:( id )parameters type:(QF_HttpRequestType)type success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure
{

    NSString *pfLanguageCode = [NSLocale preferredLanguages][0];    ///设置语言
      NSString *languang = @"zh-cn";
      if ([pfLanguageCode isEqualToString:@"zh-Hans-CN"]) {
          languang = @"zh-cn";
      }else if ([pfLanguageCode isEqualToString:@"zh-Hant-HK"])
      { //香港
          languang = @"zh-ft";
      }else if ([pfLanguageCode isEqualToString:@"zh-Hant-CN"])
      {
          languang = @"zh-ft";
      }else if ([pfLanguageCode isEqualToString:@"en-CN"])
      {
          //        languang = @"en-us";
          languang = @"zh-cn";
          
      }else if ([pfLanguageCode containsString:@"en"])
      {
          //        languang = @"en-us";
          languang = @"zh-cn";
          
      }
      QF_Option *model = [QF_Option share];
      NSString *param  = @"";
      if ([URLString rangeOfString:@"?"].location  != NSNotFound) {
          
          
        param  = [NSString stringWithFormat:@"%@&inm=1&gameid=%@&cid=%@&exmodel=%@&pkg=%@&version=%@&idfa=%@&sdkver=%@&time=%@&chid=%@&lang=%@&bdid=%@&bundle_id=%@&wxjbtoapp=1&rfapp=1&systemVersion=%@",URLString,model.QF_gameID,model.QF_CID,model.QF_exmodel,model.QF_pkg,model.QF_version,model.QF_idfa,model.QF_sdkver,[QF_Tool QF_getNowTimeTimestamp],model.QF_chidID,languang,model.QF_bundleID,model.QF_bundleID,model.QF_SystemVersion];
          
      }else
      {
           param  = [NSString stringWithFormat:@"%@?inm=1&gameid=%@&cid=%@&exmodel=%@&pkg=%@&version=%@&idfa=%@&sdkver=%@&time=%@&chid=%@&lang=%@&bdid=%@&bundle_id=%@&wxjbtoapp=1&rfapp=1&&systemVersion=%@",URLString,model.QF_gameID,model.QF_CID,model.QF_exmodel,model.QF_pkg,model.QF_version,model.QF_idfa,model.QF_sdkver,[QF_Tool QF_getNowTimeTimestamp],model.QF_chidID,languang,model.QF_bundleID,model.QF_bundleID,model.QF_SystemVersion];
      }
      
    
    
    
      URLString = param;
      NSString *inm =  @"inm";
      NSString *gameid =  @"gameid";
      NSString *cid =  @"cid";
      NSString *exmodel =  @"exmodel";
      NSString *pkg =  @"pkg";
      NSString *version =  @"version";
      NSString *idfa =  @"idfa";
      NSString *sdkver =  @"sdkver";
      NSString *time =  @"time";
      NSString *chid =  @"chid";
      NSString *bdid =  @"bdid";
      NSString *bundle_id =  @"bundle_id";
      NSString *wxjbtoapp =  @"wxjbtoapp";
      NSString *rfapp =  @"rfapp";
      NSString *systemVersion =  @"systemVersion";
      NSString *lang = @"lang";
      NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"1",                          inm,
                           model.QF_gameID,                  gameid,
                           model.QF_CID,                     cid,
                           model.QF_exmodel,               exmodel,
                           model.QF_pkg,                     pkg,
                           model.QF_version,              version,
                           model.QF_idfa,                    idfa,
                           model.QF_sdkver,              sdkver,
                           [QF_Tool QF_getNowTimeTimestamp], time,
                           model.QF_chidID,                  chid,
                           model.QF_bundleID,                 bdid,
                           model.QF_bundleID,                 bundle_id,
                           @"1",                               wxjbtoapp,
                           @"1",                                 rfapp,
                           model.QF_SystemVersion,               systemVersion,
                           languang,                             lang,
                           nil];
    
    
    
     NSMutableDictionary *dicMutable = [NSMutableDictionary dictionaryWithDictionary:dic];
     [dicMutable addEntriesFromDictionary:dic];

    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
       configuration.timeoutIntervalForRequest  = 15;
       NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
       NSString *pathStr = [URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
       NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
       [request setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    

    
    
     //设置请求方式：POST
     if (type == HttpRequestTypeGet) {
         [request setHTTPMethod:@"GET"];
     }else{
         [request setHTTPMethod:@"POST"];
         
         
         NSString * userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
         [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
         [request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
         [request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
         
         //data的字典形式转化为data
         NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dicMutable options:NSJSONWritingPrettyPrinted error:nil];
         //设置请求体
        

         [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)jsonData.length] forHTTPHeaderField:@"Content-Length"];
         [request setHTTPBody:jsonData];
     }
     NSURLSessionDataTask * dataTask =[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         if (error == nil) {
             NSString *ss = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             
             NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers
                                                                              error:nil];
             if (success) {
                 success(responseObject);
             }
         }else{
             if (failure) {
                 failure(error);
             }
         }
     }];
     [dataTask resume];
}


+ (void)QF_getReportStatues
{
    NSString *HTTP = [NSString stringWithFormat:@"%@/api/app/ApiJson?gid=%@&key=ios_api_json",GameTop,[QF_Option share].QF_gameID];
    [QF_NewSDKNet QF_requestNOEncryptionWithURLString:HTTP parameters:@{} type:HttpRequestTypeGet success:^(id _Nonnull success) {
       
        NSString *PayCode =[success valueForKey:@"PaymentRequest"];
        NSString *InitCode = [success valueForKey:@"initSDK"];
               
        if (InitCode.length>0 ) {
            [self QF_setUserInfWithKey:@"initSDK" AndValue:InitCode];

        }
        if (PayCode.length>0 ) {
            [self QF_setUserInfWithKey:@"PaymentRequest" AndValue:PayCode];
        }
    } failure:^(NSError * _Nonnull failure) {
        
    }];
}

+ (void)QF_RreportUserActionWithName:(NSString *)name QF_AndInfo:(NSDictionary *)info
{
    
    NSString *HTTP = [NSString stringWithFormat:@"%@/api/app/iosReportLog",GameTop];
      
      NSString *InitCode =  [[NSUserDefaults standardUserDefaults] objectForKey:@"initSDK"];
      NSString *PayCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"PaymentRequest"];
      
      if ([InitCode isEqualToString:@"0"] && [name isEqualToString:@"initSDK"]) {
          return;
      }
      
      if ([PayCode isEqualToString:@"0"] && [name isEqualToString:@"PaymentRequest"]) {
          return;
      }
 
    [QF_NewSDKNet QF_requestNOEncryptionWithURLString:HTTP parameters:info type:HttpRequestTypePost success:^(id responseObject) {
        
        } failure:^(NSError *error) {
            
    }];
}



+ (void)QF_setUserInfWithKey:(NSString *)key AndValue:(NSString *)value{
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSData *)QF_encrypt:(NSData *)data {
    char *dataP = (char *)[data bytes];
    for (int i = 0; i < data.length; i++) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunsequenced"
        *dataP = *(++dataP) ^ 1;
#pragma clang diagnostic pop
    }
    return data;
}




+ (void)QF_retryingWithURLString:(NSString *)URLString  withNumberofTime:(NSUInteger)ntimes parameters:(id)parameters type:(QF_HttpRequestType)type success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure
{
    
    if (ntimes <=0) {
        
        NSString * str =  parameters[@"params"][@"transaction_id"];
        
        if (str.length >0) {
            
            NSError * error = [NSError errorWithDomain:str code:300 userInfo:nil];
            [QF_HZActivityIndicatorView hide];
            failure(error);
        }

        return;
    }else
    {
            [self QF_requestWithURLString:URLString parameters:parameters type:type success:^(id  _Nonnull responseObject) {
                if (success) {
                    
                    if ([responseObject[@"code"] integerValue] == 0) {
                        success(responseObject);
                    }else if ([responseObject[@"code"] integerValue] == 10043) //服务端返回订单已经支付
                    {
                        success(responseObject);
                    }else
                    {
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [self QF_retryingWithURLString:URLString withNumberofTime:ntimes-1 parameters:parameters type:type success:success failure:failure];
                        });
                        
                    }
                }

            } failure:^(NSError * _Nonnull error) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       [self QF_retryingWithURLString:URLString withNumberofTime:ntimes-1 parameters:parameters type:type success:success failure:failure];
                });
            }];
    }
    
    
}

#pragma mark -- 拼接参数
+ (NSString *)QF_dealWithParam:(NSDictionary *)param
{
    NSArray *allkeys = [param allKeys];
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *key in allkeys) {
        NSString *string = [NSString stringWithFormat:@"%@=%@&", key, param[key]];
        [result appendString:string];
    }
    return result;
}


NSString * SSQ_AFQueryStringFromParameters(NSDictionary *parameters) {
    NSMutableArray *mutablePairs = [NSMutableArray array];
    for (SSQ_AFQueryStringPair *pair in SSQ_AFQueryStringPairsFromDictionary(parameters)) {
        [mutablePairs addObject:[pair QF_URLEncodedStringValue]];
    }
    return [mutablePairs componentsJoinedByString:@"&"];
}

NSArray * SSQ_AFQueryStringPairsFromDictionary(NSDictionary *dictionary) {
    return SSQ_AFQueryStringPairsFromKeyAndValue(nil, dictionary);
}
NSArray * SSQ_AFQueryStringPairsFromKeyAndValue(NSString *key, id value) {
    NSMutableArray *mutableQueryStringComponents = [NSMutableArray array];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(compare:)];
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = value;
        for (id nestedKey in [dictionary.allKeys sortedArrayUsingDescriptors:@[ sortDescriptor ]]) {
            id nestedValue = dictionary[nestedKey];
            if (nestedValue) {
                [mutableQueryStringComponents addObjectsFromArray:SSQ_AFQueryStringPairsFromKeyAndValue((key ? [NSString stringWithFormat:@"%@[%@]", key, nestedKey] : nestedKey), nestedValue)];
            }
        }
    } else if ([value isKindOfClass:[NSArray class]]) {
        NSArray *array = value;
        for (id nestedValue in array) {
            [mutableQueryStringComponents addObjectsFromArray:SSQ_AFQueryStringPairsFromKeyAndValue([NSString stringWithFormat:@"%@[]", key], nestedValue)];
        }
    } else if ([value isKindOfClass:[NSSet class]]) {
        NSSet *set = value;
        for (id obj in [set sortedArrayUsingDescriptors:@[ sortDescriptor ]]) {
            [mutableQueryStringComponents addObjectsFromArray:SSQ_AFQueryStringPairsFromKeyAndValue(key, obj)];
        }
    } else {
        [mutableQueryStringComponents addObject:[[SSQ_AFQueryStringPair alloc] initWithField:key value:value]];
    }
    return mutableQueryStringComponents;
}

@end
