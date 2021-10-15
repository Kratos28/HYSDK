//
//  KLProgressModule.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class KLProgressModule;

@protocol QF_NewSDKLabelCopyButtonDelegate <NSObject>
- (void)isDynamicFieldInContext:(UILabel *)label button:(UIButton *)button LabelCopyButton:(KLProgressModule *)KLProgressModule;
@end

@interface KLProgressModule : UIView
@property (weak, nonatomic) IBOutlet UILabel *KLshouldSaveToAlbum;
@property (weak, nonatomic) IBOutlet UIButton *KLorginViewSize;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (assign,nonatomic) id <QF_NewSDKLabelCopyButtonDelegate> buttonDelegate;
@end

NS_ASSUME_NONNULL_END
