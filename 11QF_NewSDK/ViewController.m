//
//  ViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "ViewController.h"

#import <HYGameSDK/HYGameSDK.h>
@interface ViewController ()<XJPlatformDelegate>

@end

@implementation ViewController
#pragma  mark userInfo返回用户信息
- (void)XJgetUserInfo:(NSDictionary *)userInfo
{
    NSLog(@"userinfo %@",userInfo);
}

//#pragma  mark 从SDK退出调用
- (void)XJlogOut
{
    NSLog(@"logoutFromSDK");
}
//
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return  10;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    return  cell;
//}
//


- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
    
//    [[QFNewSDKPlatform shared]QFinitSDKWithGameID:@"32" AndPKG:@"lhhc" withGameKey:@"72145cbf19b83e6c669ccb910a861a6a" payKey:@"5dc398d4efd9ebe428741bb428fb2a6e" delegate:self currentViewControler:self];
    
//#define GAME_ID @"76"
//#define PKG @"yzcs"
//#define GameKey @"d0d9558f1cb220177ffa53a46956dcb1"
//#define PayKey  @"404df6184ec5810c00b5b893316c5339"
//#define SupportURL @"https://www.youku.com"
//#define PrivacyURL @"https://www.baidu.com"
    
 //ios 测试参数
//#define GAME_ID @"32"
//#define PKG @"yzcs"
//#define GameKey @"72145cbf19b83e6c669ccb910a861a6a"
//#define PayKey  @"5dc398d4efd9ebe428741bb428fb2a6e"
//#define SupportURL @"https://www.youku.com"
//#define PrivacyURL @"https://www.baidu.com"

    
//#define GAME_ID @"112"
//#define PKG @"yzcs"
//#define GameKey @"c5e4b9be3dba9ff7a4a0bc0e8477acf0"
//#define PayKey  @"56e619f112bae032b4c0192f3c3eede4"
//#define SupportURL @"https://www.youku.com"
//#define PrivacyURL @"https://www.baidu.com"

    
    //com.wefwe.cc
//    #define GAME_ID @"128"
//    #define PKG @"yzcs"
//    #define GameKey @"7e20e6e7d0d908ccce9ea7231d44d062"
//    #define PayKey  @"7a0eb8822f28265ab6478b6be7aa58c0"
//    #define SupportURL @"https://www.youku.com"
//    #define PrivacyURL @"https://www.baidu.com"
//[XJPlatform shared].controller = self;
//[XJPlatform shared].delegate = self;
//[[XJPlatform shared]XJinitSDKWithGameID:GAME_ID AndPKG:PKG AndGameKey:GameKey AndPayKey:PayKey];
//[[XJPlatform shared]XJinitWithSupport:SupportURL Privacy:PrivacyURL];
//
    
    
    
/*
 
 SDK 参数：
 游戏名：黎明逃杀-ios
 Bundle ID：com.hjzh.lmts
 gameID：187
 game_key（仅限于SDK使用）：63a650d384b69a8432e1493fafa1ca59
 pay_key（仅限于SDK使用）：a8dc37ecf97476f40cdd77262802e2c6

 发货密钥（用于服务端发货）：3f03472e4d45efd4fe1cec4b095ba390
 技术支持地址：http://yzcs.cmaom.com/agreement/support.html
 隐私政策地址：http://yzcs.cmaom.com/agreement/privacy-policy.html
 AndPKG：lmts
 
 */
    
//#define GAME_ID @"187" 黎明逃杀-ios
//狩猎者：觉醒-ios
#define GAME_ID @"267"
// 黎明逃杀-ios
#define PKG @"yzcs"
//黎明逃杀-ios
//#define GameKey @"63a650d384b69a8432e1493fafa1ca59"
//黎明逃杀-ios
//#define PayKey  @"a8dc37ecf97476f40cdd77262802e2c6"
//狩猎者：觉醒-ios
#define PayKey  @"2178958c4699bb0b57d2f5c47406aa89"

//狩猎者：觉醒-ios
#define GameKey @"adab8cca11017067dae9100f62b90b91"

    
#define SupportURL @"https://www.youku.com"
#define PrivacyURL @"https://www.baidu.com"
[XJPlatform shared].controller = self;
[XJPlatform shared].delegate = self;
[[XJPlatform shared]XJinitSDKWithGameID:GAME_ID AndPKG:PKG AndGameKey:GameKey AndPayKey:PayKey];
[[XJPlatform shared]XJinitWithSupport:SupportURL Privacy:PrivacyURL];
//
//
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UITableView *ta =  [self.view viewWithTag:1];
    ta.frame = self.view.frame;
}

- (IBAction)show:(id)sender {
    [[XJPlatform shared]XJshowLoginView];
}
- (IBAction)pay:(id)sender {
 
    
//    [[QFNewSDKPlatform shared]QFuuid:@"504" price:@"6" good:@"60元宝" widhSID:@"259992" withAttach:@"role=559937432|device=2|item=2" withAppleID:@"com.yjzx.6"  withVip:@"0"];
    
    
//      [[QFNewSDKPlatform shared]QFuuid:@"820312" price:@"6" good:@"60元宝" widhSID:@"" withAttach:@"TEST10255200609142640000185" withAppleID:@"com.xinyou.lhhchytl_1_6"  withVip:@"0"];
////
    
    
//    [[QFNewSDKPlatform shared]QFuuid:@"729480" price:@"6" good:@"60元宝" widhSID:@"16651" withAttach:@"role=136331531|device=2|item=2" withAppleID:@"com.fszh.6"  withVip:@"0"];
     
//内购测试 com.mjzj2.6
//bundle_id :com.memoryExercise.zhujinjin.ios
//@"product_id":@"com.mjzj2.6"
//开发者账号 朱金金 zhu1990699@126.com Jjx12345 jjx12345 14705805701 亚兰 18613138738胡智强
    // 沙盒 461400226111@qq.com
       //Lz123456

    
    
    NSDictionary *userInfo = @{@"role_id":@"136331531",
                               @"role_name":@"5f69c3ec26f",
                               @"role_level":@"1",
                               @"role_server_id":@"16651",
                               @"role_server_name":@"Nicds",
      };
      
        
//      NSDictionary *goodsInfo = @{@"cp_order_sn":@"TEST10255200609142640000185",
//                                @"product_id":@"com.mjzj2.6",
//                                @"product_name":@"商品标题",
//                                @"product_desc":@"商品标题",
//                                @"product_price":@"600",
//      };
    
    
    //狩猎者：觉醒-ios
    NSDictionary *goodsInfo = @{@"cp_order_sn":@"TEST10255200609142640000185",
                              @"product_id":@"10801", //内购ID
                              @"product_name":@"商品标题",
                              @"product_desc":@"商品标题",
                              @"product_price":@"600",
    };
    
    //com.mjzj2.ygame   com.mjzj2.6   账号:hzq123456789@163.com Lz123456

    [[XJPlatform shared]XJaddInAppPurcharseViewWithUserInfo:userInfo AndGoodsInfo:goodsInfo];
    

    
}
- (IBAction)logout:(id)sender {
    [[XJPlatform shared] XJlogOutFromGame];
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
