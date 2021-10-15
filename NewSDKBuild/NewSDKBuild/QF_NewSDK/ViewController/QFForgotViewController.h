//
//  QF_ForgotViewController.h
//  QFSDK
//
//  Created by K on 2019/6/26.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "QFNewSDKBaseViewController.h"
#import "QF_CountDownButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface QFForgotViewController : QFNewSDKBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *QF_baseAccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *QF_basePasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *QF_baseCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *QF_ComfirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *goback;
@property (nonatomic,strong) QF_CountDownButton *QF_forgotsendMsg;

@end

NS_ASSUME_NONNULL_END
