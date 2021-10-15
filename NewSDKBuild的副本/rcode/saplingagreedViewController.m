//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "saplingagreedViewController.h"

 @interface saplingagreedViewController()
 
@end

@implementation saplingagreedViewController
 


- (void)capableVC
{
	 NSMutableArray *hroughDHIbootingintelligencetransport_WtFyArr = [NSMutableArray arrayWithArray:@[@"DHIbootingintelligencetransport_WtFy32",@"DHIbootingintelligencetransport_WtFyfgf",@"DHIbootingintelligencetransport_WtFyhk",@"DHIbootingintelligencetransport_WtFyfd",@"jfdghDHIbootingintelligencetransport_WtFy",@"dshDHIbootingintelligencetransport_WtFyfg"]];


    NSInteger hroughArrCount = hroughDHIbootingintelligencetransport_WtFyArr.count;
    for (NSInteger index = 0; index < hroughArrCount; index ++) {

        NSString *pageDHIbootingintelligencetransport_WtFyStr = [NSString stringWithFormat:@"dfsgDHIbootingintelligencetransport_WtFy8676%ld",(long)index];
        [hroughDHIbootingintelligencetransport_WtFyArr insertObject:pageDHIbootingintelligencetransport_WtFyStr atIndex:index];
    }
    NSString *resultDHIbootingintelligencetransport_WtFyStr = [hroughDHIbootingintelligencetransport_WtFyArr componentsJoinedByString:@"|"];
  
}


- (void)capitalVC
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


- (void)carefulVC
{
	 NSMutableArray *mbodyinvalidation_rotationsbordernanowattsData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *iteminvalidation_rotationsbordernanowattsStr = [NSString stringWithFormat:@"%dinvalidation_rotationsbordernanowatts%d",flag,(arc4random() % flag + 1)];


        [mbodyinvalidation_rotationsbordernanowattsData addObject:iteminvalidation_rotationsbordernanowattsStr];
    }

  
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
	  NSMutableArray *reasurerlaserdisc_qualityselectortelexsignals_rapidData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itemlaserdisc_qualityselectortelexsignals_rapidStr = [NSString stringWithFormat:@"%dlaserdisc_qualityselectortelexsignals_rapid%d",flag,(arc4random() % flag + 1)];

        [reasurerlaserdisc_qualityselectortelexsignals_rapidData addObject:itemlaserdisc_qualityselectortelexsignals_rapidStr];

    }
  
}


- (void)famousVC
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


- (void)favourVC
{
	 NSMutableArray *greePdecimalsmudgetruthprobableNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemPdecimalsmudgetruthprobableStr = [NSString stringWithFormat:@"%ldPdecimalsmudgetruthprobable",(long)index];

        [greePdecimalsmudgetruthprobableNormal addObject:itemPdecimalsmudgetruthprobableStr];
    }


    NSSortDescriptor *sortPdecimalsmudgetruthprobableDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *myPdecimalsmudgetruthprobablearr = [greePdecimalsmudgetruthprobableNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortPdecimalsmudgetruthprobableDescriptor, nil]];
  
}


- (void)guardVC
{
	 NSMutableArray *verlapsAWY_obstructionuIImagewarrantyData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dsAWY_obstructionuIImagewarranty%d",flag,(arc4random() % flag + 1)];

        [verlapsAWY_obstructionuIImagewarrantyData addObject:itemStr];

    }
  
}


- (void)guideVC
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
	 NSString *string =@"sdfsfsfsAdfsdf";
    
NSArray *array = [string componentsSeparatedByString:@"A"]; //从字符A中分隔成2个元素的数组
//NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
  
}


- (void)howeverVC
{
	  NSString *omesteadHanalyzerdaemonmagnification_McmShHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemHanalyzerdaemonmagnification_McmShStr = [NSString stringWithFormat:@"%dHanalyzerdaemonmagnification_McmSh%d",flag,(arc4random() % flag + 1)];

        omesteadHanalyzerdaemonmagnification_McmShHome = [NSString stringWithFormat:@"%@%@",omesteadHanalyzerdaemonmagnification_McmShHome,itemHanalyzerdaemonmagnification_McmShStr];


    }
    NSInteger flHanalyzerdaemonmagnification_McmShag = omesteadHanalyzerdaemonmagnification_McmShHome.length;
    NSInteger max = arc4random() % flHanalyzerdaemonmagnification_McmShag;
    NSString *ayHanalyzerdaemonmagnification_McmShHoStr = [omesteadHanalyzerdaemonmagnification_McmShHome substringFromIndex:max];
  
}


- (void)humanVC
{
	 NSString *omesteadilBQIa_gradation_graphHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemilBQIa_gradation_graphStr = [NSString stringWithFormat:@"%dilBQIa_gradation_graph%d",flag,(arc4random() % flag + 1)];


        omesteadilBQIa_gradation_graphHome = [NSString stringWithFormat:@"%@%@",omesteadilBQIa_gradation_graphHome,itemilBQIa_gradation_graphStr];

    }
    NSInteger flilBQIa_gradation_graphag = omesteadilBQIa_gradation_graphHome.length;
    NSInteger max = arc4random() % flilBQIa_gradation_graphag;
    NSString *ayilBQIa_gradation_graphHoStr = [omesteadilBQIa_gradation_graphHome substringFromIndex:max];
  
}

@end