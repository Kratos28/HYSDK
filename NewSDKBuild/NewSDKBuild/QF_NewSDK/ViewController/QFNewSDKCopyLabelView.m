//
//  QF_NewSDKCopyLabelView.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKCopyLabelView.h"
#import "QF_NewSDKLabelCopyButton.h"
#import <SafariServices/SafariServices.h>
@interface QFNewSDKCopyLabelView() <QF_NewSDKLabelCopyButtonDelegate>
@property (weak, nonatomic) IBOutlet QF_NewSDKLabelCopyButton *QF_liwubao1;
@property (weak, nonatomic) IBOutlet QF_NewSDKLabelCopyButton *QF_liwubao2;
@property (weak, nonatomic) IBOutlet QF_NewSDKLabelCopyButton *QF_liwubao3;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKCopyLabelGoBackButton;


@end





@implementation QFNewSDKCopyLabelView



- (IBAction)QF_copylabelViewMorelibaoClick:(id)sender {
    
    NSDictionary *logindApi  =  [QF_Tool getaccountlogindapi];
           guard(logindApi) else return;
           NSDictionary *kf = logindApi[@"gifbag"];
           guard(kf) else return;
    
    NSURL *url =  [NSURL URLWithString:kf[@"moregiftBag"]];
    if ([[UIApplication sharedApplication]canOpenURL:url])
    {
        SFSafariViewController *Sf =  [[SFSafariViewController alloc]initWithURL:url];
        [self presentViewController:Sf animated:false completion:nil];
    }
}
- (IBAction)QF_copyLabelgobackClick:(id)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *logindApi  =  [QF_Tool getaccountlogindapi];
         guard(logindApi) else return;
         NSDictionary *kf = logindApi[@"gifbag"];
         guard(kf) else return;
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
       
       // 这些点的位置都是相对于所在视图的
       // 起点
       [polygonPath moveToPoint:CGPointMake(25, 10)];
       // 其他点
       [polygonPath addLineToPoint:CGPointMake(15, 20)];
       [polygonPath addLineToPoint:CGPointMake(25, 30)];
       
       //    [polygonPath closePath]; // 添加一个结尾点和起点相同
       
       CAShapeLayer *polygonLayer = [CAShapeLayer layer];
       polygonLayer.lineWidth = 3;
       polygonLayer.strokeColor = [UIColor whiteColor].CGColor;
       polygonLayer.path = polygonPath.CGPath;
       polygonLayer.fillColor = nil; // 默认为blackColor
       [self.QF_NewSDKCopyLabelGoBackButton.layer addSublayer:polygonLayer];
    
    
    self.QF_liwubao1.buttonDelegate = self;
    self.QF_liwubao1.QF_textlabel.text = @"新手礼包";
    self.QF_liwubao1.QF_copyButton.accessibilityIdentifier = kf[@"newRegister"];
    [self.QF_liwubao1.QF_copyButton setTitle:@"复制礼包码" forState:UIControlStateNormal];
    

    self.QF_liwubao2.buttonDelegate = self;
     self.QF_liwubao2.QF_textlabel.text = @"实名认证礼包";
    self.QF_liwubao2.QF_copyButton.accessibilityIdentifier = kf[@"realName"];
    [self.QF_liwubao2.QF_copyButton setTitle:@"复制礼包码" forState:UIControlStateNormal];
    
    self.QF_liwubao3.buttonDelegate = self;
     self.QF_liwubao3.QF_textlabel.text = @"绑定手手机礼包";
    [self.QF_liwubao3.QF_copyButton setTitle:@"复制礼包码" forState:UIControlStateNormal];
    self.QF_liwubao3.QF_copyButton.accessibilityIdentifier = kf[@"bindNumber"];
}

-(void)QF_NewSDKLabelCopyButtonClickedLabelandButton:(UILabel *)label button:(UIButton *)button LabelCopyButton:(QF_NewSDKLabelCopyButton *)QF_NewSDKLabelCopyButton
{
    NSDictionary *user = [QF_Tool QF_getUserInfo];
    if (button.accessibilityIdentifier.length > 0) {
        if ([label.text isEqualToString:@"实名认证礼包"]) {
          if (![user[@"verify_status"] isKindOfClass:[NSNull class]] && [user[@"verify_status"] intValue] == 0)
          {
              [QF_Tool QF_alertView:@"请先实名认证" withcompletion:nil];
              return;
          }
        }else if ([label.text isEqualToString:@"绑定手手机礼包"])
        {
            if ([user[@"mobile"] isKindOfClass:[NSNull class]]  == false&& [user[@"mobile"] length] ==0)
            {
                    [QF_Tool QF_alertView:@"请先绑定手机" withcompletion:nil];
                    return;
            }
        }
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string =button.accessibilityIdentifier;
        [QF_Tool QF_alertView:@"复制成功" withcompletion:nil];
        
    }
    

    
}




@end
