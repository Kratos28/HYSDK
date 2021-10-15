//
//  QF_unbindVC.h
//  11QF_NewSDK
//
//  Created by K on 2020/5/27.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLUTBeforeFilter.h"
#import "acountTextFied.h"
#import "codeTextField.h"
NS_ASSUME_NONNULL_BEGIN

@interface KLShowReplayTime : UIViewController
@property (weak, nonatomic) IBOutlet acountTextFied *KLvalidDuration;
@property (weak, nonatomic) IBOutlet codeTextField *KLisShowNick;
@property (weak, nonatomic) IBOutlet UIButton *KLloginToken;
@property (weak, nonatomic) IBOutlet UIButton *goBackBtn;

@property (assign, nonatomic) BOOL isModifyBind;

@property (nonatomic,strong) KLUTBeforeFilter *KLresourceLoader;
@end

NS_ASSUME_NONNULL_END
