//
//  OKVIewWindow.m
//  HYGameSDK
//
//  Created by K on 2021/1/12.
//  Copyright © 2021 jjwp. All rights reserved.
//

#import "OKVIewWindow.h"
#import "OKViewViewController.h"
#import "QF_Tool.h"

@interface OKVIewWindow()
@property(nonatomic,strong)OKViewViewController *qf;
@end

@implementation OKVIewWindow
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    
        
        OKViewViewController *qf =  [[OKViewViewController alloc] initWithNibName:NSStringFromClass([OKViewViewController class])  bundle:[NSBundle bundleForClass:[OKViewViewController class]]];


        
        self.qf =qf;
        
        
        self.windowLevel = UIWindowLevelNormal;
//        OKViewViewController *qf =  [[OKViewViewController alloc]init];
//                 qf.view.frame = [QF_Tool QF_weakVC].view.frame;
//        qf.view.backgroundColor = [UIColor orangeColor];
        if (@available(iOS 13.0, *))
        {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
             {
                 if (windowScene.activationState == UISceneActivationStateForegroundActive)
                 {
                     self.windowScene = windowScene;
                     break;
                 }
             }
        }
        
    
        
//        UIViewController *viewc = [[UIViewController alloc] init];
//
//       UISwitch *sw =  [[UISwitch alloc ]init];
//        [viewc.view addSubview:sw];
//
//        viewc.view.backgroundColor = [UIColor redColor];
//        viewc.view.frame = [QF_Tool QF_weakVC].view.frame;;
//
        self.rootViewController = qf;
        [self makeKeyAndVisible];
        self.hidden = false;
    
        
        
    }
    return self;
}


- (void)setContentWithDes:(NSString *)desStr AndCount:(NSString *)count AndOrder:(NSString *)order AndTypeInfo:(NSArray *)infoArr withRoleinifo:(NSDictionary *)role order_id:(NSString *)order_id
{
    [self.qf setContentWithDes:desStr AndCount:count AndOrder:order AndTypeInfo:infoArr withRoleinifo:role order_id:order_id];
}
    
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
