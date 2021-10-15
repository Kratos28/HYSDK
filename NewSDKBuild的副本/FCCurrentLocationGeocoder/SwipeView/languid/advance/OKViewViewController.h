//
//  OKViewViewController.h
//  HYNewSDK
//
//  Created by K on 2020/9/28.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OKViewViewController : UIViewController

- (IBAction)goback;


- (void)setContentWithDes:(NSString *)desStr AndCount:(NSString *)count AndOrder:(NSString *)order AndTypeInfo:(NSArray *)infoArr withRoleinifo:(NSDictionary *)role order_id:(NSString *)order_id;
@end

NS_ASSUME_NONNULL_END
