//
//  QF_ForgotViewController.h
//  QFSDK
//
//  Created by K on 2019/6/26.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import "KLtrendPropertyLiveBuilder.h"
#import "KLUTBeforeFilter.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLStarArrivalForHomepageVORoyalAssentDTO : KLtrendPropertyLiveBuilder
@property (weak, nonatomic) IBOutlet UITextField *KLkeywordsList;
@property (weak, nonatomic) IBOutlet UITextField *KLbgImgUrl;
@property (weak, nonatomic) IBOutlet UITextField *KLjsonCache;
@property (weak, nonatomic) IBOutlet UIButton *KLarrayImageRocket;
@property (weak, nonatomic) IBOutlet UIButton *goback;
@property (nonatomic,strong) KLUTBeforeFilter *KLloginModel;

@end

NS_ASSUME_NONNULL_END
