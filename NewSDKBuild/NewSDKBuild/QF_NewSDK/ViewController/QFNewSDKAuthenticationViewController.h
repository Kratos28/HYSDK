//
//  QF_NewSDKAuthenticationViewController.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/11.
//  Copyright © 2020 sowofw. All rights reserved.
// 实名认证控制器

#import "QFNewSDKBaseViewController.h"
@class acountTextFied;

NS_ASSUME_NONNULL_BEGIN

@interface QFNewSDKAuthenticationViewController : QFNewSDKBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKAuthenticationGoBack;
@property (weak, nonatomic) IBOutlet acountTextFied *accountTextField;

@property (weak, nonatomic) IBOutlet acountTextFied *passwordTextField;
@end

NS_ASSUME_NONNULL_END
