//
//  QFNewSDKBaseViewController.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "QFNewSDKBaseViewController.h"
@interface QFNewSDKBaseViewController ()

@end

@implementation QFNewSDKBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
            self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        }else{
            self.modalPresentationStyle=UIModalPresentationCurrentContext;
        }
        //
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}



- (void)dealloc
{

}


@end
