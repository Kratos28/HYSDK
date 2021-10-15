//  ViewController.m
//  ExampleObfuscation
//
//  Created by K on 2021/7/14.
//

#import "ViewController.h"
#import <KLbrandId/JOVShowMarkModel.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)XJgetUserInfo:(NSDictionary *_Nullable)userInfo;
{
    NSLog(@"userinfo %@",userInfo);
}
//从SDK退出
- (void)XJlogOut;
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #define GAME_ID @"267"
    #define PKG @"yzcjjs"
    #define GameKey @"adab8cca11017067dae9100f62b90b91"
    #define PayKey  @"2178958c4699bb0b57d2f5c47406aa89"
    #define SupportURL @"https://www.youku.com"
    #define PrivacyURL @"https://www.baidu.com"//隐私政策网址
        
    
    [JOVShowMarkModel shared].controller = self;
    [JOVShowMarkModel shared].delegate = self;
    [[JOVShowMarkModel shared]getStringForKeykey:GAME_ID AndPKG:PKG AndGameKey:GameKey AndPayKey:PayKey];
    [[JOVShowMarkModel shared]replaceUserMedalsAtIndexwith:SupportURL Privacy:PrivacyURL];
    
    
}
- (IBAction)show:(id)sender {
    [[JOVShowMarkModel shared]generateRandomAlphabet];

}
- (IBAction)logout:(id)sender {
    [[JOVShowMarkModel shared] upperRightCornerIcon];

}
- (IBAction)report:(id)sender {
    
    NSDictionary *dic = @{@"role_id":@"729480",
                          @"role_server_id":@"16651",
                          @"role_server_name":@"name",
                          @"role_name":@"5f69c3ec26f",
                          @"role_level":@"0",
    };
      
    
      //[[QFNewSDKPlatform shared]QFCreateRoleReportWithInfo:dic];

    [[JOVShowMarkModel shared]IregisterDefaultUserAgent:dic AndType:RoleUpdateReport];
}
- (IBAction)pay:(id)sender {
    
//    NSDictionary *userInfo = @{@"role_id":@"136331531",
//                               @"role_name":@"5f69c3ec26f",
//                               @"role_level":@"1",
//                               @"role_server_id":@"16651",
//                               @"role_server_name":@"Nicds",
//      };
//      
//        
//      NSDictionary *goodsInfo = @{@"cp_order_sn":@"TEST10255200609142640000185",
//                                @"product_id":@"com.mjzj2.6",
//                                @"product_name":@"商品标题",
//                                @"product_desc":@"商品标题",
//                                @"product_price":@"600",
//      };
    
    
    NSDictionary *userInfo = @{@"role_id":@"136331531",
                               @"role_name":@"5f69c3ec26f",
                               @"role_level":@"1",
                               @"role_server_id":@"16651",
                               @"role_server_name":@"Nicds",
      };
      
        
    //狩猎者：觉醒-ios
    NSDictionary *goodsInfo = @{@"cp_order_sn":@"TEST10255200609142640000185",
                              @"product_id":@"10801", //内购ID
                              @"product_name":@"商品标题",
                              @"product_desc":@"商品标题",
                              @"product_price":@"600",
    };
    //沙盒测试账号1194805701@qq.com  Aa112211

    [[JOVShowMarkModel shared]getReturnTypeInt32:userInfo AndGoodsInfo:goodsInfo];
}


@end
