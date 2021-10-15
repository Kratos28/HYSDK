//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "heresyestablishViewController.h"

 @interface heresyestablishViewController()
 
@end

@implementation heresyestablishViewController
 


- (void)capableVC
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


- (void)capitalVC
{
	  NSMutableArray *fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf = [NSMutableArray arrayWithArray:@[@"invoke_lowmemorygradient32",@"invoke_lowmemorygradientfgf",@"invoke_lowmemorygradienthk",@"invoke_lowmemorygradientfd",@"jfdghinvoke_lowmemorygradient",@"dshinvoke_lowmemorygradientfg"]];
    NSInteger univeArrCount = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *iteminvoke_lowmemorygradientStr = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf[index];

        iteminvoke_lowmemorygradientStr = @"gjdsghinvoke_lowmemorygradientghjk";
    }
    NSString *univeresultinvoke_lowmemorygradientStr = [fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf componentsJoinedByString:@","];
  
}


- (void)carefulVC
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


- (void)carryVC
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


- (void)familyVC
{
	  NSMutableArray *reasureremphasize_demonpulldownData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itememphasize_demonpulldownStr = [NSString stringWithFormat:@"%demphasize_demonpulldown%d",flag,(arc4random() % flag + 1)];


        [reasureremphasize_demonpulldownData addObject:itememphasize_demonpulldownStr];
    }
  
}


- (void)famousVC
{
	 NSString*string =@"sdfsfsfsAdfsdf";
NSArray *array = [string componentsSeparatedByString:@"A"]; //从字符A中分隔成2个元素的数组
//NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
  
}


- (void)favourVC
{
	 NSMutableString *mutableString = [[NSMutableString alloc]initWithCapacity:10];
    [mutableString setString:@"NSMutableString"];
    //1.追加字符串
    [mutableString appendString:@" append String"];
    //2.替换字符串
    NSRange range = [mutableString rangeOfString:@"append"];

    [mutableString replaceCharactersInRange:range withString:@"replace"];
    //3.插入字符串
    [mutableString insertString:@" insert" atIndex:mutableString.length];
    //4.删除字符串
    NSRange delStr = [mutableString rangeOfString:@"insert"];
    [mutableString deleteCharactersInRange:delStr];
    
[mutableString insertString:@" delete String" atIndex:mutableString.length];
  
}


- (void)guardVC
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


- (void)guideVC
{
	 NSArray *pinimplication_leastnotificationcautionStr = @[@"68dsimplication_leastnotificationcautionfsdfd",@"fdhjimplication_leastnotificationcautionvfjd"];
    NSString *flagimplication_leastnotificationcautionstr = [pinimplication_leastnotificationcautionStr componentsJoinedByString:@"implication_leastnotificationcaution"];


    flagimplication_leastnotificationcautionstr = [flagimplication_leastnotificationcautionstr stringByReplacingOccurrencesOfString:@"implication_leastnotificationcaution" withString:@""];
  
}


- (void)habitVC
{
	 NSDictionary *errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo = [NSDictionary dictionaryWithObjectsAndKeys:@"雨kilowattstabletoffstate_gyAdKCintroduceacceleration松MOkilowattstabletoffstate_gyAdKCintroduceaccelerationMO",@"nakilowattstabletoffstate_gyAdKCintroduceaccelerationme",@"1581kilowattstabletoffstate_gyAdKCintroduceacceleration0463139",@"numkilowattstabletoffstate_gyAdKCintroduceaccelerationber", nil];

    //得到词典中所有Value值
    NSEnumerator * enumeratorValue = [errykilowattstabletoffstate_gyAdKCintroduceaccelerationMicroo objectEnumerator];
  
}


- (void)handsomeVC
{
	 NSMutableArray *greeartist_swimmingretractingNormal = [NSMutableArray arrayWithArray:@[@"gfgartist_swimmingretracting3562",@"fgartist_swimmingretractingfgf85",@"mfartist_swimmingretractinghk",@"artist_swimmingretractingfd",@"jfdghartist_swimmingretractingrt",@"dshartist_swimmingretractingfg"]];
    for (NSInteger index = 0; index < greeartist_swimmingretractingNormal.count; index ++) {
        NSString *itemartist_swimmingretractingStr = greeartist_swimmingretractingNormal[index];

        itemartist_swimmingretractingStr = [NSString stringWithFormat:@"%@%@",itemartist_swimmingretractingStr,[NSDate date]];
    }


    NSSortDescriptor *sortartist_swimmingretractingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myartist_swimmingretractingarr = [greeartist_swimmingretractingNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortartist_swimmingretractingDescriptor, nil]];
  
}


- (void)howeverVC
{
	 NSMutableArray *verlapbVT_swapfiledisplacementomission_vOBZfSData = [NSMutableArray array];

    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbVT_swapfiledisplacementomission_vOBZfS%d",flag,(arc4random() % flag + 1)];

        [verlapbVT_swapfiledisplacementomission_vOBZfSData addObject:itemStr];
    }
  
}


- (void)humanVC
{
	  NSString *omesteadeTAWith_insertexplicitpitchtimebaserevolutionsHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemeTAWith_insertexplicitpitchtimebaserevolutionsStr = [NSString stringWithFormat:@"%deTAWith_insertexplicitpitchtimebaserevolutions%d",flag,(arc4random() % flag + 1)];


        omesteadeTAWith_insertexplicitpitchtimebaserevolutionsHome = [NSString stringWithFormat:@"%@%@",omesteadeTAWith_insertexplicitpitchtimebaserevolutionsHome,itemeTAWith_insertexplicitpitchtimebaserevolutionsStr];

    }
    NSInteger fleTAWith_insertexplicitpitchtimebaserevolutionsag = omesteadeTAWith_insertexplicitpitchtimebaserevolutionsHome.length;
    NSInteger max = arc4random() % fleTAWith_insertexplicitpitchtimebaserevolutionsag;
    NSString *ayeTAWith_insertexplicitpitchtimebaserevolutionsHoStr = [omesteadeTAWith_insertexplicitpitchtimebaserevolutionsHome substringToIndex:max];
  
}

@end