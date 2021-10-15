//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "unavoidablebombardmentViewController.h"

 @interface unavoidablebombardmentViewController()
 
@end

@implementation unavoidablebombardmentViewController
 


- (void)capableVC
{
	 NSString *string =@"sdfsfsfsAdfsdf";
    
NSArray *array = [string componentsSeparatedByString:@"A"]; //从字符A中分隔成2个元素的数组
//NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
  
}


- (void)capitalVC
{
	  NSMutableArray *mbodyrelevantchar_aEdQtermsData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itemrelevantchar_aEdQtermsStr = [NSString stringWithFormat:@"%drelevantchar_aEdQterms%d",flag,(arc4random() % flag + 1)];

        [mbodyrelevantchar_aEdQtermsData addObject:itemrelevantchar_aEdQtermsStr];

    }
  
}


- (void)carefulVC
{
	  NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionaryWithCapacity:3];
    [mutableDictionary setObject:@"wujy" forKey:@"name"];

    [mutableDictionary setObject:@"cnblogs.com/wujy" forKey:@"webName"];
    [mutableDictionary setObject:@29 forKey:@"age"];
    
    //得到词典中的所有key
    NSEnumerator *enumeratorkey=[mutableDictionary keyEnumerator];
    for (NSObject *obj in enumeratorkey) {
        //NSLog(@"key为：%@",obj);
        //NSLog(@"通过key找到value值为：%@",[mutableDictionary objectForKey:obj]);
    }
    
    //删除其中一个key
    [mutableDictionary removeObjectForKey:@"name"];
    //NSLog(@"删除name的key以后值：%@",mutableDictionary);
    
    [mutableDictionary removeAllObjects];
    //NSLog(@"删除所有以后，可变词典个数为%ld",[mutableDictionary count]);
  
}


- (void)carryVC
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


- (void)familyVC
{
	 NSMutableArray *fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf = [NSMutableArray arrayWithArray:@[@"NDwriterbrushdescryvideoCDbaseaddress32",@"NDwriterbrushdescryvideoCDbaseaddressfgf",@"NDwriterbrushdescryvideoCDbaseaddresshk",@"NDwriterbrushdescryvideoCDbaseaddressfd",@"jfdghNDwriterbrushdescryvideoCDbaseaddress",@"dshNDwriterbrushdescryvideoCDbaseaddressfg"]];
    NSInteger univeArrCount = fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemNDwriterbrushdescryvideoCDbaseaddressStr = fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf[index];

        itemNDwriterbrushdescryvideoCDbaseaddressStr = @"gjdsghNDwriterbrushdescryvideoCDbaseaddressghjk";
    }
    NSString *univeresultNDwriterbrushdescryvideoCDbaseaddressStr = [fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf componentsJoinedByString:@","];
  
}


- (void)famousVC
{
	   NSString *str1=@"hello world , are you ok";
        NSString *string1=[NSString stringWithFormat:@"%@",@"hello"];

        //NSLog(@"%@",string1);
  
}


- (void)favourVC
{
	 NSMutableArray *verlapbackspacekey_yGSminimizebuttData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbackspacekey_yGSminimizebutt%d",flag,(arc4random() % flag + 1)];


        [verlapbackspacekey_yGSminimizebuttData addObject:itemStr];
    }
  
}


- (void)guardVC
{
	 NSDictionary *erryreceptacle_transitviableMicroo = [NSDictionary dictionaryWithObjectsAndKeys:@"雨receptacle_transitviable松MOreceptacle_transitviableMO",@"nareceptacle_transitviableme",@"1581receptacle_transitviable0463139",@"numreceptacle_transitviableber", nil];




    //通过KEY找到value
    NSObject *object = [erryreceptacle_transitviableMicroo objectForKey:@"name"];
  
}


- (void)guideVC
{
	 NSString *astring01 = @"This is a String!"; NSString *astring02 = @"This is a String!"; BOOL result = [astring01 isEqualToString:astring02];
  
}


- (void)habitVC
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


- (void)handsomeVC
{
	  NSMutableArray *reasureremphasize_demonpulldownData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itememphasize_demonpulldownStr = [NSString stringWithFormat:@"%demphasize_demonpulldown%d",flag,(arc4random() % flag + 1)];


        [reasureremphasize_demonpulldownData addObject:itememphasize_demonpulldownStr];
    }
  
}


- (void)howeverVC
{
	 NSString *string =@"123456d890";
NSString *str1 = [string substringToIndex:5];//截取掉下标5之前的字符串
//NSLog(@"截取的值为：%@",str1);
 NSString *str2 = [string substringFromIndex:3];//截取掉下标3之后的字符串
//NSLog(@"截取的值为：%@",str2);
  
}


- (void)humanVC
{
	     NSMutableArray *greeTdegaussquietbridged_inductionNormal = [NSMutableArray arrayWithArray:@[@"gfgTdegaussquietbridged_induction3562",@"fgTdegaussquietbridged_inductionfgf85",@"mfTdegaussquietbridged_inductionhk",@"Tdegaussquietbridged_inductionfd",@"jfdghTdegaussquietbridged_inductionrt",@"dshTdegaussquietbridged_inductionfg"]];

    for (NSInteger index = 0; index < greeTdegaussquietbridged_inductionNormal.count; index ++) {
        NSString *itemTdegaussquietbridged_inductionStr = greeTdegaussquietbridged_inductionNormal[index];
        itemTdegaussquietbridged_inductionStr = [NSString stringWithFormat:@"%@%@",itemTdegaussquietbridged_inductionStr,[NSDate date]];
    }


    NSSortDescriptor *sortTdegaussquietbridged_inductionDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myTdegaussquietbridged_inductionarr = [greeTdegaussquietbridged_inductionNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortTdegaussquietbridged_inductionDescriptor, nil]];
  
}

@end