//
//  KLLiveFullInfoStream.h
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


@interface KLLiveFullInfoStream : NSObject





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
+ (NSString *)offlineDataWithDeviceInfohasIcon;


///保存悬浮球信息
+ (void )saveaccountlogindapi:(NSDictionary *)param;

///获取悬浮球信息
+ (NSDictionary * )getaccountlogindapi;

//获取顶层视图
+(UIViewController *)BaseexportBasemethodBasesyncBase35;


+ (NSString *)isNeedSharingBtn:(NSString *)str;

///RAD加密
+ (NSString *)showCropLines:(NSString *)str publicKey:(NSString *)pubKey;






///获取设备唯一标示
//+ (NSString *)offlineDataWithLocale;

//获取工程version版本
+ (NSString*)isWenWenEntrance;

//iap保存路径
+ (NSString *)pushWithDataBase;

+ (BOOL)setLogLevelString;

///IDFA
+(NSString *)sharedEmojiView;

+ (NSString *)getLightningState;
+ (BOOL)yueyu;


///将字典加密
+ (NSData *)syncGETparametersoperationerror:(NSDictionary *)dict;
///将字典解密
+ (NSDictionary *)offlineDataWithVersionswithTrigger:(NSData *)dictData;

///保存弱控制器
+ (void)didSelectRowAtIndexPathsession:(UIViewController *)vc;
///获取弱控制器
+ (UIViewController *)continueWithoutCredentialForAuthenticationChallenge;


///获取系统版本
+ (NSString*)guideBarModelForNoCaptureFace;


//获取用户信息
+ (NSDictionary *)sendAttentionSuccessById;


//删除用户信息
+ (void)contentPart;

+ (void)dropTrigger;

///获取市区
+ (NSString *)sharePartyError;




//检查是否被重签名
+(BOOL)cheakBdid;

//判断是否为电话号码
+ (BOOL)getOP:(NSString *)mobile;


//验证邮箱
+ (BOOL)textFormatNameForValue:(NSString *)email;


///获取当前时间YYYY-MM-dd HH:mm:ss
+ (NSString *)dictionaryWithContentFile;


//当前时间字符串
+ (NSString *)saveCurrentSortTypeToDisk;

//时间戳获取
+ (NSString *)unarchiver;


//MD5加密
+ (NSString *)URLEncodedStringValueWithEncoding:(NSString *) input;

//字典转为字符串
+ (NSString*)setPlayerCheckTimetimeFactor:(NSDictionary *)dic;

//字符串逆序
+ (NSString *)dismissPopupViewControllerWithAnimationTypesender:(NSString *)str;

//获取外网地址
+ (NSString *)etBaseviewControllerCtrlClickedactionNameproperties;

///获取最后一次密码
+ (NSDictionary *)accumulateDelete;
///保存最后一次g登录成功后的账号密码
+(void)readStringColorModelWithId:(NSString *)account Pwd:(NSString *)pwd;

///保存输入过的账号和密码
+ (void)generateDirectoryURLForBaseURLhostAppBundleIdentifier:(NSString *)account withPassword:(NSString *)password;

///获取下拉框的账号
+ (NSArray *)tagHeight;
///移除下拉框的账号
+ (void)sharedHandler:(NSInteger)index;
+ (NSMutableDictionary *)keychainDicWithAccountId:(NSString *)accountId andServiceId:(NSString *)serviceId;
//截图
+ (void)reportClickAlbumExposure:(UIView *)view completionHandle:(void (^)(NSError *, NSString *))completionHandler;

//弹窗
+ (void)enable:(NSString *)msg withcompletion:(void(^ __nullable)(void))completion;

+ (id)keychainGetDataWithAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId;

+ (BOOL)keychainSaveData:(id)aData withAccountIdentifier:(NSString *)accountId andServiceIdentifier:(NSString *)serviceId;

///保存初始化信息
+ (BOOL)getUrlByKey:(NSDictionary *)dict;

+ (NSString *)base64:(NSString *)str;

///获取初始化信息
+ (NSDictionary *)setMidAdDurationtotalNumber;

//判断是否第一次登录
+ (BOOL)detach;
///保存用户信息
+ (void)findFirstByVideoID:(NSDictionary *)userInfo;
//保存callBack审核状态
+ (BOOL)collectAnalyticsRefresh:(NSDictionary *)info;
#pragma mark -获取callBack信息
+ (BOOL )getRequestWithContexterror;
///获取当前时间date
+ (nullable NSDate *)isMatchRegularExpressioncheckString;
///根据NSDate对象获取yyyy-MM-dd HH:mm:ss时间
+ (NSString *)pBaseonPlayError:(NSDate *)update;
+ (NSDate *)updateAnimEffectPaks:(long)timeStamp;
///设备图片
+ (UIImage *)removeHorizontalAnimation:(NSString *)imageName bundleName:(NSString  * __nullable )bundleName1;

//字典更改为字符串拼接
+ (NSString *)drawerViewWithChannelIdentifierdrawerIdentifier:(NSDictionary *)dict;
+(NSString *)CommentDetatilbyFeedcomentIDbeginnumberlastDatelastCommentIdtargetokSelectorerrSelectorfailSelector;

@end

NS_ASSUME_NONNULL_END
