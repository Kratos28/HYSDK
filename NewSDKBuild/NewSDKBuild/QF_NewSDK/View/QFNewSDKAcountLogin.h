//
//  QFNewSDKAcountLogin.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "acountTextFied.h"
#import "passwordTextField.h"
NS_ASSUME_NONNULL_BEGIN


@interface QFNewSDKAcountLogin : UIView
///账号
@property (weak, nonatomic) IBOutlet acountTextFied *QF_AccountTextField;
///密码
@property (weak, nonatomic) IBOutlet passwordTextField *QF_passwordTextField;



@end

NS_ASSUME_NONNULL_END
