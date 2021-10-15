//
//  OKViewViewController.m
//  HYNewSDK
//
//  Created by K on 2020/9/28.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "OKViewViewController.h"
#import "QF_NewSDKNet.h"
#import "QF_Tool.h"
#import <SafariServices/SafariServices.h>
#import "QF_HZActivityIndicatorView.h"
#import "QF_Option.h"
@interface OKViewViewController () <SFSafariViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *weibutton;
@property (weak, nonatomic) IBOutlet UIButton *alibuton;
@property (weak, nonatomic) IBOutlet UILabel *TitileLabel;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *order_idLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weiImage;
@property (weak, nonatomic) IBOutlet UIImageView *aliImage;

@property (strong,nonatomic)NSDictionary *roleinfo;
@property (copy,nonatomic)NSArray *tempArray;
@property (nonatomic,copy)NSString *order_id;
@property (weak, nonatomic) IBOutlet UIButton *backbutton;
@property (weak, nonatomic) IBOutlet UIView *weiBGView;
@property (weak, nonatomic) IBOutlet UIView *aliBGView;
@property (weak, nonatomic) IBOutlet UIWindow *okwindow;

@end

@implementation OKViewViewController
- (IBAction)goback
{
    
    
    [self dismissViewControllerAnimated:false completion:nil];
    
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeokwindow" object:nil];
    
}
- (void)dealloc
{
   
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    
//
//    [self.okwindow makeKeyAndVisible];
//    self.okwindow.hidden = false;
    
     UIBezierPath *polygonPath = [UIBezierPath bezierPath];
       
       // 这些点的位置都是相对于所在视图的
       // 起点
       [polygonPath moveToPoint:CGPointMake(25, 5)];
       // 其他点
       [polygonPath addLineToPoint:CGPointMake(10, 15)];
       [polygonPath addLineToPoint:CGPointMake(25, 25)];
       
       //    [polygonPath closePath]; // 添加一个结尾点和起点相同
       
       CAShapeLayer *polygonLayer = [CAShapeLayer layer];
       polygonLayer.lineWidth = 3;
       polygonLayer.strokeColor = [UIColor whiteColor].CGColor;
       polygonLayer.path = polygonPath.CGPath;
       polygonLayer.fillColor = nil; // 默认为blackColor
       [self.backbutton.layer addSublayer:polygonLayer];
    // Do any additional setup after loading the view from its nib.
}

- (void)setContentWithDes:(NSString *)desStr AndCount:(NSString *)count AndOrder:(NSString *)order AndTypeInfo:(NSArray *)infoArr withRoleinifo:(NSDictionary *)role order_id:(NSString *)order_id
{
    NSString *lvStr = nil;
     NSString *lanStr = nil;
     NSString *lvCode = nil;
     NSString *lanCode = nil;
     NSString *lvText = nil;
     NSString *lanText = nil;
    self.roleinfo = role;
    self.tempArray = infoArr;
    self.order_id = order_id;
     for (NSDictionary *temDic in infoArr) {
         NSString * code1 = @"code";
         NSString *code = temDic[code1];
         if ([code containsString:@"lip"]) {
             lanStr = temDic[@"icon"];
             lanCode = temDic[@"name"];
             lanText = temDic[code1];
         }else if ([code containsString:@"ech"]){
             lvStr = temDic[@"icon"];
             lvCode = temDic[@"name"];
             lvText = temDic[code1];
         }
     }
    
    self.TitileLabel.text = [NSString stringWithFormat:@"商品描述:%@",desStr];
    self.price.text = [NSString stringWithFormat:@"充值金额:%@",count];
    self.order_idLabel.font = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"订单编号:%@",order]];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 4)];
    self.order_idLabel.attributedText = string;
    
    self.weiImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:lvStr]]];
     self.aliImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:lanStr]]];
    UITapGestureRecognizer *wetap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(weiImageTap:)];
    wetap.accessibilityLabel =lvText;
    [self.weiBGView addGestureRecognizer:wetap];
    

        self.weiBGView.hidden =  (lvText.length ==0 || lvText == nil) ? true : false;
    
    
    UITapGestureRecognizer *alitap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aliImageTap:)];
    alitap.accessibilityLabel =lanText;
    [self.aliBGView addGestureRecognizer:alitap];
    
    
    self.aliBGView.hidden =  (lanText.length ==0 || lanText == nil) ? true : false;

    
    [self.weibutton setTitle:lvCode forState:UIControlStateNormal];
    self.weibutton.accessibilityLabel = lvText;
    self.alibuton.accessibilityLabel = lanText;
    [self.alibuton setTitle:lanCode forState:UIControlStateNormal];
    
}


- (void)weiImageTap:(UITapGestureRecognizer *)tap
{
    [self requestWithOrderID:tap.accessibilityLabel AndWay:self.tempArray AndRoleInfo:self.roleinfo];

}
- (void)aliImageTap:(UITapGestureRecognizer *)tap
{
    [self requestWithOrderID:tap.accessibilityLabel AndWay:self.tempArray AndRoleInfo:self.roleinfo];

}


- (void)weibuttonClick:(UIButton *)button
{
    
//    [self requestWithOrderID:button.accessibilityLabel AndWay:self.tempArray AndRoleInfo:self.roleinfo];
}

- (void)apliButtonClick:(UIButton *)button
{
//    [self requestWithOrderID:button.accessibilityLabel AndWay:self.tempArray AndRoleInfo:self.roleinfo];

}
- (void)requestWithOrderID:(NSString *)orderID AndWay:(NSArray *)infoArr AndRoleInfo:(NSDictionary *)roleInfo
{
    [QF_HZActivityIndicatorView showLoading:@""];

    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/pay/payment",GameTop];
//    NSDictionary *user = [QF_Tool XJloadInfo:UserInfo];
       NSDictionary *user =  [QF_Tool QF_getUserInfo];
    NSString *way = orderID;
   

    
    
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    roleInfo,@"role",nil];

    NSMutableDictionary *parames = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    user[@"access_token"],@"access_token",
                                    [QF_Option share].QF_outTradeNo,@"order_id",
                                    way,@"way",nil];
    NSDictionary *tempdic = @{@"params":parames};
    [tempDic addEntriesFromDictionary:tempdic];
    
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempDic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        [QF_HZActivityIndicatorView hide];

        NSInteger code = [responseObject[@"code"] integerValue];
        if (code == 0) {
            NSInteger code = [responseObject[@"code"] integerValue];
                   if (code == 0) {
//                       block(responseObject[@"data"]);
                       if (responseObject[@"data"]!=nil )
                       {
                           NSDictionary *data = responseObject[@"data"];
                           if (data[@"url"]!=nil)
                           {
                               [self goback];

                               [self XJpresentSafariViewController:data[@"url"]];
//                               [self goback];

                           }
                       }
                       
                   }else{
                       
                       [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                       [self goback];
                   }

        }else{
            [QF_HZActivityIndicatorView hide];

            [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
            [self goback];


        }
    } failure:^(NSError * _Nonnull error) {
        [self goback];

    }];
    
}
- (void)XJpresentSafariViewController:(NSString *)str{


    if (@available(iOS 9.0, *)) {
    
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:str]];
        safariVC.delegate = self;

        [[QF_Tool QF_weakVC] presentViewController:safariVC animated:YES completion:^{

        }];
//        [self presentViewController:safariVC animated:YES completion:^{
//
//        }];
        
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
   
}

-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully{
    
 
    
//    [self goback];
}




@end
