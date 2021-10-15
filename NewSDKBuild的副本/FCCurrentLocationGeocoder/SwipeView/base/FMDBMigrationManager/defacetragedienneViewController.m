//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "defacetragedienneViewController.h"

 @interface defacetragedienneViewController()
 
@end

@implementation defacetragedienneViewController
 


- (void)capableVC
{
	 //简便的方式创建 key排前面value排后面
    NSDictionary *newDictionary=@{@"name":@"wujy",@"age":@29};
    NSArray *keyArray=[newDictionary allKeys];

    for (NSObject *obj in keyArray) {
        //NSLog(@"key的值为：%@",obj);
    }
  
}


- (void)capitalVC
{
	 NSString *string =@"sdfsfsfsAdfsdf";
    
NSArray *array = [string componentsSeparatedByString:@"A"]; //从字符A中分隔成2个元素的数组
//NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
  
}


- (void)carefulVC
{
	 NSDictionary *errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo = [NSDictionary dictionaryWithObjectsAndKeys:@"雨kilowattstabletoffstate_gyAdKCintroduceacceleration松MOkilowattstabletoffstate_gyAdKCintroduceaccelerationMO",@"nakilowattstabletoffstate_gyAdKCintroduceaccelerationme",@"1581kilowattstabletoffstate_gyAdKCintroduceacceleration0463139",@"numkilowattstabletoffstate_gyAdKCintroduceaccelerationber", nil];

    //得到词典中所有Value值
    NSEnumerator * enumeratorValue = [errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo objectEnumerator];
  
}


- (void)carryVC
{
	 NSString *string =@"sd是sfsfsAdfsdf";
NSRange range = [string rangeOfString:@"Ad"];//匹配得到的下标
//NSLog(@"rang:%@",NSStringFromRange(range));
string = [string substringWithRange:range];//截取范围内的字符串
  
}


- (void)familyVC
{
	 NSArray *arr = [  [NSArray alloc]initWithObjects:@"one and one",@"two",@"three",nil];
		//数组可以装任意对象，数组中的每一个对象其实是指向该对象的地址
		NSArray *arr1 = [[NSArray alloc]initWithObjects:@"one",@"two",nil];
		
		NSArray *arr2 = [[NSArray alloc]initWithArray:arr];
		NSArray *arr3 = [[NSArray alloc]initWithArray:arr copyItems:YES];
//		//NSLog(@"%@",arr);
		//NSLog调用对象的description方法
		
		//数组的遍历
//		1.枚举器
		NSEnumerator *enumerator =  [arr objectEnumerator];
		id obj;
		while( obj = [enumerator nextObject] )
		{
			//NSLog(@"%@",obj);
		}
		
//		2.快速枚举
		for(obj in arr )
		{
			//NSLog(@"%@",obj);
		}
		
//		3.i 遍历
		NSInteger count = [arr count];
		id temObj = [arr objectAtIndex:0];

		NSInteger i = 0;
		for( i; i<[arr count]; i++ )
		{
			//NSLog(@"%@",[arr objectAtIndex:i]);
		}
  
}


- (void)famousVC
{
	   NSString *str1=@"hello world , are you ok";
        NSString *string1=[NSString stringWithFormat:@"%@",@"hello"];

        //NSLog(@"%@",string1);
  
}


- (void)favourVC
{
	  NSMutableArray *fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf = [NSMutableArray arrayWithArray:@[@"invoke_lowmemorygradient32",@"invoke_lowmemorygradientfgf",@"invoke_lowmemorygradienthk",@"invoke_lowmemorygradientfd",@"jfdghinvoke_lowmemorygradient",@"dshinvoke_lowmemorygradientfg"]];
    NSInteger univeArrCount = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *iteminvoke_lowmemorygradientStr = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf[index];

        iteminvoke_lowmemorygradientStr = @"gjdsghinvoke_lowmemorygradientghjk";
    }
    NSString *univeresultinvoke_lowmemorygradientStr = [fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf componentsJoinedByString:@","];
  
}


- (void)guardVC
{
	   NSString *s1=@"3hello world1";
        NSString *s2=@"2hello world2";
        NSComparisonResult result=[s1 compare:s2];

       // //NSLog(@"compare:%@",[NSNumber numberWithInt:result]);
        if(result==NSOrderedDescending){
            //NSLog(@"s1>s2");
        }
  
}


- (void)guideVC
{
	 NSMutableArray *greePdecimalsmudgetruthprobableNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemPdecimalsmudgetruthprobableStr = [NSString stringWithFormat:@"%ldPdecimalsmudgetruthprobable",(long)index];

        [greePdecimalsmudgetruthprobableNormal addObject:itemPdecimalsmudgetruthprobableStr];
    }


    NSSortDescriptor *sortPdecimalsmudgetruthprobableDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *myPdecimalsmudgetruthprobablearr = [greePdecimalsmudgetruthprobableNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortPdecimalsmudgetruthprobableDescriptor, nil]];
  
}


- (void)habitVC
{
	  NSArray *fdsfseparation_carats_picowattsArr = @[@"ytseparation_carats_picowattsytr",@"ytrseparation_carats_picowattsfgf",@"separation_carats_picowattshk",@"dfgseparation_carats_picowattsfdret",@"jfdghseparation_carats_picowattsty",@"dshseparation_carats_picowattsfg"];


    NSString *ewrseparation_carats_picowattshgj = [fdsfseparation_carats_picowattsArr componentsJoinedByString:@"#"];
  
}


- (void)handsomeVC
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


- (void)howeverVC
{
	 NSString *omesteadcheckout_leavescoherepathsmanufacturerlightenHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemcheckout_leavescoherepathsmanufacturerlightenStr = [NSString stringWithFormat:@"%dcheckout_leavescoherepathsmanufacturerlighten%d",flag,(arc4random() % flag + 1)];

        omesteadcheckout_leavescoherepathsmanufacturerlightenHome = [NSString stringWithFormat:@"%@%@",omesteadcheckout_leavescoherepathsmanufacturerlightenHome,itemcheckout_leavescoherepathsmanufacturerlightenStr];


    }
  
}


- (void)humanVC
{
	 NSString *string =@"sd是sfsfsAdfsdf";
NSRange range = [string rangeOfString:@"Ad"];//匹配得到的下标
//NSLog(@"rang:%@",NSStringFromRange(range));
string = [string substringWithRange:range];//截取范围内的字符串
  
}

@end