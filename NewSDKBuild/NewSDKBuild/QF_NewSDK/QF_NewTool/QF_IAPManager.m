//
//  QF_IAPManager.m
//  QFSDK
//
//  Created by K on 2020/2/17.
//  Copyright © 2020 GameSDK. All rights reserved.
//

#import "QF_IAPManager.h"
#import "QF_Tool.h"
#import "QF_Option.h"
#import "QF_NewSDKNet.h"
#import "QF_HZActivityIndicatorView.h"
#import <SafariServices/SafariServices.h>


#define Code @"code"
#define Transaction_id @"transaction_id"
#define Receipt_data @"receipt_data"
#define Access_token @"access_token"
#define Order_id @"order_id"
typedef void (^SKPaymentTransactionSuccessBlock)(NSString * invalidProductIdentifiers,NSDictionary *info);
typedef void (^SKPaymentTransactionfailureBlock)(NSString *errormsg);

@interface QF_IAPManager()  <SKPaymentTransactionObserver, SKProductsRequestDelegate>
@property (nonatomic,assign) BOOL IsTouchss;

@property (nonatomic, assign) BOOL goodsRequestFinished; //判断一次请求是否完成
@property (nonatomic,strong)SKPaymentTransaction *transaction;
@property (nonatomic,copy) SKPaymentTransactionSuccessBlock successBlock;
@property (nonatomic,copy) SKPaymentTransactionfailureBlock failuteBlock;
@end


@implementation QF_IAPManager
static id  sharedSingleton;

+(instancetype)shared{
    if (!sharedSingleton) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedSingleton = [[super allocWithZone:NULL] init];
            [sharedSingleton setIsTouchss:false];

        });
    }
    return sharedSingleton;
}
dispatch_queue_t iap_queue() {
    static dispatch_queue_t as_iap_queue;
    static dispatch_once_t onceToken_iap_queue;
    dispatch_once(&onceToken_iap_queue, ^{
        as_iap_queue = dispatch_queue_create("com.iap.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return as_iap_queue;
}


+ (void)QF_presentSafariViewController:(NSString *)str
{
    NSCharacterSet *encodeUrlSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    str = [str stringByAddingPercentEncodingWithAllowedCharacters:encodeUrlSet];
    NSURL *url = [NSURL URLWithString:str];
    if (@available(iOS 9.0, *)) {
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            SFSafariViewController *safariViewController = [[SFSafariViewController alloc] initWithURL:url];
            if (@available(iOS 13.0, *)) {
                    safariViewController.modalPresentationStyle = UIModalPresentationFullScreen;
                }
            
            [[QF_Tool QF_weakVC] presentViewController:safariViewController animated:YES completion:^{
            }];
        }
    }else{
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
    }
}



- (NSMutableArray  *)getReceipt
{
    id ff =  [QF_Tool keychainGetDataWithAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];
    if (!ff) {
        return nil;
    }
    return ff;
}
- (void)saveReceipt:(NSDictionary *)dict
{
    NSMutableArray *a = [self getReceipt];
    if (a.count >0) {
        NSString *receipt_data = dict[Receipt_data];
        bool isadd = true;
        for (int i =0; i<a.count; i++) {
            NSDictionary *p = a[i];
            NSString *precerpt_data = p[Receipt_data];
            if ([receipt_data isEqualToString:precerpt_data]) {
                isadd = false;
                break;;
            }
        }
        
        if (isadd) {
            [a addObject:dict];
        }
        [QF_Tool keychainSaveData:a withAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];


    }else
    {
        NSMutableArray *aa = [NSMutableArray array];
        if (dict.allKeys.count ==0) {
            return;
        }
        [aa addObject:dict];
        [QF_Tool keychainSaveData:aa withAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];

    }
    
}


- (void)removeReceipt:(NSString *)order_id
{
    
    NSMutableArray *a = [self getReceipt];

    if (a.count>0) {
        for (int i =0; i<a.count; i++) {
            NSDictionary *para = a[i];
            if (para[Receipt_data]!=nil && [para[Receipt_data] isEqualToString:order_id]) {
                [a removeObjectAtIndex:i];
            }
            
        }
        
        [QF_Tool keychainSaveData:a withAccountIdentifier:@"trigger" andServiceIdentifier:@"deviceIdentifier"];

    }else
    {
        NSMutableDictionary * deleteQueryDic = [QF_Tool keychainDicWithAccountId:@"trigger" andServiceId:@"deviceIdentifier"];
        // 删除指定条件的数据
        SecItemDelete((CFDictionaryRef)deleteQueryDic);
        deleteQueryDic = nil ;
    }
    
   

    
}

- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    
    self.goodsRequestFinished = YES; //成功，请求完成
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

#pragma mark -验证
- (void)verifyReceipt:(NSDictionary *)dct
{
    NSMutableDictionary *  dict = [NSMutableDictionary dictionary];
    [dict setObject: dct[Order_id] forKey:Order_id];
    [dict setObject: dct[@"game_id"] forKey:@"game_id"];
    [dict setObject: dct[Access_token] forKey:Access_token];
    [dict setObject: dct[Receipt_data] forKey:Receipt_data];

      NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];
    NSString *url =  [NSString stringWithFormat:@"%@/v1/api/pay/iapPay",GameTop];

        [QF_NewSDKNet QF_retryingWithURLString:url withNumberofTime:5 parameters:params type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {

            dispatch_async(dispatch_get_main_queue(), ^{

                [QF_HZActivityIndicatorView hide];
                
                
                [self removeReceipt:dct[Receipt_data]];

                    if ([responseObject[Code] intValue] == 0) {
                        [QF_Tool QF_alertView:@"到账成功" withcompletion:nil];

                        if (self.successBlock != nil) {
                            
                            self.successBlock(dct[Transaction_id],params);
                        }
                        
                    }else
                    {
                        [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];

                    }

            });

            
        } failure:^(NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [QF_HZActivityIndicatorView hide];
                     NSString *dom =  [NSString stringWithFormat:@"支付成功，到账失败，请保存当前截图,联系客服%@",error.domain];
                    if (dct[@"out_trade_no"] != nil) {
                        if ([dct[@"out_trade_no"] isKindOfClass:[NSString class]]) {
                            dom = [NSString stringWithFormat:@"支付成功，到账失败，请保存当前截图,联系客服%@---trade%@",error.domain,dct[@"out_trade_no"]];
                            if (self.failuteBlock != nil) {
                                
                                self.failuteBlock([NSString stringWithFormat:@"错误-id%@",dct[Transaction_id]]);
                            }
                        }
                    }
                    [QF_Tool QF_alertView:dom withcompletion:nil];

            });


        }];
}

#pragma mark -进入后台先保存订单
- (void)ApplicationDidEnterBackgroundNotification
{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    NSDictionary *userinfo =  [QF_Tool QF_getUserInfo];
    
    NSURL *receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receiptData = [NSData dataWithContentsOfURL:receiptUrl];
    NSString * receipt =[receiptData base64EncodedStringWithOptions:0];

    [dict setObject: [QF_Option share].QF_outTradeNo forKey:Order_id];
    [dict setObject:[QF_Option share].QF_gameID forKey:@"game_id"];
    [dict setObject:userinfo[Access_token] forKey:Access_token];
    [dict setObject:receipt forKey:Receipt_data];
    

    
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:userinfo[@"user_id"]];
    [[NSUserDefaults standardUserDefaults]synchronize];;
    
    if ([QF_Option share].QF_outTradeNo.length>0) {
        [QF_Tool keychainSaveData:[QF_Option share].QF_outTradeNo withAccountIdentifier:@"QF_outTradeNo" andServiceIdentifier:@"outTradeNo"];
    }
    
    if ([QF_Option share].QF_outTradeNo.length>0 &&
        receipt.length>0&& [userinfo[Access_token] length]>0 &&receipt.length>0)
    {
    
        [self saveReceipt:dict];
    }
}

- (void)startManager
{ //开启监听

    dispatch_async(dispatch_get_main_queue(), ^{
       
        self.goodsRequestFinished = YES;
        
        
        [[NSNotificationCenter defaultCenter]removeObserver:self];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(WillTerminateNotification1) name:UIApplicationWillTerminateNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ApplicationDidEnterBackgroundNotification) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        
        /**
         阶段二正在进行中,app退出。
         在程序启动时，检测本地是否有receipt文件，有的话，去二次验证。
         */
//        [self removeReceiptAll];
        
        if ([self getReceipt]!=nil && [[self getReceipt]count]>0) {

            NSMutableArray  * nsmu =  [self getReceipt];
            [self verifyReceiptFromArray:nsmu];
            


        }
    });
}


- (void)verifyReceiptFromArray:(NSMutableArray *)Receipts
{
    for (int i =0; i<Receipts.count; i++) {
       NSDictionary *d = Receipts[i];
        [self verifyReceipt:d];

    }
}


- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {

    dispatch_async(dispatch_get_main_queue(), ^{

          NSArray *product = response.products;

          if (product.count == 0) {
              
              NSLog(@"无法获取商品信息，请重试");
              [QF_Tool QF_alertView:@"无法获取商品信息，请重试" withcompletion:nil];
              [QF_HZActivityIndicatorView hide];
              [request cancel];
              self.goodsRequestFinished = YES; //失败，请求完成
          } else {
              
              if ([SKPaymentQueue canMakePayments]) {

                   //发起购买请求
                   SKPayment *payment = [SKPayment paymentWithProduct:product[0]];
                  
                   [[SKPaymentQueue defaultQueue] addPayment:payment];
              }
              
          }
      });
}


- (void)QF_PurchaseProduct:(NSString *)productID  QF_Success:(void (^)(NSString * invalidProductIdentifiers,NSDictionary *info))success Kratos_failure:(void (^)(NSString *errormsg))failure
{
    self.successBlock = success;
    self.failuteBlock = failure;
     if (self.goodsRequestFinished) {
          if ([SKPaymentQueue canMakePayments]) { //用户允许app内购
              if (productID.length) {
                 
                  self.goodsRequestFinished = NO; //正在请求
                  NSArray *product = [[NSArray alloc] initWithObjects:productID, nil];
                  NSSet *set = [NSSet setWithArray:product];
                  SKProductsRequest *productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
                 
                  productRequest.delegate = self;
                 
                  [productRequest start];
              
              } else {
                 
                  NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                         @"商品为空",@"SKPaymentTransactionState",
                                                                                                         [QF_Option share].QF_outTradeNo,@"oid",nil];
                                   
                  
    
                  [QF_Tool QF_alertView:@"商品为空" withcompletion:nil];
                  self.goodsRequestFinished = YES; //完成请求
              }
          
          } else { //没有权限
              NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                                    @"没有权限",@"SKPaymentTransactionState",
                                                                                                                    [QF_Option share].QF_outTradeNo,@"oid",nil];
                                              
              if (self.failuteBlock != nil) {
                  self.failuteBlock(@"没有权限");
              }
              [QF_Tool QF_alertView:@"请打开内购购买g权限" withcompletion:nil];
              self.goodsRequestFinished = YES; //完成请求;
          }
      
      } else {
          NSLog(@"上次请求还未完成，请稍等");
      }

    
    
    
    
    
    

}
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error API_AVAILABLE(ios(3.0), macos(10.7))
{
    self.goodsRequestFinished = YES; //失败，请求完成
}


- (void)didBecomeActive1
{
    [[QF_Tool QF_weakVC] dismissViewControllerAnimated:false completion:nil];
}

#pragma mark 杀死APP保存订单信息
- (void)WillTerminateNotification1
{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    NSDictionary *userinfo =  [QF_Tool QF_getUserInfo];
    
    NSURL *receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receiptData = [NSData dataWithContentsOfURL:receiptUrl];
    NSString * receipt =[receiptData base64EncodedStringWithOptions:0];

    [dict setObject: [QF_Option share].QF_outTradeNo forKey:Order_id];
    [dict setObject:[QF_Option share].QF_gameID forKey:@"game_id"];
   
    [dict setObject:userinfo[Access_token] forKey:Access_token];
    [dict setObject:receipt forKey:Receipt_data];
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:userinfo[@"user_id"]];
    [[NSUserDefaults standardUserDefaults]synchronize];;
    
    
    
    if ([QF_Option share].QF_outTradeNo.length>0) {
        [QF_Tool keychainSaveData:[QF_Option share].QF_outTradeNo withAccountIdentifier:@"QF_outTradeNo" andServiceIdentifier:@"outTradeNo"];
    }
    
    if ([QF_Option share].QF_outTradeNo.length>0 &&
        receipt.length>0&& [userinfo[Access_token] length]>0 &&receipt.length>0)
    {
        
        [self saveReceipt:dict];
 

        
    }

    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)failedTransaction:(SKPaymentTransaction *)transaction {
    [QF_HZActivityIndicatorView hide];
    if(transaction.error.code != SKErrorPaymentCancelled) {
        [QF_Tool QF_alertView:@"购买失败" withcompletion:nil];
    } else {
        [QF_Tool QF_alertView:@"用户取消" withcompletion:nil];
    }
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
   
    self.goodsRequestFinished = YES; //失败，请求完成
}


- (void)QF_savetransaction:(SKPaymentTransaction *)transaction
{
    
    
    
        QF_Option *op =   [QF_Option share];
        NSDictionary *userinfo =  [QF_Tool QF_getUserInfo];
        NSURL *receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
        NSData *receiptData = [NSData dataWithContentsOfURL:receiptUrl];
        NSString * receipt =[receiptData base64EncodedStringWithOptions:0];

    
    NSMutableDictionary *userInfo =  [[NSUserDefaults standardUserDefaults]objectForKey:userinfo[@"user_id"]];
    NSString *order_id = userInfo[Order_id];
    NSString *oooorder_id = order_id!=nil ? order_id :op.QF_outTradeNo;
    
    NSString *game_Id =op.QF_gameID;
    NSString *access_token =userinfo[Access_token];
    if (oooorder_id.length ==0) {
        NSMutableArray *jiow =  [self getReceipt];
        for (int i =0; i<jiow.count; i++) {
            NSDictionary *dddw = jiow[i];
            NSString *receipt_data = dddw[Receipt_data];
            NSString *access_token12 = dddw[Access_token];

            if ([receipt_data isEqualToString:receipt]||[access_token isEqualToString:access_token12]) {
                NSString *order_id = dddw[Order_id];

                oooorder_id = order_id;
                game_Id = dddw[@"game_id"];
                access_token = dddw[Access_token];

            }
        }
        
        if (oooorder_id.length==0) {
            
       
             NSString * outTradeNo =[QF_Tool keychainGetDataWithAccountIdentifier:@"QF_outTradeNo" andServiceIdentifier:@"outTradeNo"];
            oooorder_id = outTradeNo;
        }
        
    }
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [dict setObject:oooorder_id forKey:Order_id];
    [dict setObject:game_Id forKey:@"game_id"];
    [dict setObject:access_token forKey:Access_token];
    [dict setObject:receipt forKey:Receipt_data];

//          NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"params",nil];
        
        [self saveReceipt:dict];

    
}


- (void)removeReceiptAll
{
    NSMutableDictionary * deleteQueryDic = [QF_Tool keychainDicWithAccountId:@"trigger" andServiceId:@"deviceIdentifier"];
    // 删除指定条件的数据
    SecItemDelete((CFDictionaryRef)deleteQueryDic);
    deleteQueryDic = nil ;
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(nonnull NSArray<SKPaymentTransaction *> *)transactions {

    for (SKPaymentTransaction *transaction in transactions) {
        self.transaction = transaction;
        switch (transaction.transactionState) {
           
            case SKPaymentTransactionStatePurchasing://正在交易
            {
               NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                   @"SKPaymentTransactionStatePurchasing",@"SKPaymentTransactionState",
                                                                                                   transaction.transactionIdentifier,@"pid",
                                                                                                   [QF_Option share].QF_outTradeNo,@"oid",
                                                                                                   transaction.transactionIdentifier,@"tid",nil];
                             
                
            }
                break;

            case SKPaymentTransactionStatePurchased://交易完成
            {
                
                
    
                
                [self getEnvironmentAndTransactionIDWith:transaction]; //获取交易成功后的购买凭证
                
//             //存储交易凭证
                [self QF_savetransaction:transaction];
                
               NSMutableArray *receipts = [self getReceipt];
                [self verifyReceiptFromArray:receipts];
                [self completeTransaction:self.transaction];


                
            }
                break;

            case SKPaymentTransactionStateFailed://交易失败
            {
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                  @"SKPaymentTransactionStateFailed",@"SKPaymentTransactionState",
                                                                                                  transaction.transactionIdentifier,@"pid",
                                                                                                  [QF_Option share].QF_outTradeNo,@"oid",
                                                                                                  transaction.transactionIdentifier,@"tid",nil];
                [self failedTransaction:transaction];

                break;
            }
            case SKPaymentTransactionStateRestored://已经购买过该商品
            {
             
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                                 @"SKPaymentTransactionStateRestored",@"SKPaymentTransactionState",
                                                                                                                 transaction.transactionIdentifier,@"pid",
                                                                                                                 [QF_Option share].QF_outTradeNo,@"oid",
                                                                                                                 transaction.transactionIdentifier,@"tid",nil];
                [self restoreTransaction:transaction];

                break;
            }
            default:
            {
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                                                                              @"other",@"SKPaymentTransactionState",
                                                                                                                              transaction.transactionIdentifier,@"pid",
                                                                                                                              [QF_Option share].QF_outTradeNo,@"oid",
                                                                                                                              transaction.transactionIdentifier,@"tid",nil];
            }
                break;
        }
    }
}

- (NSString *)getEnvironmentAndTransactionIDWith:(SKPaymentTransaction *)transaction{
    
    NSString * str=[[NSString alloc]initWithData:transaction.transactionReceipt encoding:NSUTF8StringEncoding];
    
    
    NSString *environmentStr =[self environmentForReceipt:str];
    if ([environmentStr isEqualToString:@"environment=Sandbox"]) {
        return  @"sandbox";
    }else{
        
        return  @"itunes";
    }
}



- (void)restoreTransaction:(SKPaymentTransaction *)transaction {
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    [QF_HZActivityIndicatorView hide];
     [QF_Tool QF_alertView:@"恢复购买" withcompletion:nil];
    self.goodsRequestFinished = YES; //恢复购买，请求完成
}


#pragma mark获得订单号
- (void)QF_InAppPurcharseWithInfo:(NSDictionary *)info withUserInfo:(NSDictionary *)userinfo
                            Block:(void (^)(NSDictionary *dict,NSError *error))block
{
      dispatch_async(dispatch_get_main_queue(), ^{
     
          
          
             if (self.IsTouchss == true) {
                    NSLog(@"不能操作太快了");
                 [QF_HZActivityIndicatorView hide];

                    return;
                }
              
              
                QF_Option *op = [QF_Option share];
              [[NSNotificationCenter defaultCenter]removeObserver:self];
          if (@available(iOS 13.0, *)) {
              [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActive1) name:UISceneDidEnterBackgroundNotification object:nil];
              
               [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WillTerminateNotification1) name:UISceneDidDisconnectNotification object:nil];
          }else
          {
              [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActive1) name:UIApplicationDidEnterBackgroundNotification object:nil];
                       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WillTerminateNotification1) name:UIApplicationWillTerminateNotification object:nil];
          }
  
          
            
              NSString *currencyCode = op.QF_currencyCode;
              NSString *countryCode = op.QF_countryCode;
              
              
              if (currencyCode == nil) {
                  currencyCode = @"";
                  countryCode = @"";
              }
              

              

              NSString *HTTP = [NSString stringWithFormat:@"%@/v1/api/pay/order",GameTop];

              
        self.IsTouchss = true;
  
          
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                            userinfo,@"role",nil];
            NSDictionary *user = [QF_Tool QF_getUserInfo];
          if ([user.allKeys count] == 0) {
              [QF_HZActivityIndicatorView hide];
              self.IsTouchss = false;

              return;
          }
            NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:info];
            [mutableDic addEntriesFromDictionary:@{Access_token:user[Access_token]}];
            NSDictionary *tempdic = @{@"params":mutableDic};
            [tempDic addEntriesFromDictionary:tempdic];
              [QF_NewSDKNet QF_requestWithURLString:HTTP parameters:tempDic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
                  dispatch_async(dispatch_get_main_queue(), ^{
                  if (responseObject) {
//                      [QF_HZActivityIndicatorView hide];

                      self.IsTouchss = false;
                     NSDictionary *dataStr = [responseObject objectForKey:@"data"];
                     block(dataStr,nil);
                     return;
                  }
                      self.IsTouchss = false;

                      block(nil,nil);
                  });

              } failure:^(NSError * _Nonnull error) {
                  dispatch_async(dispatch_get_main_queue(), ^{
                      self.IsTouchss = false;
                  });
              }];
          
      });
    
    
}
-(NSString * )environmentForReceipt:(NSString * )str {
    
    str= [str stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    str=[str stringByReplacingOccurrencesOfString:@" " withString:@""];
    str=[str stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSArray * arr=[str componentsSeparatedByString:@";"];
    
    NSString * environment=arr[2];
    
    return environment;
}























@end
