//
//  KLBroadcastInputViewCell.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/6.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "acountTextFied.h"
#import "passwordTextField.h"
NS_ASSUME_NONNULL_BEGIN


@interface KLBroadcastInputViewCell : UIView
///账号
@property (weak, nonatomic) IBOutlet acountTextFied *KLdurationImageView;
///密码
@property (weak, nonatomic) IBOutlet passwordTextField *KLprePhaseDate;



@end

NS_ASSUME_NONNULL_END
