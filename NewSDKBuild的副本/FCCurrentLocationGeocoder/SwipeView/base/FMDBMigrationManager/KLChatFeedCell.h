//
//  KLstarCellController.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/11.
//  Copyright © 2020 sowofw. All rights reserved.
// 实名认证控制器

#import "KLtrendPropertyLiveBuilder.h"
@class acountTextFied;

NS_ASSUME_NONNULL_BEGIN

@interface KLChatFeedCell : KLtrendPropertyLiveBuilder
@property (weak, nonatomic) IBOutlet UIButton *KLparamsDataSource;
@property (weak, nonatomic) IBOutlet acountTextFied *accountTextField;

@property (weak, nonatomic) IBOutlet acountTextFied *passwordTextField;
@end

NS_ASSUME_NONNULL_END
