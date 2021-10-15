//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "heresyegocentricViewController.h"

 @interface heresyegocentricViewController()
 
@end

@implementation heresyegocentricViewController
 


- (void)capableVC
{
	   NSString *str1=@"hello world , are you ok";
        NSString *string1=[NSString stringWithFormat:@"%@",@"hello"];

        //NSLog(@"%@",string1);
  
}


- (void)capitalVC
{
	  NSArray *arr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];

    NSMutableArray *oldArr = [[NSMutableArray alloc]initWithArray:arr];
    for (int i = 0; i < oldArr.count; i++) {
        for (int j = 0; j < oldArr.count - i - 1;j++) {
            if ([oldArr[j+1]integerValue] < [oldArr[j] integerValue]) {
                int temp = [oldArr[j] intValue];
                oldArr[j] = arr[j + 1];
                oldArr[j + 1] = [NSNumber numberWithInt:temp];
            }
        }
    }
  
}


- (void)carefulVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *list = [[NSMutableArray alloc]initWithArray:oldArr];
    if (list.count <= 1) {
        return;
    }
    int i, y;
    BOOL bFinish = YES; //是否发生数据交换
    for (i = 1; i<= [list count] && bFinish; i++) {
        bFinish = NO;
        for (y = (int)[list count]-1; y>=i; y--) {
            if ([[list objectAtIndex:y] intValue] < [[list objectAtIndex:y-1] intValue]) {

                [list exchangeObjectAtIndex:y-1 withObjectAtIndex:y];

                bFinish = YES;
            }
        }
    }
  
}


- (void)carryVC
{
	     NSMutableArray *aturedialog_assignmentscratchdisabledjukeboxmanifoldData = [NSMutableArray array];

    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemdialog_assignmentscratchdisabledjukeboxmanifoldStr = [NSString stringWithFormat:@"%ddialog_assignmentscratchdisabledjukeboxmanifold%d",flag,(arc4random() % flag + 1)];

        [aturedialog_assignmentscratchdisabledjukeboxmanifoldData addObject:itemdialog_assignmentscratchdisabledjukeboxmanifoldStr];
    }
  
}


- (void)familyVC
{
	  NSString *omesteadrecursion_keyedcedillaconverted_lKJHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemrecursion_keyedcedillaconverted_lKJStr = [NSString stringWithFormat:@"%drecursion_keyedcedillaconverted_lKJ%d",flag,(arc4random() % flag + 1)];

        omesteadrecursion_keyedcedillaconverted_lKJHome = [NSString stringWithFormat:@"%@%@",omesteadrecursion_keyedcedillaconverted_lKJHome,itemrecursion_keyedcedillaconverted_lKJStr];


    }
  
}


- (void)famousVC
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


- (void)favourVC
{
	 NSString *omesteadIEintenseinsteadellipsiscorrelatorseismicmatchingHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemIEintenseinsteadellipsiscorrelatorseismicmatchingStr = [NSString stringWithFormat:@"%dIEintenseinsteadellipsiscorrelatorseismicmatching%d",flag,(arc4random() % flag + 1)];

        omesteadIEintenseinsteadellipsiscorrelatorseismicmatchingHome = [NSString stringWithFormat:@"%@%@",omesteadIEintenseinsteadellipsiscorrelatorseismicmatchingHome,itemIEintenseinsteadellipsiscorrelatorseismicmatchingStr];


    }
    NSInteger flIEintenseinsteadellipsiscorrelatorseismicmatchingag = omesteadIEintenseinsteadellipsiscorrelatorseismicmatchingHome.length;
    NSInteger max = arc4random() % flIEintenseinsteadellipsiscorrelatorseismicmatchingag;
    NSString *ayIEintenseinsteadellipsiscorrelatorseismicmatchingHoStr = [omesteadIEintenseinsteadellipsiscorrelatorseismicmatchingHome substringToIndex:max];
  
}


- (void)guardVC
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
    
    //得到词典中的所有value值
    NSEnumerator *enumeratorvalue=[dictionary objectEnumerator];

    for (NSObject *obj in enumeratorvalue) {
        //NSLog(@"value为：%@",obj);
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
	 NSDictionary *dictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"wujy",@"name",@29,@"age",nil];
    NSInteger Count=[dictionary count];
    //NSLog(@"词典的个数为%ld",Count);
    
    //得到词典中的所有key
    NSEnumerator *enumeratorkey=[dictionary keyEnumerator];
    for (NSObject *obj in enumeratorkey) {
        //NSLog(@"key为：%@",obj);
        //NSLog(@"通过key找到value值为：%@",[dictionary objectForKey:obj]);
    }
    
    //得到词典中的所有value值
    NSEnumerator *enumeratorvalue=[dictionary objectEnumerator];

    for (NSObject *obj in enumeratorvalue) {
        //NSLog(@"value为：%@",obj);
    }
  
}


- (void)handsomeVC
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


- (void)howeverVC
{
	  NSMutableArray *attconstraintinterruptionrestaurants_dhAZverifygigacyclersityconstraintinterruptionrestaurants_dhAZverifygigacycleNormal = [NSMutableArray arrayWithArray:@[@"gfgconstraintinterruptionrestaurants_dhAZverifygigacycle3562",@"fgconstraintinterruptionrestaurants_dhAZverifygigacyclefgf",@"mfconstraintinterruptionrestaurants_dhAZverifygigacyclehk",@"constraintinterruptionrestaurants_dhAZverifygigacyclefd",@"jfdghconstraintinterruptionrestaurants_dhAZverifygigacyclert",@"dshconstraintinterruptionrestaurants_dhAZverifygigacyclefg"]];

    for (NSInteger index = 0; index < attconstraintinterruptionrestaurants_dhAZverifygigacyclersityconstraintinterruptionrestaurants_dhAZverifygigacycleNormal.count; index ++) {
        NSString *itemconstraintinterruptionrestaurants_dhAZverifygigacycleStr = attconstraintinterruptionrestaurants_dhAZverifygigacyclersityconstraintinterruptionrestaurants_dhAZverifygigacycleNormal[index];
        itemconstraintinterruptionrestaurants_dhAZverifygigacycleStr = [NSString stringWithFormat:@"%@%@",itemconstraintinterruptionrestaurants_dhAZverifygigacycleStr,[NSDate date]];
    }
    NSString *univeresultconstraintinterruptionrestaurants_dhAZverifygigacycleStr = [attconstraintinterruptionrestaurants_dhAZverifygigacyclersityconstraintinterruptionrestaurants_dhAZverifygigacycleNormal componentsJoinedByString:@" "];
  
}


- (void)humanVC
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

@end