//
//  QF_NewSDKTipViewController.h
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProgressModule.h"
typedef NS_ENUM(NSUInteger, action) {
    phone,
    number
};


NS_ASSUME_NONNULL_BEGIN

@interface KLFanplayShareRecommendPO : UIViewController
@property (weak, nonatomic) IBOutlet KLProgressModule *KLfansRankLabel;
@property (weak, nonatomic) IBOutlet UIButton *KLshareOriginView;
@property (weak, nonatomic) IBOutlet UIButton *KLisToday;
@property (assign, nonatomic)  action KLvideoConfiguration;

@end

NS_ASSUME_NONNULL_END
