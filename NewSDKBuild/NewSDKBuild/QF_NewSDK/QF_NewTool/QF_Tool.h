//
//  QF_Tool.h
//  QFSDK
//
//  Created by K on 2019/6/4.
//  Copyright © 2019 GameSDK. All rights reserved.
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#define klogoutNotication @"klogoutNotication"
#define khideWindowNotication @"khideWindowNotication"

#define kloginSueeces @"kloginSueeces"
#define kshowFloat @"kshowFloat"


#define guard(condfion) if(condfion){}


@interface QF_Tool : NSObject





#ifdef __cplusplus
extern "C" {
#endif
    bool QF_checkHookForOC(const char* clsname,const char* selname);
    
    bool QF_checkClassHookForOC(const char* clsname,const char* selname);
    //调试检测
    bool QF_amibeingdebugged(void);
    
    bool QF_isDyldHooked(void);
    //防止tweak
    int anti_tweak(void);
    
    
#ifdef __cplusplus
}
#endif


///获取系统语言
+ (NSString *)QF_getSysLanguage;


///保存悬浮球信息
+ (void )saveaccountlogindapi:(NSDictionary *)param;

///获取悬浮球信息
+ (NSDictionary * )getaccountlogindapi;

//获取顶层视图
+(UIViewController *)QF_getTopViewController;


+ (NSString *)QF_appendCacheDir:(NSString *)str;

///RAD加密
+ (NSString *)QF_encryptString:(NSString *)str publicKey:(NSString *)pubKey;






///获取设备唯一标示
//+ (NSString *)QF_uniqueDevice;

//获取工程version版本
+ (NSString*)QF_getVersion;

//iap保存路径
+ (NSString *)QF_iapReceiptPath;

+ (BOOL)QF_prepareEnv;

///IDFA
+(NSString *)QF_curIDFA;

+ (NSString *)QF_GetIDFA;
+ (BOOL)yueyu;


///将字典加密
+ (NSData *)QF_encryptedWithDict:(NSDictionary *)dict;
///将字典解密
+ (NSDictionary *)QF_decryptedWithDict:(NSData *)dictData;

///保存弱控制器
+ (void)QF_setWeakVC:(UIViewController *)vc;
///获取弱控制器
+ (UIViewController *)QF_weakVC;


///获取系统版本
+ (NSString*)QF_systemVersion;


//获取用户信息
+ (NSDictionary *)QF_getUserInfo;


//删除用户信息
+ (void)QF_deleateUserInfo;

+ (void)QF_deleatelogindapi;

///获取市区
+ (NSString *)QFgetTimezone;




//检查是否被重签名
+(BOOL)cheakBdid;

//判断是否为电话号码
+ (BOOL)QF_valiMobile:(NSString *)mobile;


//验证邮箱
+ (BOOL)QF_valiEmail:(NSString *)email;


///获取当前时间YYYY-MM-dd HH:mm:ss
+ (NSString *)QF_getNowTime;


//当前时间字符串
+ (NSString *)QF_currentDateStr;

//时间戳获取
+ (NSString *)QF_getNowTimeTimestamp;


//MD5加密
+ (NSString *)QF_md5:(NSString *) input;

//字典转为字符串
+ (NSString*)QF_dictionaryToJson:(NSDictionary *)dic;

//字符串逆序
+ (NSString *)QF_inputValue:(NSString *)str;

//获取外网地址
+ (NSString *)QF_getIPAdress;

///获取最后一次密码
+ (NSDictionary *)QF_getLastPasswordAndAccount;
///保存最后一次g登录成功后的账号密码
+(void)QF_saveLastAccount:(NSString *)account Pwd:(NSString *)pwd;

///保存输入过的账号和密码
+ (void)QF_saveAccount:(NSString *)account withPassword:(NSString *)password;

///获取下拉框的账号
+ (NSArray *)QF_getAccount;
///移除下拉框的账号
+ (void)QF_removeAccountAtindex:(NSInteger)index;
+ (NSMutableDictionary *)keychainDicWithAccountId:(NSString *)accountId andServiceId:(NSString *)serviceId;
//截图
+ (void)QF_screenShots:(UIView *)view completionHandle:(void (^)(NSError *, NSString *))completionHandler;

//弹窗
+ (void)QF_alertView:(NSString *)msg withcompletion:(void(^ __nullable)(void))completion;

+ (id)keychainGetDataWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId;

+ (BOOL)keychainSaveData:(id)aData withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId;

///保存初始化信息
+ (BOOL)QF_SaveInitInfo:(NSDictionary *)dict;

+ (NSString *)base64:(NSString *)str;

///获取初始化信息
+ (NSDictionary *)QF_getInitInfo;

//判断是否第一次登录
+ (BOOL)QF_isFirstLogin;
///保存用户信息
+ (void)QF_saveUserInfo:(NSDictionary *)userInfo;
//保存callBack审核状态
+ (BOOL)QF_saveCallBack:(NSDictionary *)info;
#pragma mark -获取callBack信息
+ (BOOL )QF_getCallback;
///获取当前时间date
+ (nullable NSDate *)QF_getCurrentTime;
///根据NSDate对象获取yyyy-MM-dd HH:mm:ss时间
+ (NSString *)QF_chindDateFormate:(NSDate *)update;
+ (NSDate *)QF_UTCDateFromTimeStamap:(long)timeStamp;
///设备图片
+ (UIImage *)QF_SetBundleImageName:(NSString *)imageName bundleName:(NSString  * __nullable )bundleName1;

//字典更改为字符串拼接
+ (NSString *)QFStringSortedWithDic:(NSDictionary *)dict;
+(NSString *)QF_getDeiceName;

@end

NS_ASSUME_NONNULL_END
