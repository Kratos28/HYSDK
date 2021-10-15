//
//  QFReport.m
//  HYNewSDK
//
//  Created by K on 2020/8/17.
//  Copyright © 2020 jjwp. All rights reserved.
//

#import "QFReport.h"
#import "QF_Tool.h"
#import "QF_NewSDKNet.h"
#import "QF_Option.h"


@implementation QFReport
+ (void)XJReportActionBlock:(callBack)block
{

    
    


    NSString *typeStr = @"active";

    NSString *URL = [NSString stringWithFormat:@"%@/v1/api/log/%@",GameTop,typeStr];
    [QF_NewSDKNet QF_requestWithURLString:URL parameters:nil type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        
        NSInteger code = [responseObject[@"code"] integerValue];

        if (code == 0) {
            
            block(true);
        }else{
 

            [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
        }
        
        
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    
 
}
@end
