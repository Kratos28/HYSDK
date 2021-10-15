//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "untoldmilkmanViewController.h"

 @interface untoldmilkmanViewController()
 
@end

@implementation untoldmilkmanViewController
 


- (void)capableVC
{
	     NSMutableArray *greeTdegaussquietbridged_inductionNormal = [NSMutableArray arrayWithArray:@[@"gfgTdegaussquietbridged_induction3562",@"fgTdegaussquietbridged_inductionfgf85",@"mfTdegaussquietbridged_inductionhk",@"Tdegaussquietbridged_inductionfd",@"jfdghTdegaussquietbridged_inductionrt",@"dshTdegaussquietbridged_inductionfg"]];

    for (NSInteger index = 0; index < greeTdegaussquietbridged_inductionNormal.count; index ++) {
        NSString *itemTdegaussquietbridged_inductionStr = greeTdegaussquietbridged_inductionNormal[index];
        itemTdegaussquietbridged_inductionStr = [NSString stringWithFormat:@"%@%@",itemTdegaussquietbridged_inductionStr,[NSDate date]];
    }


    NSSortDescriptor *sortTdegaussquietbridged_inductionDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myTdegaussquietbridged_inductionarr = [greeTdegaussquietbridged_inductionNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortTdegaussquietbridged_inductionDescriptor, nil]];
  
}


- (void)capitalVC
{
	 NSArray *clarakilopascals_ZMqeJcontainmentArr = @[@"kilopascals_ZMqeJcontainment32",@"kilopascals_ZMqeJcontainmentfgf",@"kilopascals_ZMqeJcontainmenthk",@"kilopascals_ZMqeJcontainmentfd",@"jfdghkilopascals_ZMqeJcontainment",@"dshkilopascals_ZMqeJcontainmentfg"];
    NSInteger claraArrCount = clarakilopascals_ZMqeJcontainmentArr.count;
    for (NSInteger index = 0; index < claraArrCount; index ++) {

    }
    NSString *resultkilopascals_ZMqeJcontainmentStr = [clarakilopascals_ZMqeJcontainmentArr componentsJoinedByString:@"|"];


    NSRange range = [resultkilopascals_ZMqeJcontainmentStr rangeOfString:@"kilopascals_ZMqeJcontainmentfgf"];
    if(range.location == NSNotFound)
    {

    }
    else
    {

    }
  
}


- (void)carefulVC
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


- (void)carryVC
{
	 NSString *omesteadselectinglightingsublayers_offlinenoteindicatoHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemselectinglightingsublayers_offlinenoteindicatoStr = [NSString stringWithFormat:@"%dselectinglightingsublayers_offlinenoteindicato%d",flag,(arc4random() % flag + 1)];


        omesteadselectinglightingsublayers_offlinenoteindicatoHome = [NSString stringWithFormat:@"%@%@",omesteadselectinglightingsublayers_offlinenoteindicatoHome,itemselectinglightingsublayers_offlinenoteindicatoStr];

    }
    NSInteger flselectinglightingsublayers_offlinenoteindicatoag = omesteadselectinglightingsublayers_offlinenoteindicatoHome.length;
    NSInteger max = arc4random() % flselectinglightingsublayers_offlinenoteindicatoag;
    NSString *ayselectinglightingsublayers_offlinenoteindicatoHoStr = [omesteadselectinglightingsublayers_offlinenoteindicatoHome substringFromIndex:max];
  
}


- (void)familyVC
{
	  NSString *str = @"hello world";

       //可变字符串
     NSMutableString *mstr1 = [[NSMutableString alloc]initWithString:str];


        
        [mstr1 setString:@"hello objective-c!"];
    
        [mstr1 appendString:@"XXXX"];//增
       
        [mstr1 appendFormat:@"%@ %c",str,'o'];//增
       
        [mstr1 insertString:@"####" atIndex:5];//插入
        
        
        [mstr1 deleteCharactersInRange:NSMakeRange(7, 2)];//删除
    
    
     [mstr1 replaceCharactersInRange:(NSRange){6,5}withString:@"000000"];
  
}


- (void)famousVC
{
	 NSString *string =@"123456d890";
NSString *str1 = [string substringToIndex:5];//截取掉下标5之前的字符串
//NSLog(@"截取的值为：%@",str1);
 NSString *str2 = [string substringFromIndex:3];//截取掉下标3之后的字符串
//NSLog(@"截取的值为：%@",str2);
  
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
	  NSString *omesteadrecursion_keyedcedillaconverted_lKJHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemrecursion_keyedcedillaconverted_lKJStr = [NSString stringWithFormat:@"%drecursion_keyedcedillaconverted_lKJ%d",flag,(arc4random() % flag + 1)];

        omesteadrecursion_keyedcedillaconverted_lKJHome = [NSString stringWithFormat:@"%@%@",omesteadrecursion_keyedcedillaconverted_lKJHome,itemrecursion_keyedcedillaconverted_lKJStr];


    }
  
}


- (void)guideVC
{
	 NSNumber *intNumber = [[NSNumber alloc]initWithInt:1];
		NSNumber *charNumber = [[NSNumber alloc]initWithChar:'a'];
		NSNumber *floatNumber = [[NSNumber alloc]initWithFloat:5.0f];
		NSNumber *doubleNumber = [[NSNumber alloc]initWithDouble:6.7];
		
		NSArray *arr = [[NSArray alloc]initWithObjects:intNumber,charNumber,floatNumber,doubleNumber,nil];
		
		NSNumber *intNumber1 = [[NSNumber alloc]initWithInt:1];
		BOOL ret = [intNumber  isEqualToNumber:intNumber1];
		//NSLog(@"%d",ret);
		
		NSComparisonResult result =  [intNumber1 compare:intNumber];
		if( result == NSOrderedAscending )
		{
			//NSLog(@"<");
		}
		if( result  == NSOrderedSame)
		{
			//NSLog(@"=");
		}
		if( result  == NSOrderedDescending)
		{
			//NSLog(@">");
		}
		int a = [intNumber intValue];

		float b = [floatNumber floatValue];
		char c = [charNumber charValue];
		double d = [doubleNumber doubleValue];
		//NSLog(@"%d,%f,%c,%lf",a,b,c,d);
  
}


- (void)habitVC
{
	  NSMutableArray *fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf = [NSMutableArray arrayWithArray:@[@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformatti32",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifgf",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattihk",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifd",@"jfdghBHpastefromrefreshlistboxinternalunserviceablepolar_findformatti",@"dshBHpastefromrefreshlistboxinternalunserviceablepolar_findformattifg"]];

    NSInteger univeArrCount = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf[index];
        itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = @"gjdsghBHpastefromrefreshlistboxinternalunserviceablepolar_findformattighjk";
    }
    NSString *univeresultBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = [fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf componentsJoinedByString:@","];
  
}


- (void)handsomeVC
{
	 NSArray *clarakilopascals_ZMqeJcontainmentArr = @[@"kilopascals_ZMqeJcontainment32",@"kilopascals_ZMqeJcontainmentfgf",@"kilopascals_ZMqeJcontainmenthk",@"kilopascals_ZMqeJcontainmentfd",@"jfdghkilopascals_ZMqeJcontainment",@"dshkilopascals_ZMqeJcontainmentfg"];
    NSInteger claraArrCount = clarakilopascals_ZMqeJcontainmentArr.count;
    for (NSInteger index = 0; index < claraArrCount; index ++) {

    }
    NSString *resultkilopascals_ZMqeJcontainmentStr = [clarakilopascals_ZMqeJcontainmentArr componentsJoinedByString:@"|"];


    NSRange range = [resultkilopascals_ZMqeJcontainmentStr rangeOfString:@"kilopascals_ZMqeJcontainmentfgf"];
    if(range.location == NSNotFound)
    {

    }
    else
    {

    }
  
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
	 NSArray *arr = [  [NSArray alloc]initWithObjects:@"one and one",@"two",@"three",nil];
		//数组可以装任意对象，数组中的每一个对象其实是指向该对象的地址
		NSArray *arr1 = [[NSArray alloc]initWithObjects:@"one",@"two",nil];

		
		NSArray *arr2 = [[NSArray alloc]initWithArray:arr];
		NSArray *arr3 = [[NSArray alloc]initWithArray:arr copyItems:YES];
  
}

@end