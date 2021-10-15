
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol XJPlatformDelegate <NSObject>

typedef enum _RoleReportType {
    RoleLoginReport =1 ,
    RoleCreateReport  = 2,
    RoleUpdateReport =3,
    RolelogoutReport =5
} RoleReportType;

@required
//获取用户信息
- (void)XJgetUserInfo:(NSDictionary *_Nullable)userInfo;
//从SDK退出
- (void)XJlogOut;

@end


NS_ASSUME_NONNULL_BEGIN




@interface JOVShowMarkModel : NSObject
@property(nonatomic,weak) id < XJPlatformDelegate > delegate;
@property(nonatomic,strong) UIViewController *controller;
//创建单例对象

+(instancetype)shared;

/**
 * 初始化参数
 * param gameID           游戏ID
 * param CID                 渠道ID
 * param pkg                 游戏简称
 */
- (void)getStringForKeykey:(NSString *)gameId AndPKG:(NSString *)pkg AndGameKey:(NSString *)gameKey AndPayKey:(NSString *)payKey;

/**
 * param supportUrl         技术支持地址
 * param privacyUrl          隐私政策地址
 */
- (void)replaceUserMedalsAtIndexwith:(NSString *)supportStr Privacy:(NSString *)privacyStr;
/**
 * 显示登录界面
 */
- (void)generateRandomAlphabet;


/**
 * 从游戏主动退出登录
 */
- (void)upperRightCornerIcon;

/**
 * 内购
 * goodsInfo   商品信息
 * param cp_order_sn      CP订单号
 * param product_id          服务器ID
 * param product_name    商品名称
 * param product_desc      商品描述
 * param product_price      价格（分）
 *
 *
 * userInfo  需包含以下参数:
 * param role_id                     角色ID
 * param role_name               角色名称
 * param role_level                 角色 等级
 * param role_server_id          服务器ID
 * param role_server_name    服务器名字
 */

- (void)getReturnTypeInt32:(NSDictionary *)userinfo AndGoodsInfo:(NSDictionary *)purchaseInfo;





/**
* 创角上报、登录上报、角色升级上报
 Info  需包含以下参数:
* param role_id                     角色ID
* param role_name               角色名称
* param role_level                 角色 等级
* param role_server_id          服务器ID
* param role_server_name    服务器名字
*/
- (void)IregisterDefaultUserAgent:(NSDictionary *)info AndType:(RoleReportType)type;


@end

NS_ASSUME_NONNULL_END
