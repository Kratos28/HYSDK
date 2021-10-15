//
//  QF_NewSDKWindow.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKWindow.h"
#import "QFNewSDKViewController.h"

@interface QFNewSDKWindow()

@property (nonatomic,strong)QFNewSDKViewController *QF_NewWindowVC;

@end


@implementation QFNewSDKWindow


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self.rootViewController removeFromParentViewController];
        self.rootViewController = nil;
        self.tintColor = [UIColor clearColor];
        self.QF_NewWindowVC =  [[QFNewSDKViewController alloc]initWithNibName:NSStringFromClass([QFNewSDKViewController class]) bundle:[NSBundle bundleForClass:[QFNewSDKViewController class]]];
        
        

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
        
        self.windowLevel = UIWindowLevelNormal;
        
        self.rootViewController = self.QF_NewWindowVC;
        self.hidden = false;
        //[QF_YinSi shareManager];
    
        
        
    }
    return self;
}
- (void)dealloc
{
    self.QF_NewWindowVC = nil;
}


@end
