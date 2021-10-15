//
//  QF_Net.h
//  QFSDK
//
//  Created by K on 2019/6/5.
//  Copyright © 2019 GameSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN



/*
 
 
 域名列表
 game.lzyjzxyjwl.com
 game.iosyjjxwl.com  //已经备案
 game.iosjwj.com
 game.iosjswxly.com
 game.iosjswlfy.com
 game.iosjsntxxi.com
 game.iosjsntxx.com
 game.ynxxios.com
 game.yjxxiosapp.com //已经备案
 game.tgshj.com
 game.tdxxios.com //已经备案
 game.shanhjyslios.com
 
 */



//测试域名
//#define GameTop @"http://game.lzgame.top"
//#define GameTop @"https://game.chamaomao.top"

#define GameTop @"https://sdk.cmaom.com"
//#define GameTop @"http://test.chamaomao.top"


//#define GameTop @"http://test.lzgame.top"

//#define GameTop @"http://game.shanhjyslios.com"


//#define APITop GameTop

//#define GameTop @"https://game.superfun.top"
#define APITop GameTop


typedef NS_ENUM(NSUInteger,QF_HttpRequestType) {
    
    HttpRequestTypeGet = 1,
    
    HttpRequestTypePost = 2
    
};


@interface KLMWSMOViewComponent : NSObject
+ (void)pushWithTitleretureHandler:(NSString *)URLString  parameters:(id __nullable )parameters type:(QF_HttpRequestType)type success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure;


+ (void)cancle:(NSString *)URLString  withNumberofTime:(NSUInteger)ntimes parameters:(id)parameters type:(QF_HttpRequestType)type success:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure;


+ (void)updateSearchButtonBackgroundColorWithDefaultColor:(NSString *)URLString parameters:( id )parameters type:(QF_HttpRequestType)type success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure;

//获取chid;
+ (void)homeMainFrameUseServer:(void(^)(bool isgechild))result;
+ (void)IupdateDataForCellSlotAtIndexPathdata;
+ (void)sequenceWithTupleBackingArrayoffset:(NSString *)name hostSlaveInfohostRatio:(NSDictionary *)info;
@end

NS_ASSUME_NONNULL_END
