//
//  QF_NewSDKTipViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKTipViewController.h"
#import "QF_Tool.h"
#import <SafariServices/SafariServices.h>
@interface QFNewSDKTipViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKTipgobackbutton;

@end

@implementation QFNewSDKTipViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint:CGPointMake(25, 10)];
    [polygonPath addLineToPoint:CGPointMake(15, 20)];
    [polygonPath addLineToPoint:CGPointMake(25, 30)];
    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
    polygonLayer.lineWidth = 3;
    polygonLayer.strokeColor = [UIColor whiteColor].CGColor;
    polygonLayer.path = polygonPath.CGPath;
    polygonLayer.fillColor = nil; // 默认为blackColor
    [self.QF_NewSDKTipGoBackClick.layer addSublayer:polygonLayer];
    
 
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)QF_NewSDKTipGoclick:(id)sender {
    [self dismissViewControllerAnimated:false completion:nil];
}

-  (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    NSDictionary *logindApi  =  [QF_Tool getaccountlogindapi];
    guard(logindApi) else return;
    NSDictionary *kf = logindApi[@"kf"];
    guard(kf) else return;

    

    if (self.QF_type == number) {
        
        
           [self.QF_NewSDKTipActionButton setTitle:@"复制号码" forState:UIControlStateNormal];
        self.QF_NewSDKLabelButton1.QF_textlabel.text = [NSString stringWithFormat:@"QQ客服:%@",kf[@"kfqq"]];

       }else if (self.QF_type == phone)
       {
           [self.QF_NewSDKTipActionButton setTitle:@"拨打电话" forState:UIControlStateNormal];
           self.QF_NewSDKLabelButton1.QF_textlabel.text =[NSString stringWithFormat:@"客服电话:%@",kf[@"kfphone"]];
       }
    
    
}



- (IBAction)QF_OKGW:(id)sender {
    NSDictionary *logindApi  =  [QF_Tool getaccountlogindapi];
       guard(logindApi) else return;
       NSDictionary *kf = logindApi[@"kf"];
       guard(kf) else return;
        if (self.QF_type == phone) {
        NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",kf[@"kfphone"]];
        if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:str]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }else if(self.QF_type == number)
    {
     //复制号码
        guard([kf[@"kfqq"] length] >0) else return;
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = kf[@"kfqq"];
        [QF_Tool QF_alertView:@"复制成功" withcompletion:nil];
    }
   
}


@end
