//
//  QF_NewSDKTipViewController.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QF_NewSDKLabelCopyButton.h"
typedef NS_ENUM(NSUInteger, action) {
    phone,
    number
};


NS_ASSUME_NONNULL_BEGIN

@interface QFNewSDKTipViewController : UIViewController
@property (weak, nonatomic) IBOutlet QF_NewSDKLabelCopyButton *QF_NewSDKLabelButton1;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKTipActionButton;
@property (weak, nonatomic) IBOutlet UIButton *QF_NewSDKTipGoBackClick;
@property (assign, nonatomic)  action QF_type;

@end

NS_ASSUME_NONNULL_END
