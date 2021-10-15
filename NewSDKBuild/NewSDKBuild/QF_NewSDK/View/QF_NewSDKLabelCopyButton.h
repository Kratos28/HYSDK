//
//  QF_NewSDKLabelCopyButton.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QF_NewSDKLabelCopyButton;

@protocol QF_NewSDKLabelCopyButtonDelegate <NSObject>
- (void)QF_NewSDKLabelCopyButtonClickedLabelandButton:(UILabel *)label button:(UIButton *)button LabelCopyButton:(QF_NewSDKLabelCopyButton *)QF_NewSDKLabelCopyButton;
@end

@interface QF_NewSDKLabelCopyButton : UIView
@property (weak, nonatomic) IBOutlet UILabel *QF_textlabel;
@property (weak, nonatomic) IBOutlet UIButton *QF_copyButton;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (assign,nonatomic) id <QF_NewSDKLabelCopyButtonDelegate> buttonDelegate;
@end

NS_ASSUME_NONNULL_END
