//
//  ViewController.m
//  Example
//
//  Created by K on 2020/12/9.
//

#import "ViewController.h"
#import <HYNewSDK/HYNewSDK.h>

@interface ViewController ()<QF_NewSDKPlatformDelegate>

@end

@implementation ViewController
- (void)getUserInfo:(NSDictionary *)userInfo
{
    NSLog(@"userinfo %@",userInfo);
}


- (void)logoutFromSDK
{
    NSLog(@"logoutFromSDK");
}
- (void)viewDidLoad {
    [super viewDidLoad];
#define GAME_ID @"76"
#define PKG @"yzcs"
#define GameKey @"d0d9558f1cb220177ffa53a46956dcb1"
#define PayKey  @"404df6184ec5810c00b5b893316c5339"
#define SupportURL @"https://www.youku.com"
#define PrivacyURL @"https://www.baidu.com"
[[QFNewSDKPlatform shared]QFinitSDKWithGameID:@"76" AndPKG:@"yzcs" withGameKey:@"d0d9558f1cb220177ffa53a46956dcb1" payKey:@"404df6184ec5810c00b5b893316c5339" delegate:self currentViewControler:self];
    
    
[[QFNewSDKPlatform shared]QFinitWithSupport:@"https://www.youku.com" Privacy:@"https://www.baidu.com"];
    
}

- (IBAction)show:(id)sender {
    [[QFNewSDKPlatform shared]QFshow];

}
- (IBAction)logout:(id)sender {
    [[QFNewSDKPlatform shared] QFlogoutFromGame];

}
- (IBAction)report:(id)sender {
    
    NSDictionary *dic = @{@"role_id":@"729480",
                          @"role_server_id":@"16651",
                          @"role_server_name":@"name",
                          @"role_name":@"5f69c3ec26f",
                          @"role_level":@"0",
    };
      
    

    
      [[QFNewSDKPlatform shared]QFRoleAction:dic withType:RoleUpdateReport];
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
    
    [[QFNewSDKPlatform shared]QFAppPurchaseWithInfo:userInfo withPurchase:goodsInfo];
    
}

@end
