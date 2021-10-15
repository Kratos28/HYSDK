//
//  QF_unbindVC.h
//  11QF_NewSDK
//
//  Created by K on 2020/5/27.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QF_CountDownButton.h"
#import "acountTextFied.h"
#import "codeTextField.h"
NS_ASSUME_NONNULL_BEGIN

@interface QFbindVC : UIViewController
@property (weak, nonatomic) IBOutlet acountTextFied *QF_accountTextField;
@property (weak, nonatomic) IBOutlet codeTextField *QF_code;
@property (weak, nonatomic) IBOutlet UIButton *QF_registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *goBackBtn;

@property (assign, nonatomic) BOOL isModifyBind;

@property (nonatomic,strong) QF_CountDownButton *QF_bingdsendMsg;
@end

NS_ASSUME_NONNULL_END
