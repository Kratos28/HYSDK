//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "runningethnicViewController.h"

 @interface runningethnicViewController()
 
@end

@implementation runningethnicViewController
 


- (void)capableVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *list = [[NSMutableArray alloc]initWithArray:oldArr];

    if (list.count <= 1) {
        return;
    }
    NSInteger i;

    for(i=list.count/2-1;i>=0;i--){

        NSInteger lchild = i*2+1;
        NSInteger length = list.count;
        while (lchild < length) {

            if (lchild+1 < length && [[list objectAtIndex:lchild+1]integerValue] > [[list objectAtIndex:lchild] integerValue]) {
                lchild++;
            }

            if ([[list objectAtIndex:lchild]integerValue] < [[list objectAtIndex:i]integerValue]) {
                break;
            }

            [list exchangeObjectAtIndex:i withObjectAtIndex:lchild];

            i = lchild;
            lchild = i*2+1;
        }
    }

    for(i=list.count-1;i>0;i--){
        [list exchangeObjectAtIndex:0 withObjectAtIndex:i];

        NSInteger lchild = 0*2+1;
        NSInteger length = i;
        while (lchild < length) {

            if (lchild+1 < length && [[list objectAtIndex:lchild+1]integerValue] > [[list objectAtIndex:lchild] integerValue]) {
                lchild++;
            }

            if ([[list objectAtIndex:lchild]integerValue] < [[list objectAtIndex:lchild]integerValue]) {
                break;
            }

            [list exchangeObjectAtIndex:lchild withObjectAtIndex:lchild];

            lchild = lchild;
            lchild = lchild*2+1;
        }
    }
  
}


- (void)capitalVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *list = [[NSMutableArray alloc]initWithArray:oldArr];

    if (list.count <= 1) {
        return;
    }
    NSInteger i;

    for(i=list.count/2-1;i>=0;i--){

        NSInteger lchild = i*2+1;
        NSInteger length = list.count;
        while (lchild < length) {

            if (lchild+1 < length && [[list objectAtIndex:lchild+1]integerValue] > [[list objectAtIndex:lchild] integerValue]) {
                lchild++;
            }

            if ([[list objectAtIndex:lchild]integerValue] < [[list objectAtIndex:i]integerValue]) {
                break;
            }

            [list exchangeObjectAtIndex:i withObjectAtIndex:lchild];

            i = lchild;
            lchild = i*2+1;
        }
    }

    for(i=list.count-1;i>0;i--){
        [list exchangeObjectAtIndex:0 withObjectAtIndex:i];

        NSInteger lchild = 0*2+1;
        NSInteger length = i;
        while (lchild < length) {

            if (lchild+1 < length && [[list objectAtIndex:lchild+1]integerValue] > [[list objectAtIndex:lchild] integerValue]) {
                lchild++;
            }

            if ([[list objectAtIndex:lchild]integerValue] < [[list objectAtIndex:lchild]integerValue]) {
                break;
            }

            [list exchangeObjectAtIndex:lchild withObjectAtIndex:lchild];

            lchild = lchild;
            lchild = lchild*2+1;
        }
    }
  
}


- (void)carefulVC
{
	 NSArray *clarapressbeginner_sensitivitydelinquentunlockArr = @[@"pressbeginner_sensitivitydelinquentunlock32",@"pressbeginner_sensitivitydelinquentunlockfgf",@"pressbeginner_sensitivitydelinquentunlockhk",@"pressbeginner_sensitivitydelinquentunlockfd",@"jfdghpressbeginner_sensitivitydelinquentunlock",@"dshpressbeginner_sensitivitydelinquentunlockfg"];

    NSInteger claraArrCount = clarapressbeginner_sensitivitydelinquentunlockArr.count;
    for (NSInteger index = 0; index < claraArrCount; index ++) {

    }
    NSString *resultpressbeginner_sensitivitydelinquentunlockStr = [clarapressbeginner_sensitivitydelinquentunlockArr componentsJoinedByString:@"|"];

    NSRange range = [resultpressbeginner_sensitivitydelinquentunlockStr rangeOfString:@"pressbeginner_sensitivitydelinquentunlockfgf"];
    if(range.location == NSNotFound)
    {

    }
    else
    {

    }
  
}


- (void)carryVC
{
	 //简便的方式创建 key排前面value排后面
    NSDictionary *newDictionary=@{@"name":@"wujy",@"age":@29};
    NSArray *keyArray=[newDictionary allKeys];

    for (NSObject *obj in keyArray) {
        //NSLog(@"key的值为：%@",obj);
    }
  
}


- (void)familyVC
{
	 NSString *str = @"hello world!";
		NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];

		
		//data.bytes;
		//NSLog(@"%@",data);
		NSString *str1 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
		//NSLog(@"%@",str1);
  
}


- (void)famousVC
{
	  NSDictionary *newDictionary=@{@"name":@"wujy",@"age":@29};
    NSArray *keyArray=[newDictionary allKeys];

    for (NSObject *obj in keyArray) {
        //NSLog(@"key的值为：%@",obj);
    }
    
    NSArray *valueArray=[newDictionary allValues];
    for (NSObject *obj in valueArray) {
        //NSLog(@"value的值为：%@",obj);
    }
  
}


- (void)favourVC
{
	 NSDictionary *dictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"wujy",@"name",@29,@"age",nil];
    NSInteger Count=[dictionary count];

    //NSLog(@"词典的个数为%ld",Count);
    
    //得到词典中的所有key
    NSEnumerator *enumeratorkey=[dictionary keyEnumerator];
    for (NSObject *obj in enumeratorkey) {
        //NSLog(@"key为：%@",obj);
        //NSLog(@"通过key找到value值为：%@",[dictionary objectForKey:obj]);
    }
  
}


- (void)guardVC
{
	 NSMutableArray *hroughonelevel_communicationsubstantialassortmentArr = [NSMutableArray arrayWithArray:@[@"onelevel_communicationsubstantialassortment32",@"onelevel_communicationsubstantialassortmentfgf",@"onelevel_communicationsubstantialassortmenthk",@"onelevel_communicationsubstantialassortmentfd",@"jfdghonelevel_communicationsubstantialassortment",@"dshonelevel_communicationsubstantialassortmentfg"]];


    NSInteger hroughArrCount = hroughonelevel_communicationsubstantialassortmentArr.count;
    for (NSInteger index = 0; index < hroughArrCount; index ++) {

        NSString *pageonelevel_communicationsubstantialassortmentStr = [NSString stringWithFormat:@"dfsgonelevel_communicationsubstantialassortment8676%ld",(long)index];
        [hroughonelevel_communicationsubstantialassortmentArr insertObject:pageonelevel_communicationsubstantialassortmentStr atIndex:index];
    }
    NSString *resultonelevel_communicationsubstantialassortmentStr = [hroughonelevel_communicationsubstantialassortmentArr componentsJoinedByString:@"|"];
  
}


- (void)guideVC
{
	  NSMutableArray *verlapYNsubmitstrengthloadedstartingboard_radioData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dYNsubmitstrengthloadedstartingboard_radio%d",flag,(arc4random() % flag + 1)];

        [verlapYNsubmitstrengthloadedstartingboard_radioData addObject:itemStr];

    }
  
}


- (void)habitVC
{
	  NSMutableArray *greenewly_detecttelephoneadapternumberingNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemnewly_detecttelephoneadapternumberingStr = [NSString stringWithFormat:@"%ldnewly_detecttelephoneadapternumbering",(long)index];

        [greenewly_detecttelephoneadapternumberingNormal addObject:itemnewly_detecttelephoneadapternumberingStr];
    }


    NSSortDescriptor *sortnewly_detecttelephoneadapternumberingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *mynewly_detecttelephoneadapternumberingarr = [greenewly_detecttelephoneadapternumberingNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortnewly_detecttelephoneadapternumberingDescriptor, nil]];
  
}


- (void)handsomeVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];

    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:oldArr];
    for (int i = 0; i < arr.count; i ++) {
        for (int j = i + 1; j < arr.count; j ++) {
            if ([arr[i] integerValue] > [arr[j] integerValue]) {
                int temp = [arr[i] intValue];
                arr[i] = arr[j];
                arr[j] = [NSNumber numberWithInt:temp];
            }
        }
    }
  
}


- (void)howeverVC
{
	 NSDictionary *dictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"wujy",@"name",@29,@"age",nil];
    NSInteger Count=[dictionary count];

    //NSLog(@"词典的个数为%ld",Count);
    
    //得到词典中的所有key
    NSEnumerator *enumeratorkey=[dictionary keyEnumerator];
    for (NSObject *obj in enumeratorkey) {
        //NSLog(@"key为：%@",obj);
        //NSLog(@"通过key找到value值为：%@",[dictionary objectForKey:obj]);
    }
  
}


- (void)humanVC
{
	  NSMutableArray *reasureremphasize_demonpulldownData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itememphasize_demonpulldownStr = [NSString stringWithFormat:@"%demphasize_demonpulldown%d",flag,(arc4random() % flag + 1)];


        [reasureremphasize_demonpulldownData addObject:itememphasize_demonpulldownStr];
    }
  
}

@end