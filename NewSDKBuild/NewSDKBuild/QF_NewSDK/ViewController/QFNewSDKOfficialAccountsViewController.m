//
//  QF_NewSDKOfficialAccountsViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/11.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKOfficialAccountsViewController.h"
#import "QF_Tool.h"
#import "QF_Option.h"
#import "QF_NewSDKNet.h"
#import "QF_HZActivityIndicatorView.h"
@interface QFNewSDKOfficialAccountsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKOfficalAccountgoback;
@property (weak, nonatomic) IBOutlet UIImageView *QF_NewSDKOfficalAccountImageView;
@property (weak, nonatomic) IBOutlet UILabel *titilabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation QFNewSDKOfficialAccountsViewController
- (IBAction)copyLabel:(id)sender {
    
    if (self.subtitleLabel.text.length == 0) {
        return;;
    }
    
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    
            
    pasteboard.string =  self.subtitleLabel.text;
    
    [QF_Tool QF_alertView:@"复制成功" withcompletion:nil];
    
}
- (IBAction)saveRCode:(id)sender {
    
    [QF_Tool QF_screenShots:self.QF_NewSDKOfficalAccountImageView completionHandle:^(NSError * _Nonnull rwe, NSString * _Nonnull error ) {
        if ([error isEqualToString:@"成功"]) {
            [QF_Tool QF_alertView:@"图片保存成功" withcompletion:nil];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    QF_Option *open =  [QF_Option share];

    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 open.QF_gameID,@"game_id",[QF_Tool QF_getNowTimeTimestamp],@"ts",nil];
        NSDictionary *tempdic = @{@"params":dic1};
    
    [QF_HZActivityIndicatorView showLoading:@""];
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/get_official_accounts",GameTop];
    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        [QF_HZActivityIndicatorView hide];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([responseObject[@"code"] intValue] == 0) {
              NSDictionary *data= responseObject[@"data"];
                guard(data!= nil)else
                {
                    return;;
                }
                
                self.titilabel.text = data[@"oa_name"] ?  data[@"oa_name"] : @"";

                self.subtitleLabel.text = data[@"oa_number"] ?  data[@"oa_number"] : @"";
                
                NSData *dataurl = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:data[@"qrcode_url"]]];
                self.QF_NewSDKOfficalAccountImageView.image = [UIImage imageWithData:dataurl];
            }else
            {
                [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
            }
            
            
    
        }
        
        

        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    
//    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
//       [polygonPath moveToPoint:CGPointMake(25, 5)];
//       [polygonPath addLineToPoint:CGPointMake(15, 15)];
//       [polygonPath addLineToPoint:CGPointMake(25, 25)];
//       CAShapeLayer *polygonLayer = [CAShapeLayer layer];
//       polygonLayer.lineWidth = 3;
//       polygonLayer.strokeColor = [UIColor grayColor].CGColor;
//       polygonLayer.path = polygonPath.CGPath;
//       polygonLayer.fillColor = nil; // 默认为blackColor
//       [self.QF_NewSDKOfficalAccountgoback.layer addSublayer:polygonLayer];
    
    [self.QF_NewSDKOfficalAccountgoback setTitle:@"< 返回" forState:UIControlStateNormal];
    
    

    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)QF_NewSDKOfficalAccountgobackClick:(id)sender {
    
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (IBAction)QF_NewSDKOfficalAccountSaveButton:(id)sender
{
    

}

@end
