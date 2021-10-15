//
//  QFunbindVC.h
//  HYGameSDK
//
//  Created by K on 2020/12/18.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "codeTextField.h"
#import "QF_CountDownButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface QFmodifyBindVC : UIViewController
@property (weak, nonatomic) IBOutlet codeTextField *QF_code;
@property (weak, nonatomic) IBOutlet UIButton *QF_registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *goBackBtn;
@property (nonatomic,weak) UIView *bgView;
@property (nonatomic,weak)UILabel *userLabel;
@property (nonatomic,weak)UILabel *tip;

@property (nonatomic,strong) QF_CountDownButton *QF_bingdsendMsg;
@end

NS_ASSUME_NONNULL_END
