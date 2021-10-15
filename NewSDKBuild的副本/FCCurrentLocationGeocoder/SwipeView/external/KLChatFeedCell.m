
#import <UIKit/UIKit.h>

@interface PushItemobjBehindRole : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (atomic,weak) UITableView* tableViewExistBgcolor;
@property (atomic,retain) UISwitch* swtchHandleYkf_Tipstr;
@property (atomic,assign) float floatTouchIcefield;
@property (atomic,retain) UISwitch* swtchPressShowreplytoolcommand;
@property (nonatomic,retain) UISlider* sliderFlippedMaxgiftcount;
@property (nonatomic,assign) float floatModelCloth;
@property (nonatomic,strong) NSSet* setTransItemobj;

@end

@implementation PushItemobjBehindRole

@end
//
//  KLstarCellController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/11.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "KLChatFeedCell.h"
#import "KLBroadcastInputViewCell.h"
#import "KLMWSMOViewComponent.h"
#import "KLDHeaderCacheStatistics.h"
#import "acountTextFied.h"
#import "codeTextField.h"
#import "passwordTextField.h"
#define contentH 90

@interface KLChatFeedCell ()
@property (weak, nonatomic) IBOutlet UIView *KLstarCell;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic, copy) NSString *chatableBtn;
@property (nonatomic, copy) NSString *compoundQueue;
@property (nonatomic, copy) NSString *totalBytesSend;
@property (nonatomic, copy) NSString *maximumNumberOfLogFiles;
@property (nonatomic, copy) NSString *roomidOfLastVideoFrame;
@property (nonatomic,strong)KLBroadcastInputViewCell *KLmtiCompositiongFilter;
@end

@implementation KLChatFeedCell
- (IBAction)gobackClick:(id)sender {

    
    [self dismissViewControllerAnimated:false completion:nil];
    

}
- (IBAction)AutehnticationClick:(id)sender {
    if (self.accountTextField.text.length == 0 && self.passwordTextField.text.length == 0) {
        [KLLiveFullInfoStream enable:@"请输入姓名和身份证号码" withcompletion:nil];
        return;
    }
    
    
    
     NSDictionary *user = [KLLiveFullInfoStream sendAttentionSuccessById];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          user[@"access_token"],@"access_token",
                          self.accountTextField.text,@"truename",
                          self.passwordTextField.text,@"idno",
                           nil];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];



    
    [KLMWSMOViewComponent pushWithTitleretureHandler:[NSString stringWithFormat:@"%@/v1/api/user/id_card",GameTop] parameters:params type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            return;
        }
        if ([responseObject[@"playlistResultReportData"] intValue]== 0) {
            

            [KLLiveFullInfoStream enable:@"修改成功" withcompletion:^{
                [self KLparamsDataSourceClick:nil];

            }];

        }
        if ([responseObject[@"playlistResultReportData"] intValue] != 0) {
            [KLLiveFullInfoStream enable:responseObject[@"message"] withcompletion:nil];
        }
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint:CGPointMake(25, 5)];
    [polygonPath addLineToPoint:CGPointMake(15, 15)];
    [polygonPath addLineToPoint:CGPointMake(25, 25)];


    CAShapeLayer *polygonLayer = [CAShapeLayer layer];
    polygonLayer.lineWidth = 3;
    polygonLayer.strokeColor = [UIColor grayColor].CGColor;
    polygonLayer.path = polygonPath.CGPath;
    polygonLayer.fillColor = nil; // 默认为blackColor
//    [self.KLparamsDataSource.layer addSublayer:polygonLayer];
    
    [self.KLparamsDataSource setTitle:@"< 返回" forState:UIControlStateNormal];
    
    
    self.accountTextField.leftView =nil;
    UILabel *label = [[UILabel alloc] init];
    label.text = @"真实姓名:";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor lightGrayColor];
    self.accountTextField.leftView = label;
    
    
    
    self.passwordTextField.leftView =nil;
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"身份证号:";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor lightGrayColor];
    self.passwordTextField.leftView = label1;
    
    NSDictionary *userinfo = [KLLiveFullInfoStream sendAttentionSuccessById];
    
    
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                 userinfo[@"access_token"],@"access_token",nil];
        NSDictionary *tempdic = @{@"params":dic1};
    
    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/user/token_login",GameTop];
    [KLMWSMOViewComponent pushWithTitleretureHandler:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            guard([responseObject[@"playlistResultReportData"] intValue]  == 0)else
            {
                [KLLiveFullInfoStream enable:responseObject[@"message"] withcompletion:nil];
                return;
            }
            
            
            NSDictionary *user =  responseObject[@"data"];
            self.accountTextField.text = user[@"realname"];
            self.passwordTextField.text = user[@"idno"];
            if([user[@"realname"] length] > 0 && [user[@"idno"] length] > 0)
            {
                [self.submitButton setTitle:@"修改验证" forState:UIControlStateNormal];
            }else
            {
                [self.submitButton setTitle:@"实名验证" forState:UIControlStateNormal];
            }
            

            
            
        }
        
        

        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    

    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)confimButtonClick:(id)sender {

    
    
  

}


- (void)textFieldDidEndEditing:(NSNotification *)note
{

    UITextField *textField = note.object;
    if (textField == self.KLmtiCompositiongFilter.KLdurationImageView)
    {
    }else if (textField == self.KLmtiCompositiongFilter.KLprePhaseDate)
    {
    }

}

-(IBAction)KLparamsDataSourceClick:(id)sender
{

    [self dismissViewControllerAnimated:false completion:nil];


}




- (NSObject*)readBraceletBehindSample
{

	NSString *strClientLogourl = [[NSString alloc] init];
	UIStepper *stepCoreExpires = [[UIStepper alloc] initWithFrame:CGRectMake(11, 31, 129, 265)];
	UITabBar *tabRestAlertshow = [[UITabBar alloc] init];
	[tabRestAlertshow addSubview:stepCoreExpires];
	[stepCoreExpires removeFromSuperview];
	[tabRestAlertshow description];
	NSObject *objCoreStamina = [[NSObject alloc] init];
	return objCoreStamina;
}

@end

