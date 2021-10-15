//
//  ViewController.m
//  HYSDKExample
//
//  Created by K on 2020/6/10.
//  Copyright © 2020 K. All rights reserved.
//

#import "ViewController.h"
#import <HYGameSDK/HYGameSDK.h>

@interface ViewController () <XJPlatformDelegate>

@end

@implementation ViewController

#pragma  mark userInfo返回用户信息
- (void)XJgetUserInfo:(NSDictionary *)userInfo
{
    NSLog(@"userinfo %@",userInfo);
}

#pragma  mark 从SDK退出调用
- (void)XJlogOut
{
    NSLog(@"logoutFromSDK");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
#define GAME_ID @"32"
#define PKG @"yzcs"
#define GameKey @"72145cbf19b83e6c669ccb910a861a6a"
#define PayKey  @"5dc398d4efd9ebe428741bb428fb2a6e"
#define SupportURL @"https://www.youku.com"
#define PrivacyURL @"https://www.baidu.com"//隐私政策网址
    
    [XJPlatform shared].controller = self;
    [XJPlatform shared].delegate = self;
    [[XJPlatform shared]XJinitSDKWithGameID:GAME_ID AndPKG:PKG AndGameKey:GameKey AndPayKey:PayKey];
    [[XJPlatform shared]XJinitWithSupport:SupportURL Privacy:PrivacyURL];
    
    
    // Do any additional setup after loading the view.
}


- (void)getUserInfo:(NSDictionary *)userInfo
{
    NSLog(@"userinfo %@",userInfo);
}


- (void)logoutFromSDK
{
    NSLog(@"logoutFromSDK");
}


- (IBAction)logout:(id)sender {
    [[XJPlatform shared] XJlogOutFromGame];

    
}
- (IBAction)xianshi:(id)sender {
    [[XJPlatform shared]XJshowLoginView];

}
- (IBAction)pay:(id)sender {
    
    NSDictionary *userInfo = @{@"role_id":@"136331531",
                               @"role_name":@"5f69c3ec26f",
                               @"role_level":@"1",
                               @"role_server_id":@"16651",
                               @"role_server_name":@"Nicds",
      };
      
        
      NSDictionary *goodsInfo = @{@"cp_order_sn":@"TEST10255200609142640000185",
                                @"product_id":@"com.mjzj2.6",
                                @"product_name":@"商品标题",
                                @"product_desc":@"商品标题",
                                @"product_price":@"600",
      };
    

    [[XJPlatform shared]XJaddInAppPurcharseViewWithUserInfo:userInfo AndGoodsInfo:goodsInfo];
    
}
- (IBAction)report:(id)sender {
    
    
    NSDictionary *dic = @{@"role_id":@"729480",
                          @"role_server_id":@"16651",
                          @"role_server_name":@"name",
                          @"role_name":@"5f69c3ec26f",
                          @"role_level":@"0",
    };
      
    
      //[[QFNewSDKPlatform shared]QFCreateRoleReportWithInfo:dic];

    [[XJPlatform shared]XJRoleInfoReportWithInfo:dic AndType:RoleUpdateReport];
}

@end
