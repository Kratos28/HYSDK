//
//  QF_Tool.m
//  QFSDK
//
//  Created by K on 2019/6/4.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "QF_Tool.h"
#import "QF_KeyChainHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import <AdSupport/ASIdentifierManager.h>
#import <arpa/inet.h>
#import <netdb.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "sys/utsname.h"
#import <CommonCrypto/CommonCryptor.h>
#import "QF_Option.h"
#import "QF_NewSDKNet.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <objc/message.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <stdio.h>
#import <string.h>
#import <mach-o/dyld.h>
#import <mach-o/loader.h>
#include <stdlib.h>
#include <mach/task.h>
#include <mach/mach_init.h>
#include <stdbool.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/sysctl.h>
#import <CommonCrypto/CommonDigest.h>
#import <sys/stat.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>
#import <dlfcn.h>


#import <Security/Security.h>





#define UserInfo @"QFSDK.UserInfo."

#define HistoryAccount @"com.HistoryAccount"

#define CurrentAccount @"com.CurrentAccount"
static UIViewController *WindowVC = nil;
static NSString *HZ_callbackfileName = nil;
static UIViewController *weakVC = nil;
static void (^savePhotoreslut)(NSError *error, NSString *errmsg);
#define kIsStringValid(text) (text && text!=NULL && text.length>0)

@implementation QF_Tool
static char *JailbPathArr[] = {"/Applications/Cydia.app","/usr/sbin/sshd","/bin/bash","/etc/apt","/Library/MobileSubstrate","/User/Applications/"};

+ (BOOL)QF_firstStart
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        return true;
        
    }else{
        return false;
    }
    
}


///获取系统语言
+ (NSString *)QF_getSysLanguage
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
        languang = @"en-us";
    }else if ([pfLanguageCode containsString:@"en"])
    {
        languang = @"en-us";
        
    }
    return languang;
}

+ (void)QF_setWeakVC:(UIViewController *)vc
{
    weakVC = vc;
}
+ (UIViewController *)QF_weakVC
{
    return weakVC;
}


+(UIViewController *)QF_getTopViewController{
    
    UIWindow *topWindow = [UIApplication sharedApplication].keyWindow;
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        topWindow = [self returnWindowWithWindowLevelNormal];
    }
    
    UIViewController *topController = topWindow.rootViewController;
    if(topController == nil)
    {
        topWindow = [UIApplication sharedApplication].delegate.window;
        if (topWindow.windowLevel != UIWindowLevelNormal)
        {
            topWindow = [self returnWindowWithWindowLevelNormal];
        }
        topController = topWindow.rootViewController;
    }
    
    while(topController.presentedViewController)
    {
        topController = topController.presentedViewController;
    }
    
    if([topController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *nav = (UINavigationController*)topController;
        topController = [nav.viewControllers lastObject];
        
        while(topController.presentedViewController)
        {
            topController = topController.presentedViewController;
        }
    }
    
    return topController;
    
}

+ (void)QF_screenShots:(UIView *)view completionHandle:(void (^)(NSError *, NSString *))completionHandler
{
    
    savePhotoreslut = completionHandler;
    UIImage* newImage = [self QF_screenShotWithView:view];
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}
+ (UIImage *)QF_screenShotWithView:(UIView *)scrollView {
    
    UIImage* image;
    UIGraphicsBeginImageContextWithOptions(scrollView.frame.size, NO, [UIScreen mainScreen].scale);
    
    { 
        
        CGRect savedFrame = scrollView.frame;
        scrollView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        scrollView.frame = savedFrame;
        
    }
    
    UIGraphicsEndImageContext();
    
    if (image != nil){
        
        return image;
    }
    return nil;
}

+ (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (image != nil)
    {
        savePhotoreslut(nil,@"成功");
    }
}


///保存悬浮球信息
+ (void )saveaccountlogindapi:(NSDictionary *)param
{
    NSError *error = nil;
    NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:&error];
    NSString *encryStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    NSData *encryptedData = [self QF_encryptDESData:encryStr withKey:@"13ngwg85jz"];
    NSString *filePath =  [self QF_appendCacheDir:[NSString stringWithFormat:@"%@logindapi",ff]];


    if (encryptedData.length > 0)
    {
        [encryptedData writeToFile:filePath atomically:true];
    }
}

///获取悬浮球信息
+ (NSDictionary * )getaccountlogindapi
{
    NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
       NSString *path =  [self QF_appendCacheDir: [NSString stringWithFormat:@"%@logindapi",ff]];
       NSData *data = [[NSData alloc]initWithContentsOfFile:path];
       NSString *decryptDesStr =  [self QF_decryptDESData:data withKey:@"13ngwg85jz"];
       if (decryptDesStr.length == 0)
       {
           return  nil;
       }
       NSData *  decryptData = [decryptDesStr dataUsingEncoding:NSUTF8StringEncoding];
       NSError *error = nil;
       NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
       if (error != nil)
       {
           return  nil;
       }
       
       return dict;
}


+ (NSString *)QF_GetIDFA
{
    __block NSString *idfa  =[[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    if (@available(iOS 14, *)) {
            // iOS14及以上版本需要先请求权限
           [[NSBundle bundleWithPath:@"/System/Library/Frameworks/AppTrackingTransparency.framework"] load];
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                // 获取到权限后，依然使用老方法获取idfa
                if (status == ATTrackingManagerAuthorizationStatusDenied) {
//                    [self QF_alertView:@"请在设置-隐私-跟踪中允许App请求跟踪" withcompletion:nil];
                    NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
                }
                idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];

            }];
        } else {
            // iOS14以下版本依然使用老方法
            // 判断在设置-隐私里用户是否打开了广告跟踪
            [[NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"] load];

            if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
         
            } else {
//                [self QF_alertView:@"请在设置-隐私-广告中打开广告跟踪功能" withcompletion:nil];
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");

            }
            
            idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];

        }
    
    return   idfa;

}


+ (void)QF_alertView:(NSString *)msg withcompletion:(void(^ __nullable)(void))completion
{
    
    
    if ([msg isKindOfClass:[NSNull class]]) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *avc = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
        avc.view.tintColor = [UIColor orangeColor];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completion != nil) {
                completion();
            }
            
        }];
        [avc addAction:action];
        if (@available(iOS 13.0, *)) {
               avc.modalPresentationStyle = UIModalPresentationFullScreen;
           }
        
        [[self QF_getTopViewController] presentViewController:avc animated:YES completion:nil];
    });
    

    
    
    //    UIAlertView *al = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [al show];
}

+ (UIWindow *)returnWindowWithWindowLevelNormal
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *topWindow in windows)
    {
        if (topWindow.windowLevel == UIWindowLevelNormal )
            return topWindow;
    }
    return [UIApplication sharedApplication].keyWindow;
}

+ (nullable NSDate *)QF_getCurrentTime
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    
    
    NSDate *date = [formatter dateFromString:dateTime];
    NSTimeInterval inter = [[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate *bjDate = [date dateByAddingTimeInterval:inter];
    return bjDate;
}
///时间戳转换NSdtate
+ (NSDate *)QF_UTCDateFromTimeStamap:(long)timeStamp
{
    NSTimeInterval timeInterval=  timeStamp;
    NSDate *utcDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return utcDate;
}


+ (BOOL)setIdfaString:(NSString *)secValue
{
    if (kIsStringValid(secValue))
    {
        NSString *bundleID = [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"];

        [QF_KeyChainHelper QF_save:bundleID data:secValue];
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - UUID
+ (NSString*)getUUID
{
    CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuid_string_ref= CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    if (!kIsStringValid(uuid))
    {
        uuid = @"";
    }
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}


+ (NSString*)QF_getIdfaString
{
    NSString *bundleID = [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"];

    NSString *idfaStr = [QF_KeyChainHelper load:bundleID];
    if (kIsStringValid(idfaStr))
    {
        return idfaStr;
    }
    else
    {
        return [self QF_GetIDFA];

    }
}


+ (NSString *)WJsystemBootTime
{
    struct timeval boottime;
    size_t len = sizeof(boottime);
    int mib[2] = { CTL_KERN, KERN_BOOTTIME };
    if( sysctl(mib, 2, &boottime, &len, NULL, 0) < 0 )
    {
        return @"";
    }
    time_t bsec = boottime.tv_sec / 10000;
    NSString *bootTime = [NSString stringWithFormat:@"%ld",bsec];
    return bootTime;
}

+ (NSString *)WJcountryCode {
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    return countryCode;
}

+(NSString *)WJlanguage {
    NSString *language;
    NSLocale *locale = [NSLocale currentLocale];
    if ([[NSLocale preferredLanguages] count] > 0) {
        language = [[NSLocale preferredLanguages]objectAtIndex:0];
    } else {
        language = [locale objectForKey:NSLocaleLanguageCode];
    }
    return language;
}

+ (NSString *)WJsystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}


+ (NSString *)deviceName{
    return [[UIDevice currentDevice] name];
}

static const char *SIDFAModel =       "hw.model";

static const char *SIDFAMachine =     "hw.machine";

+ (NSString *)WJgetSystemHardwareByName:(const char *)typeSpecifier {
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithUTF8String:answer];
    free(answer);
    return results;
}

+ (NSUInteger) WJgetSysInfo:(uint) typeSpecifier {
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSString *)WJcarrierInfo {
    NSMutableString* cInfo = [NSMutableString string];
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    NSString *carrierName = [carrier carrierName];
    if (carrierName != nil){
        [cInfo appendString:carrierName];
    }
    NSString *mcc = [carrier mobileCountryCode];
    if (mcc != nil){
        [cInfo appendString:mcc];
    }
    NSString *mnc = [carrier mobileNetworkCode];
    if (mnc != nil){
        [cInfo appendString:mnc];
    }
    return cInfo;
}

+ (NSString *)WJsystemHardwareInfo{
    NSString *model = [self WJgetSystemHardwareByName:SIDFAModel];
    NSString *machine = [self WJgetSystemHardwareByName:SIDFAMachine];
    NSString *carInfo =  [self WJcarrierInfo];
    NSUInteger totalMemory =  [self WJgetSysInfo:HW_PHYSMEM];
    return [NSString stringWithFormat:@"%@,%@,%@,%td",model,machine,carInfo,totalMemory];
}

+ (NSString *)WJsystemFileTime{
    NSFileManager *file = [NSFileManager defaultManager];
    NSDictionary *dic= [file attributesOfItemAtPath:@"System/Library/CoreServices" error:nil];
    return [NSString stringWithFormat:@"%@,%@",[dic objectForKey:NSFileCreationDate],[dic objectForKey:NSFileModificationDate]];
}

+ (NSString *)disk{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    NSString *diskSize = [[fattributes objectForKey:NSFileSystemSize] stringValue];
    return diskSize;
}

static void MD5_16(NSString *source, unsigned char *ret){
    const char* str = [source UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    for(int i = 4; i < CC_MD5_DIGEST_LENGTH - 4; i++) {
        ret[i-4] = result[i];
    }
}

+ (NSString *)WJcombineTwoFingerPrint:(unsigned char *)fp1 with:(unsigned char *)fp2{
    NSMutableString *hash = [NSMutableString stringWithCapacity:36];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i+=1)
    {
        if (i==4 || i== 6 || i==8 || i==10)
        {
            [hash appendString:@"-"];
        }
        if (i < 8) {
            [hash appendFormat:@"%02X",fp1[i]];
        }else{
            [hash appendFormat:@"%02X",fp2[i-8]];
        }
    }
    return hash;
}


+ (NSString *)QF_uniqueDevice
{
    
    
    NSString *adID = [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled] == NO || [adID isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
           
                NSString *sysBootTime = [self WJsystemBootTime];
               NSString *countryC= [self WJcountryCode];
               NSString *languge = [self WJlanguage];
               NSString *deviceN = [self deviceName];
               NSString *sysVer = [self WJsystemVersion];
               NSString *systemHardware = [self WJsystemHardwareInfo];
               NSString *systemFT = [self WJsystemFileTime];
               NSString *diskS = [self disk];
               NSString *fingerPrintUnstablePart = [NSString stringWithFormat:@"%@,%@,%@,%@", sysBootTime, countryC, languge, deviceN];
               NSString *fingerPrintStablePart = [NSString stringWithFormat:@"%@,%@,%@,%@", sysVer, systemHardware, systemFT, diskS];
               unsigned char fingerPrintUnstablePartMD5[CC_MD5_DIGEST_LENGTH/2];
               MD5_16(fingerPrintUnstablePart,fingerPrintUnstablePartMD5);

               unsigned char fingerPrintStablePartMD5[CC_MD5_DIGEST_LENGTH/2];

               MD5_16(fingerPrintStablePart,fingerPrintStablePartMD5);
               NSString *simulateIDFA = [self WJcombineTwoFingerPrint:fingerPrintStablePartMD5 with:fingerPrintUnstablePartMD5];
                adID = simulateIDFA;
        
        
       }
    
    return adID;
    


}


///将字典加密
+ (NSData *)QF_encryptedWithDict:(NSDictionary *)dict
{
    NSError *error = nil;

    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *encryStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *encryptedData = [self QF_encryptDESData:encryStr withKey:@"1362dge8ce397204h52"];
    return encryptedData;
}

///将字典解密
+ (NSDictionary *)QF_decryptedWithDict:(NSData *)dictData
{

    NSString *decryptDesStr =  [self QF_decryptDESData:dictData withKey:@"1362dge8ce397204h52"];
    if (decryptDesStr.length == 0)
    {
        return  nil;
    }
    NSData *  decryptData = [decryptDesStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error != nil)
    {
        return  nil;
    }
    return dict;

}

- (void)pleaseInsertStarTimeo:(NSString *)time1 andInsertEndTime:(NSString *)time2{
        // 1.将时间转换为date
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate *date1 = [formatter dateFromString:time1];
        NSDate *date2 = [formatter dateFromString:time2];
        // 2.创建日历
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        // 3.利用日历对象比较两个时间的差值
        NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
        // 4.输出结果
        NSLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);
}


///保存个人信息
#pragma  mark 保存用户信息
+ (void)QF_saveUserInfo:(NSDictionary *)userInfo
{
    
    
    NSError *error = nil;
    NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:userInfo options:NSJSONWritingPrettyPrinted error:&error];
    NSString *encryStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    NSData *encryptedData = [self QF_encryptDESData:encryStr withKey:@"1362dge8ce397204h52"];
    NSString *filePath =  [self QF_appendCacheDir:ff];


    if (encryptedData.length > 0)
    {
        [encryptedData writeToFile:filePath atomically:true];
    }

    
    
}
+ (UIImage *)QF_SetBundleImageName:(NSString *)imageName bundleName:(NSString  * __nullable )bundleName1
{
    NSString *bundleName = [QF_Option share].QF_bundleName;
    static NSString * sBundleName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sBundleName = bundleName;
    });
    
    NSString *path = [[NSBundle mainBundle]pathForResource:sBundleName ofType:nil];
    path =  [NSString stringWithFormat:@"%@/%@.%@",path,imageName,@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
    
}

#pragma mark -保存初始化信息
+ (BOOL)QF_SaveInitInfo:(NSDictionary *)dict
{
       NSError *error = nil;
       NSString *ff =  @"48dg2gjxwh5";
       NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
       NSString *encryStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
       NSData *encryptedData = [self QF_encryptDESData:encryStr withKey:@"1362dge8ce397204h52"];
       NSString *filePath =  [self QF_appendCacheDir:ff];
       if (encryptedData.length > 0)
       {
          return  [encryptedData writeToFile:filePath atomically:true];
       }
    return false;

}

///获取初始化信息
+ (NSDictionary *)QF_getInitInfo
{
    NSString *ff =  @"48dg2gjxwh5";
    NSString *path =  [self QF_appendCacheDir: ff];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSString *decryptDesStr =  [self QF_decryptDESData:data withKey:@"1362dge8ce397204h52"];
    if (decryptDesStr.length == 0)
    {
        return  nil;
    }
    NSData *  decryptData = [decryptDesStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error != nil)
    {
        return  nil;
    }
    return dict;
}
+ (NSString *)QFStringSortedWithDic:(NSDictionary *)dict
{
    NSArray*keys = [dict allKeys];

    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {

    return [obj1 compare:obj2 options:NSNumericSearch];

    }];

    NSString*str =@"";

    for(NSInteger i = 0;i<sortedArray.count;i++) {

        
        NSString *key = sortedArray[i];
        id value = [dict objectForKey:key];
        if([value isKindOfClass:[NSDictionary class]]) {

            value = [self stringWithDict:value];
        }

        if([str length] !=0) {
            str = [str stringByAppendingString:@","];
         }
    
        str = [str stringByAppendingFormat:@"%@={%@}",key,value];
        
    }
    
    str = [str stringByReplacingOccurrencesOfString:@"}," withString:@"}&"];

    return str;
}

+ (NSString*)stringWithDict:(NSDictionary*)dict{

    NSArray*keys = [dict allKeys];

    NSArray*sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {

    return [obj1 compare:obj2 options:NSNumericSearch];

    }];

    NSString*str =@"";

    for(NSString*categoryId in sortedArray) {

        id value = [dict objectForKey:categoryId];

        if([value isKindOfClass:[NSDictionary class]]) {

            value = [self stringWithDict:value];

        }

        if([str length] !=0) {

            str = [str stringByAppendingString:@","];

        }

        str = [str stringByAppendingFormat:@"\"%@\":\"%@\"",categoryId,value];

    }

    return str;

}




//获取个人信息
+ (NSDictionary *)QF_getUserInfo{
    
    NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *path =  [self QF_appendCacheDir: ff];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSString *decryptDesStr =  [self QF_decryptDESData:data withKey:@"1362dge8ce397204h52"];
    if (decryptDesStr.length == 0)
    {
        return  nil;
    }
    NSData *  decryptData = [decryptDesStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error != nil)
    {
        return  nil;
    }
    
    return dict;
    
}


+ (NSString *)QFgetTimezone
{
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSString *strZoneAbbreviation = [localZone abbreviation];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    strZoneAbbreviation = [regularExpression stringByReplacingMatchesInString:strZoneAbbreviation options:0 range:NSMakeRange(0, strZoneAbbreviation.length) withTemplate:@""];
    return strZoneAbbreviation;
}



+(BOOL)cheakBdid
{
    

    NSString *mobileProvisionPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"embedded.mobileprovision"];
    FILE *fp=fopen([mobileProvisionPath UTF8String],"r");
    char ch;
    if(fp==NULL) {
        return false;
    }
    NSMutableString *str = [NSMutableString string];
    while((ch=fgetc(fp))!=EOF) {
        [str appendFormat:@"%c",ch];
    }
    fclose(fp);
    
    NSString *teamIdentifier = nil;
    NSRange teamIdentifierRange = [str rangeOfString:@"<key>application-identifier</key>"];
    if (teamIdentifierRange.location != NSNotFound) {
        NSInteger location = teamIdentifierRange.location + teamIdentifier.length;
        NSInteger length = [str length] - location;
        if (length > 0 && location >= 0) {
            NSString *newStr = [str substringWithRange:NSMakeRange(location, length)];;
            NSArray *val = [newStr componentsSeparatedByString:@"</string>"];
            NSString *v = [val firstObject];
            NSRange startRange = [v rangeOfString:@"<string>"];
            
            NSInteger newLocation = startRange.location + startRange.length;
            NSInteger newLength = [v length] - newLocation;
            if (newLength > 0 && location >= 0) {
                teamIdentifier = [v substringWithRange:NSMakeRange(newLocation, newLength)];
            }
        }
    }
    
  if ([teamIdentifier containsString:[QF_Option share].QF_bundleID]) {
        return false;
    }
    
    
    return true;
}

+ (BOOL)QF_prepareEnv
{
    NSString *embeddedPath = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:embeddedPath]) {
        NSString *embeddedProvisioning = [NSString stringWithContentsOfFile:embeddedPath encoding:NSASCIIStringEncoding error:nil];
        NSArray *embeddedProvisioningLines = [embeddedProvisioning componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        for (int i = 0; i < [embeddedProvisioningLines count]; i++)
        {
            if ([[embeddedProvisioningLines objectAtIndex:i] rangeOfString:@"application-identifier"].location != NSNotFound) {
                NSInteger fromPosition = [[embeddedProvisioningLines objectAtIndex:i+1] rangeOfString:@"<string>"].location+8;
                NSInteger toPosition = [[embeddedProvisioningLines objectAtIndex:i+1] rangeOfString:@"</string>"].location;
                NSRange range;
                range.location = fromPosition;
                range.length = toPosition - fromPosition;
                NSString *fullIdentifier = [[embeddedProvisioningLines objectAtIndex:i+1] substringWithRange:range];
                NSArray *identifierComponents = [fullIdentifier componentsSeparatedByString:@"."];
                NSString *appIdentifier = [identifierComponents firstObject];
                if ([QF_Option share].QF_appEnv.length ==0 || [QF_Option share].QF_appEnv==nil) {
                    return false;
                }
                if ([appIdentifier caseInsensitiveCompare:[QF_Option share].QF_appEnv] != NSOrderedSame) {
                    return true;
                }
                break;
            }
        }
    }
    return false;
}


+ (NSString*)QF_systemVersion
{
    NSString * str = [NSString stringWithFormat:@"%.2f",[[[UIDevice currentDevice] systemVersion] floatValue]];
    return str;
}



static NSString *userinfoFileName = @"account";

///获取下拉账号
+ (NSArray *)QF_getAccount
{
    
    NSString *path =  [self QF_appendCacheDir:userinfoFileName];
    NSMutableArray *temp = [NSMutableArray arrayWithContentsOfFile:path];
    return temp;
}
///移除账号
+ (void)QF_removeAccountAtindex:(NSInteger)index
{
    if (index <0) {
        return;
    }
    NSString *path =  [self QF_appendCacheDir:userinfoFileName];
    NSMutableArray *temp = [NSMutableArray arrayWithContentsOfFile:path];
    [temp removeObjectAtIndex:index];
    [temp writeToFile:path atomically:true];
    
}

///获取最后一次密码
+ (NSDictionary *)QF_getLastPasswordAndAccount
{
    
   NSString *user =   [[NSUserDefaults standardUserDefaults]objectForKey:@"account"];
    NSString *password =   [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    
    if (user.length> 0 && password.length >0) {
        return @{@"account":user,@"password":password};
    }
    return nil;

}
///保存最后一次g登录成功后的账号密码
+(void)QF_saveLastAccount:(NSString *)account Pwd:(NSString *)pwd{

    [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"account"];
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableDictionary *)keychainDicWithAccountId:(NSString *)accountId andServiceId:(NSString *)serviceId
{
//构建一个存取条件,实质是一个字典
    NSString *classKey = (__bridge NSString *)kSecClass;
    //指定服务类型是普通密码
    NSString *classValue = (__bridge NSString *)kSecClassGenericPassword;
    NSString *accessibleKey = (__bridge NSString *)kSecAttrAccessible;
    //指定安全类型是任何时候都可以访问
    NSString *accessibleValue = (__bridge NSString *)kSecAttrAccessibleAlways;
    NSString *accountKey = (__bridge NSString *)kSecAttrAccount;
    //指定服务的账户名 可以与服务名相同 账户名可以对应多个服务名
    NSString *accountValue = accountId;
    NSString *serviceKey = (__bridge NSString *)kSecAttrService;
    //指定服务的名字 可以与服务账户名相同
    NSString *serviceValue = serviceId;
    NSDictionary *keychainItems = @{classKey      : classValue,
                                    accessibleKey : accessibleValue,
                                    accountKey    : accountValue,
                                    serviceKey    : serviceValue};
    return keychainItems.mutableCopy;
}




+ (BOOL)keychainSaveData:(id)aData withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 获取存储的数据的条件
    NSMutableDictionary * saveQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 删除旧的数据
    SecItemDelete((CFDictionaryRef)saveQueryDic);
    // 设置新的数据
    id obj = [NSKeyedArchiver archivedDataWithRootObject:aData];
    [saveQueryDic setObject:obj forKey:(id)kSecValueData];
    // 添加数据
    OSStatus saveState = SecItemAdd((CFDictionaryRef)saveQueryDic, nil);
    // 释放对象
    saveQueryDic = nil ;
    // 判断是否存储成功
    if (saveState == errSecSuccess) {
        return YES;
    }
    return NO;
}

+ (id)keychainGetDataWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    id idObject = nil ;
    // 通过标记获取数据查询条件
    NSMutableDictionary * readQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 查询结果返回到 kSecValueData (此项必选)
    [readQueryDic setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    // 只返回搜索到的第一条数据 (此项必选)
    [readQueryDic setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    // 创建一个对象接受结果
    CFDataRef keyChainData = nil ;
    // 通过条件查询数据
    if (SecItemCopyMatching((CFDictionaryRef)readQueryDic , (CFTypeRef *)&keyChainData) == noErr){
        @try {
            //转换类型
            idObject = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)(keyChainData)];
        } @catch (NSException * exception){
            NSLog(@"Unarchive of search data where %@ failed of %@ ",serviceId,exception);
        }
    }
    if (keyChainData) {
        CFRelease(keyChainData);
    }
    readQueryDic = nil;
    // 返回数据
    return idObject ;
}

+ (BOOL)keychainUpdataData:(id)data withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 通过标记获取数据更新的条件
    NSMutableDictionary * updataQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 创建更新数据字典
    NSMutableDictionary * newDic = @{}.mutableCopy;
    // 存储数据
    [newDic setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    // 获取存储的状态
    OSStatus  updataStatus = SecItemUpdate((CFDictionaryRef)updataQueryDic, (CFDictionaryRef)newDic);
    updataQueryDic = nil;
    newDic = nil;
    // 判断是否更新成功
    if (updataStatus == errSecSuccess) {
        return  YES ;
    }
    return NO;
}


+ (void)keychainDeleteWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId{
    // 获取删除数据的查询条件
    NSMutableDictionary * deleteQueryDic = [self keychainDicWithAccountId:accountId andServiceId:serviceId];
    // 删除指定条件的数据
    SecItemDelete((CFDictionaryRef)deleteQueryDic);
    deleteQueryDic = nil ;
}




+ (void)QF_saveAccount:(NSString *)account withPassword:password{
    NSString *path =  [self QF_appendCacheDir:userinfoFileName];
    
    [self QF_saveLastAccount:account Pwd:password];
    
    NSMutableArray *temp = [NSMutableArray arrayWithContentsOfFile:path];
    if (temp == nil) {
        temp = [NSMutableArray array];
    }
    bool iscontains = false;
    
    if (temp.count == 0) {
        NSDictionary *dt =  @{@"account": account,@"password":password};
        [temp insertObject:dt atIndex:0];
        iscontains = true;
    }
    
    if (iscontains == false) {
        NSArray * temp1 = temp.copy;
        for (int i =0 ; i <temp1.count; i++) {
            NSMutableDictionary *dict =  temp[i];
            
            NSString *accountvalue = dict[@"account"];
            if ([accountvalue isEqualToString:account])
            {
                
                dict[@"account"] = account;
                dict[@"password"] = password;
                iscontains = true;
                break;
            }
            
            
        }
    }
    
    
    if (iscontains == false) {
        NSMutableDictionary *dt = [NSMutableDictionary dictionary];
        dt[@"account"] = account;
        dt[@"password"] = password;
        [temp insertObject:dt atIndex:0];
        
    }
    
    
    
    
    [temp writeToFile:path atomically:true];
    
    
}


//删除个人信息
+ (void)QF_deleateUserInfo{
    
    //清除用户信息
//    [KeyChainHelper deleteKeyChain:UserInfo];
    
    NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *path =  [self QF_appendCacheDir:ff];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path])
    {
        NSError *error = nil;
        
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        if (error == nil) {
        }else
        {
            
        }
    }
    
}

+ (void)QF_deleatelogindapi
{
       NSString *ff =  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
  


       NSString *filePath =  [self QF_appendCacheDir:[NSString stringWithFormat:@"%@logindapi",ff]];


          if ([[NSFileManager defaultManager]fileExistsAtPath:filePath])
       {
           NSError *error = nil;
           
           [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
           if (error == nil) {
           }else
           {
               
           }
       }
}


// 字典转为字符串
+ (NSString*)QF_dictionaryToJson:(NSDictionary *)parameters{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
}

+ (BOOL)yueyu
{
    if ([self isJailbroken2] || [self isJailbroken3]) {
        return  true;
    }else
    {
        return  false;
    }
}



+ (BOOL)isJailbroken3
{
    if(TARGET_IPHONE_SIMULATOR)return NO;
    return !(NULL == getenv("DYLD_INSERT_LIBRARIES"));
}


+ (BOOL)isJailbroken2{
    
    if(TARGET_IPHONE_SIMULATOR)return NO;
    int ret ;
    Dl_info dylib_info;
    int (*func_stat)(const char *, struct stat *) = stat;
    if ((ret = dladdr(func_stat, &dylib_info))) {
        NSString *fName = [NSString stringWithUTF8String:dylib_info.dli_fname];
        if(![fName isEqualToString:@"/usr/lib/system/libsystem_kernel.dylib"]){
            return YES;
        }
    }
    
    for (int i = 0;i < sizeof(JailbPathArr) / sizeof(char *);i++) {
        struct stat stat_info;
        if (0 == stat(JailbPathArr[i], &stat_info)) {
            return YES;
        }
    }
    
    return NO;
}



//字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        //        NSLog(NSLocalizedString(@"json解析失败：%@", nil),err);
        return nil;
    }
    return dic;
}
+ (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

//产生随机字符串
+ (NSString *)QF_getrandomString:(NSInteger)length {
    length = length/2;
    unsigned char digest[length];
    NSString *s = nil;
    s = [self HZ_stringFrom:digest length:length];
    return s;
}
//将bytes转为字符串
+ (NSString *)HZ_stringFrom:(unsigned char *)digest length:(NSInteger)leng {
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < leng; i++) {
        [string appendFormat:@"%02x",digest[i]];
    }
    return string;
}


//保存callBack审核状态
+ (BOOL)QF_saveCallBack:(NSDictionary *)info
{
    NSError *error = nil;
    int ff = [self getRandomNumber:8 to:32];
    
    NSMutableDictionary *temp = [NSMutableDictionary dictionary];
    [temp addEntriesFromDictionary:info];
    temp[@"key"] =  [self QF_getrandomString:ff];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:temp options:NSJSONWritingPrettyPrinted error:&error];
    NSString *string =  [self QF_getrandomString:ff];
    NSString *encryStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *encryptedData = [self QF_encryptDESData:encryStr withKey:@"1362dge8ce397204h52"];
    HZ_callbackfileName = string;
    NSString *filePath =  [self QF_appendCacheDir:string];
    NSMutableData * daa = [NSMutableData dataWithData:encryptedData];
    if (encryptedData.length > 0)
    {
        [daa writeToFile:filePath atomically:true];
        return  true;
    }
    return false;
}
+ (NSString *)QF_appendCacheDir:(NSString *)str;
{
    NSString *cache =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    return  [cache stringByAppendingPathComponent: [str lastPathComponent]];
}



+ (NSString *)QF_libPrefPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
}

+ (BOOL)hasLive:(NSString *)path
{
    if ( NO == [[NSFileManager defaultManager] fileExistsAtPath:path] )
    {
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    
    return YES;
}


+ (NSString *)QF_iapReceiptPath {
    
    NSString *path = [[self libPrefPath] stringByAppendingFormat:@"/EACEF35FE363A75A"];
    [self hasLive:path];
    return path;
}




#pragma mark -获取callBack信息
+ (BOOL )QF_getCallback
{
    NSString *path =  [self QF_appendCacheDir:HZ_callbackfileName];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSString *decryptDesStr =  [self QF_decryptDESData:data withKey:@"1362dge8ce397204h52"];
    if (decryptDesStr.length == 0)
    {
        return  false;
    }
    NSData *  decryptData = [decryptDesStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:decryptData options:NSJSONReadingAllowFragments error:&error];
    if (error != nil)
    {
        return  false;
    }
    if ([dict[@"SDKInit"] isEqualToString:@"1"])
    {
        return true;
    }else
    {
        return false;
    }
}

+ (NSData *)QF_AES256EncryptWithData:(NSData *)data WithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}




// 判断是否为电话号码
+ (BOOL)QF_valiMobile:(NSString *)mobile{
    if (mobile.length != 11)
    {
        return NO;
    }
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:mobile] == YES)
        || ([regextestcm evaluateWithObject:mobile] == YES)
        || ([regextestct evaluateWithObject:mobile] == YES)
        || ([regextestcu evaluateWithObject:mobile] == YES)){
        return YES;
    }else{
        return NO;
    }
}


+ (BOOL)QF_valiEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


// - 字符串逆序
+ (NSString *)QF_inputValue:(NSString *)str{
    NSMutableString *string=[[NSMutableString alloc] init];
    for(int i=0;i<str.length;i++){
        [string appendString:[str substringWithRange:NSMakeRange(str.length-i-1, 1)]];
    }
    
    NSString *stringRemove = [string stringByReplacingOccurrencesOfString:@"*" withString:@""];
    
    string = [NSMutableString stringWithString:stringRemove];
    
    return string;
}

///RAS加密
+ (NSString *)QF_encryptString:(NSString *)str publicKey:(NSString *)pubKey
{
    NSData *data = [self XJencryptData:[str dataUsingEncoding:NSUTF8StringEncoding] publicKey:pubKey];
    NSString *ret = base64_encode_data(data);
    return ret;
}
static NSString *base64_encode_data(NSData *data){
    data = [data base64EncodedDataWithOptions:0];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
}

static NSData *base64_decode(NSString *str){
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}
+ (NSString *)base64:(NSString *)str
{
    NSData *data=[[NSData alloc]initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
      return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}



+ (NSData *)stripPublicKeyHeader:(NSData *)d_key{
    // Skip ASN.1 public key header
    if (d_key == nil) return(nil);
    
    unsigned long len = [d_key length];
    if (!len) return(nil);
    
    unsigned char *c_key = (unsigned char *)[d_key bytes];
    unsigned int  idx     = 0;
    
    if (c_key[idx++] != 0x30) return(nil);
    
    if (c_key[idx] > 0x80)
    {
        idx += c_key[idx] - 0x80 + 1;
    }
    else
    {
        idx++;
    }
    
    // PKCS #1 rsaEncryption szOID_RSA_RSA
    static unsigned char seqiod[] =
    { 0x30,   0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01,
        0x01, 0x05, 0x00 };
    if (memcmp(&c_key[idx], seqiod, 15)) return(nil);
    
    idx += 15;
    
    if (c_key[idx++] != 0x03) return(nil);
    
    if (c_key[idx] > 0x80) idx += c_key[idx] - 0x80 + 1;
    else idx++;
    
    if (c_key[idx++] != '\0') return(nil);
    
    // Now make a new NSData from this buffer
    return([NSData dataWithBytes:&c_key[idx] length:len - idx]);
}

+ (SecKeyRef)addPublicKey:(NSString *)key{
    NSRange spos = [key rangeOfString:@"-----BEGIN PUBLIC KEY-----"];
    NSRange epos = [key rangeOfString:@"-----END PUBLIC KEY-----"];
    if(spos.location != NSNotFound && epos.location != NSNotFound){
        NSUInteger s = spos.location + spos.length;
        NSUInteger e = epos.location;
        NSRange range = NSMakeRange(s, e-s);
        key = [key substringWithRange:range];
    }
    key = [key stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@" "  withString:@""];
    
    // This will be base64 encoded, decode it.
    NSData *data = base64_decode(key);
    data = [self stripPublicKeyHeader:data];
    if(!data){
        return nil;
    }
    
    //a tag to read/write keychain storage
    NSString *tag = @"RSAUtil_PubKey";
    NSData *d_tag = [NSData dataWithBytes:[tag UTF8String] length:[tag length]];
    
    // Delete any old lingering key with the same tag
    NSMutableDictionary *publicKey = [[NSMutableDictionary alloc] init];
    [publicKey setObject:(__bridge id) kSecClassKey forKey:(__bridge id)kSecClass];
    [publicKey setObject:(__bridge id) kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    [publicKey setObject:d_tag forKey:(__bridge id)kSecAttrApplicationTag];
    SecItemDelete((__bridge CFDictionaryRef)publicKey);
    
    // Add persistent version of the key to system keychain
    [publicKey setObject:data forKey:(__bridge id)kSecValueData];
    [publicKey setObject:(__bridge id) kSecAttrKeyClassPublic forKey:(__bridge id)
     kSecAttrKeyClass];
    [publicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)
     kSecReturnPersistentRef];
    
    CFTypeRef persistKey = nil;
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)publicKey, &persistKey);
    if (persistKey != nil){
        CFRelease(persistKey);
    }
    if ((status != noErr) && (status != errSecDuplicateItem)) {
        return nil;
    }
    
    [publicKey removeObjectForKey:(__bridge id)kSecValueData];
    [publicKey removeObjectForKey:(__bridge id)kSecReturnPersistentRef];
    [publicKey setObject:[NSNumber numberWithBool:YES] forKey:(__bridge id)kSecReturnRef];
    [publicKey setObject:(__bridge id) kSecAttrKeyTypeRSA forKey:(__bridge id)kSecAttrKeyType];
    
    // Now fetch the SecKeyRef version of the key
    SecKeyRef keyRef = nil;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)publicKey, (CFTypeRef *)&keyRef);
    if(status != noErr){
        return nil;
    }
    return keyRef;
}


+ (NSData *)XJencryptData:(NSData *)data publicKey:(NSString *)pubKey{
    if(!data || !pubKey){
        return nil;
    }
    SecKeyRef keyRef = [self addPublicKey:pubKey];
    if(!keyRef){
        return nil;
    }
    return [self XJencryptData:data withKeyRef:keyRef isSign:NO];
}

+ (NSData *)XJencryptData:(NSData *)data withKeyRef:(SecKeyRef) keyRef isSign:(BOOL)isSign {
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    
    size_t block_size = SecKeyGetBlockSize(keyRef) * sizeof(uint8_t);
    void *outbuf = malloc(block_size);
    size_t src_block_size = block_size - 11;
    
    NSMutableData *ret = [[NSMutableData alloc] init];
    for(int idx=0; idx<srclen; idx+=src_block_size){
        //NSLog(@"%d/%d block_size: %d", idx, (int)srclen, (int)block_size);
        size_t data_len = srclen - idx;
        if(data_len > src_block_size){
            data_len = src_block_size;
        }
        
        size_t outlen = block_size;
        OSStatus status = noErr;
        
        if (isSign) {
            status = SecKeyRawSign(keyRef,
                                   kSecPaddingPKCS1,
                                   srcbuf + idx,
                                   data_len,
                                   outbuf,
                                   &outlen
                                   );
        } else {
            status = SecKeyEncrypt(keyRef,
                                   kSecPaddingPKCS1,
                                   srcbuf + idx,
                                   data_len,
                                   outbuf,
                                   &outlen
                                   );
        }
        if (status != 0) {
            ret = nil;
            break;
        }else{
            [ret appendBytes:outbuf length:outlen];
        }
    }
    
    free(outbuf);
    CFRelease(keyRef);
    return ret;
}



//当前时间字符串
+ (NSString *)QF_currentDateStr{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}
+ (NSString *)libPrefPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
}





// 时间戳获取
+ (NSString *)QF_getNowTimeTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}


///获取当前时间YYYY-MM-dd HH:mm:ss
+ (NSString *)QF_getNowTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
   
    
    return  [formatter stringFromDate:datenow];
}



///根据NSDate对象获取yyyy-MM-dd HH:mm:ss时间
+ (NSString *)QF_chindDateFormate:(NSDate *)update
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:update];
    return destDateString;
}


+ (NSString*)QF_getVersion
{
    return  [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}


///IDFA
+(NSString *)QF_curIDFA
{
    __block NSString *idfa  =[[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    if (@available(iOS 14, *)) {
            // iOS14及以上版本需要先请求权限
        [[NSBundle bundleWithPath:@"/System/Library/Frameworks/AppTrackingTransparency.framework"] load];

            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                // 获取到权限后，依然使用老方法获取idfa
                if (status == ATTrackingManagerAuthorizationStatusDenied) {
//                    [self QF_alertView:@"请在设置-隐私-跟踪中允许App请求跟踪" withcompletion:nil];
                    NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
                }
                idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];

            }];
        } else {
            // iOS14以下版本依然使用老方法
            // 判断在设置-隐私里用户是否打开了广告跟踪
            [[NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"] load];

            if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
         
            } else {
//                [self QF_alertView:@"请在设置-隐私-广告中打开广告跟踪功能" withcompletion:nil];
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");

            }
            
            idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];

        }
    
    return   idfa;
    
}
//MD5加密
+ (NSString *)QF_md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

+ (NSString *)QF_getIPAdress{
    
    NSError *error;
    NSURL *ipURL = [NSURL URLWithString:@"http://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        NSRange range = NSMakeRange(0, 19);
        [ip deleteCharactersInRange:range];
        NSString * nowIp = [ip substringToIndex:ip.length-1];
        //将字符串转换成二进制进行Json解析
        NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        return dict[@"cip"];
    }
    return @"";
}


+ (BOOL)QF_isFirstLogin
{
    BOOL isfirst =  [[NSUserDefaults standardUserDefaults] objectForKey:@"isfirst"];
    return isfirst;
}


+(NSString *)QF_getDeiceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
  
    return deviceModel;
}

#pragma mark 加密方法
///AES加密
+ (NSData *)QF_encryptAESData_HZ:(NSString *)string
{
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    
    

    NSData *encryptedData = [self QF_AES256EncryptWithData:data WithKey:@"1362dge8ce397204h52"];
    return encryptedData;
}







+ (NSString *)QF_DESDecryptWithData:(NSData *)data  WithKey:(NSString *)sKey {
    NSStringEncoding EnC = NSUTF8StringEncoding;
    const void *dataIn;
    size_t dataInLength;
    
    dataInLength = [data length];
    dataIn = [data bytes];
    
    NSMutableData * dKey = [[sKey dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    //uint8_t iv[kCCBlockSizeDES];
    //memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([data length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCDecrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            dataIn, // const void *dataIn
            dataInLength,  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSString * sResult;
    
    sResult = [[NSString alloc] initWithData:[NSData dataWithBytes:bufferPtr1
                                                            length:movedBytes1] encoding:EnC];
    free(bufferPtr1);
    return sResult;
}

+ (NSData *)QF_encryptDESData:(NSString *)string withKey:(NSString *)key {
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密 1362dge8ce397204h52
    NSData *encryptedData = [self QF_DESEncryptWithKey:key WithData:data];
    return encryptedData;
}

+ (NSData *)QF_DESEncryptWithKey:(NSString *)key WithData:(NSData *)data
{
    
    NSStringEncoding EnC = NSUTF8StringEncoding;
    NSMutableData * dKey = [[key dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([data length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCEncrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            [data bytes], // const void *dataIn
            [data length],  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    free(bufferPtr1);
    return sResult;
}


- (NSData *)QF_DESEncryptWithKey:(NSString *)key WiwhData:(NSData *)data
{
    
    NSStringEncoding EnC = NSUTF8StringEncoding;
    NSMutableData * dKey = [[key dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([data length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCEncrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            [data bytes], // const void *dataIn
            [data length],  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    free(bufferPtr1);
    return sResult;
}

+ (NSString *)QF_decryptDESData:(NSData *)data  withKey:(NSString *)key {
    //使用密码对data进行解密
    NSString *decryptJsonString = [self QF_DESDecryptWithData:data WithKey:key];
    //将解了密码的nsdata转化为nsstring
    return decryptJsonString;
}


bool QF_isDyldHooked() {
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
    }
    return (env != NULL);
}






 bool QF_amibeingdebugged() {
    mach_msg_type_number_t count = 0;
    exception_mask_t masks[EXC_TYPES_COUNT];
    mach_port_t ports[EXC_TYPES_COUNT];
    exception_behavior_t behaviors[EXC_TYPES_COUNT];
    thread_state_flavor_t flavors[EXC_TYPES_COUNT];
    
    exception_mask_t mask = EXC_MASK_ALL & ~(EXC_MASK_RESOURCE | EXC_MASK_GUARD);
    //默认情况下，当线程异常端口为空，且任务异常端口继承自fork()调用,程序正常运行时,task_get_exception_ports()检查mach_task_self()返回自身任务端口为空;如果程序被调试器调试，后者会为被调试程序设置一个异常处理器,用来捕获程序发送到任务异常端口的异常,此时，调试器设置的异常处理器挂钩了异常端口，检查任务异常端口返回不为空了
    kern_return_t result = task_get_exception_ports(mach_task_self(), mask, masks, &count, ports, behaviors, flavors);
    if (result == KERN_SUCCESS) {
        for (mach_msg_type_number_t portIndex = 0; portIndex < count; portIndex++) {
            if (MACH_PORT_VALID(ports[portIndex])) {
                return true;
            }
        }
    }
    return false;
}

bool QF_checkHookForOC(const char* clsname,const char* selname)
{
    Dl_info info;
    SEL sel = sel_registerName(selname);
    Class cls = objc_getClass(clsname);
    Method method = class_getInstanceMethod(cls, sel);
    if(!method){
        method = class_getClassMethod(cls, sel);
    }
    IMP imp = method_getImplementation(method);
    
    if(!dladdr((void*)imp, &info)){
        return false;
    }
    
    NSString *s =  [NSString stringWithFormat:@"/%@/%@/%@",@"System",@"Library",@"Frameworks"];
    
    
    if(!strncmp(info.dli_fname,[s UTF8String], 26)){
        return false;
    }
    
    if(!strcmp(info.dli_fname, _dyld_get_image_name(0))){
        return false;
    }
    
    NSBundle *bundle =  [NSBundle bundleForClass:[cls class]];
    
    NSString *path = [bundle bundlePath];
    NSString *last =   [path lastPathComponent];
    NSRange range =  [last rangeOfString:@"."];
    if (range.length != NSNotFound && range.location != NSNotFound)
    {
        last = [last substringToIndex:range.location];
    }
    
    
    

    
    NSString * infodli_fname = [[NSString alloc]initWithUTF8String:info.dli_fname];
    
    infodli_fname = [infodli_fname lastPathComponent];
    if([infodli_fname isEqualToString:last]){
        return false;
    }
    
    
    
    return true;
}
bool QF_checkClassHookForOC(const char* clsname,const char* selname)
{
    Dl_info info;
    SEL sel = sel_registerName(selname);
    Class cls = objc_getClass(clsname);
    Method method = class_getClassMethod(cls, sel);
    if(!method){
        method = class_getClassMethod(cls, sel);
    }
    IMP imp = method_getImplementation(method);
    
    if(!dladdr((void*)imp, &info)){
        return false;
    }
    
    NSString *s =  [NSString stringWithFormat:@"/%@/%@/%@",@"System",@"Library",@"Frameworks"];
    if(!strncmp(info.dli_fname, [s UTF8String], 26)){
        return false;
    }
    
    if(!strcmp(info.dli_fname, _dyld_get_image_name(0))){
        return false;
    }
    
    
    NSBundle *bundle =  [NSBundle bundleForClass:[cls class]];
    
    NSString *path = [bundle bundlePath];
    NSString *last =   [path lastPathComponent];
    NSRange range =  [last rangeOfString:@"."];
    if (range.length != NSNotFound && range.location != NSNotFound)
    {
        last = [last substringToIndex:range.location];
    }

   
    NSString * infodli_fname = [[NSString alloc]initWithUTF8String:info.dli_fname];
    
    infodli_fname = [infodli_fname lastPathComponent];
    if([infodli_fname isEqualToString:last]){
        return false;
    }
    
    
    return true;
}

int anti_tweak(void)
{
    uint8_t lmb[] = {'S', 'u', 'b', 's', 't', 'r', 'a', 't', 'e', '/', 'D', 'y', 'n', 'a', 'm', 'i', 'c', 0, };
    NSString *dir = [NSString stringWithFormat:@"/%@/%@%s%@", @"Library", @"Mobile", lmb, @"Libraries"];
    NSArray *dirFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dir error:nil];
    NSArray *plistFiles = [dirFiles filteredArrayUsingPredicate:
                           [NSPredicate predicateWithFormat:
                            [NSString stringWithFormat:@"%@ %@%@ '.%@%@'",@"self", @"EN", @"DSWITH", @"pli", @"st"]]];
    int cnt = 0;
    for (NSString *file in plistFiles) {
        NSString *filePath = [dir stringByAppendingPathComponent:file];
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        if (fileContent && [fileContent rangeOfString:[[NSBundle mainBundle] bundleIdentifier]].location != NSNotFound) {
            cnt ++;
        }
    }
    // 返回有针对本 app 的 tweak 数量，为 0 说明没有
    return cnt;
}



@end
