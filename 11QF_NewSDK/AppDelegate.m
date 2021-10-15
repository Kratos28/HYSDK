//
//  AppDelegate.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

        
        
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

        if (@available(iOS 13.0, *))
        {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
             {
                 if (windowScene.activationState == UISceneActivationStateForegroundActive)
                 {
                     self.window.windowScene = windowScene;
                     break;
                 }
             }
        }


          [self.window makeKeyAndVisible];
          self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    
     
    
    return YES;
}


@end
