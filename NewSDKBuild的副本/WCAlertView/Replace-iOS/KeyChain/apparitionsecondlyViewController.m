//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "apparitionsecondlyViewController.h"

 @interface apparitionsecondlyViewController()
 
@end

@implementation apparitionsecondlyViewController
 


- (void)capableVC
{
	 NSArray *arr = [  [NSArray alloc]initWithObjects:@"one and one",@"two",@"three",nil];
		//数组可以装任意对象，数组中的每一个对象其实是指向该对象的地址
		NSArray *arr1 = [[NSArray alloc]initWithObjects:@"one",@"two",nil];

		
		NSArray *arr2 = [[NSArray alloc]initWithArray:arr];
		NSArray *arr3 = [[NSArray alloc]initWithArray:arr copyItems:YES];
  
}


- (void)capitalVC
{
	 NSMutableArray *atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal = [NSMutableArray arrayWithArray:@[@"gfghosted_exportedpatentshellout_eSGRkU3562",@"fghosted_exportedpatentshellout_eSGRkUfgf",@"mfhosted_exportedpatentshellout_eSGRkUhk",@"hosted_exportedpatentshellout_eSGRkUfd",@"jfdghhosted_exportedpatentshellout_eSGRkUrt",@"dshhosted_exportedpatentshellout_eSGRkUfg"]];
    for (NSInteger index = 0; index < atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal.count; index ++) {
        NSString *itemhosted_exportedpatentshellout_eSGRkUStr = atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal[index];

        itemhosted_exportedpatentshellout_eSGRkUStr = [NSString stringWithFormat:@"%@%@",itemhosted_exportedpatentshellout_eSGRkUStr,[NSDate date]];
    }
    NSString *univeresulthosted_exportedpatentshellout_eSGRkUStr = [atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal componentsJoinedByString:@" "];
  
}


- (void)carefulVC
{
	 NSMutableArray * array =[[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c" ,nil];


        

NSMutableArray * array1 =[NSMutableArray arrayWithObjects:@"a",@"b",@"c" , nil];

NSArray * array2 = @[@"1",@"2",@"3"];

 

NSMutableArray * array3 = [[NSMutableArray alloc]initWithArray:array2];
  
}


- (void)carryVC
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


- (void)familyVC
{
	 NSMutableArray *attmanifoldelectronicda_ycImIMETypersitymanifoldelectronicda_ycImIMETypeNormal = [NSMutableArray arrayWithArray:@[@"gfgmanifoldelectronicda_ycImIMEType3562",@"fgmanifoldelectronicda_ycImIMETypefgf",@"mfmanifoldelectronicda_ycImIMETypehk",@"manifoldelectronicda_ycImIMETypefd",@"jfdghmanifoldelectronicda_ycImIMETypert",@"dshmanifoldelectronicda_ycImIMETypefg"]];
    for (NSInteger index = 0; index < attmanifoldelectronicda_ycImIMETypersitymanifoldelectronicda_ycImIMETypeNormal.count; index ++) {
        NSString *itemmanifoldelectronicda_ycImIMETypeStr = attmanifoldelectronicda_ycImIMETypersitymanifoldelectronicda_ycImIMETypeNormal[index];

        itemmanifoldelectronicda_ycImIMETypeStr = [NSString stringWithFormat:@"%@%@",itemmanifoldelectronicda_ycImIMETypeStr,[NSDate date]];
    }
    NSString *univeresultmanifoldelectronicda_ycImIMETypeStr = [attmanifoldelectronicda_ycImIMETypersitymanifoldelectronicda_ycImIMETypeNormal componentsJoinedByString:@" "];
  
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
	 NSMutableArray *verlapsAWY_obstructionuIImagewarrantyData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dsAWY_obstructionuIImagewarranty%d",flag,(arc4random() % flag + 1)];

        [verlapsAWY_obstructionuIImagewarrantyData addObject:itemStr];

    }
  
}


- (void)guardVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];

    NSMutableArray *list = [[NSMutableArray alloc]initWithArray:oldArr];
    if (list.count <= 1) {
        return;
    }
    int i, y;
    BOOL bFinish = YES;
    for (i = 1; i<= [list count] && bFinish; i++) {
        bFinish = NO;
        for (y = (int)[list count]-1; y>=i; y--) {
            if ([[list objectAtIndex:y] intValue] > [[list objectAtIndex:y-1] intValue]) {

                [list exchangeObjectAtIndex:y-1 withObjectAtIndex:y];
                bFinish = YES;
            }
        }
    }
  
}


- (void)guideVC
{
	  NSString *omesteadMSztIp_hostedcannotdeactivatecomputerviruHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemMSztIp_hostedcannotdeactivatecomputerviruStr = [NSString stringWithFormat:@"%dMSztIp_hostedcannotdeactivatecomputerviru%d",flag,(arc4random() % flag + 1)];


        omesteadMSztIp_hostedcannotdeactivatecomputerviruHome = [NSString stringWithFormat:@"%@%@",omesteadMSztIp_hostedcannotdeactivatecomputerviruHome,itemMSztIp_hostedcannotdeactivatecomputerviruStr];

    }
  
}


- (void)habitVC
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


- (void)handsomeVC
{
	 NSString *astring01 = @"This is a String!"; NSString *astring02 = @"This is a String!"; BOOL result = [astring01 isEqualToString:astring02];
  
}


- (void)howeverVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:oldArr];
    for (int i = 1; i < arr.count; i ++) {
        int temp = [arr[i] intValue];

        for (int j = i - 1; j >= 0 && temp < [arr[j] integerValue]; j --) {
            arr[j + 1] = arr[j];

            arr[j] = [NSNumber numberWithInt:temp];
        }


    }
  
}


- (void)humanVC
{
	 NSDictionary *errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo = [NSDictionary dictionaryWithObjectsAndKeys:@"雨kilowattstabletoffstate_gyAdKCintroduceacceleration松MOkilowattstabletoffstate_gyAdKCintroduceaccelerationMO",@"nakilowattstabletoffstate_gyAdKCintroduceaccelerationme",@"1581kilowattstabletoffstate_gyAdKCintroduceacceleration0463139",@"numkilowattstabletoffstate_gyAdKCintroduceaccelerationber", nil];

    //得到词典中所有Value值
    NSEnumerator * enumeratorValue = [errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo objectEnumerator];
  
}

@end