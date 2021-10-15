//
//  QFunbindVC.h
//  HYGameSDK
//
//  Created by K on 2020/12/18.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "codeTextField.h"
#import "KLUTBeforeFilter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLWVBridgeUtil : UIViewController
@property (weak, nonatomic) IBOutlet codeTextField *KLisShowNick;
@property (weak, nonatomic) IBOutlet UIButton *KLloginToken;
@property (weak, nonatomic) IBOutlet UIButton *goBackBtn;
@property (nonatomic,weak) UIView *bgView;
@property (nonatomic,weak)UILabel *userLabel;
@property (nonatomic,weak)UILabel *tip;

@property (nonatomic,strong) KLUTBeforeFilter *KLresourceLoader;
@end

NS_ASSUME_NONNULL_END
