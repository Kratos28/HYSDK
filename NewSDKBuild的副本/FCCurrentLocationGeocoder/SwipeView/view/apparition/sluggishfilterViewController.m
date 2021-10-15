//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "sluggishfilterViewController.h"

 @interface sluggishfilterViewController()
 
@end

@implementation sluggishfilterViewController
 


- (void)capableVC
{
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *list = [[NSMutableArray alloc]initWithArray:oldArr];

    if (list.count <= 1) {
        return;
    }
    NSInteger i,j;

    for (i=0; i<list.count-1; i++) {
        j=i;
        for (NSInteger k=i+1; k<list.count; k++) {

            if ([[list objectAtIndex:k]integerValue] < [[list objectAtIndex:j]integerValue]) {
                j=k;
            }
        }

        if (i!=j) {
            [list exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
  
}


- (void)capitalVC
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


- (void)carefulVC
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


- (void)carryVC
{
	  NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionaryWithCapacity:3];
    [mutableDictionary setObject:@"wujy" forKey:@"name"];

    [mutableDictionary setObject:@"cnblogs.com/wujy" forKey:@"webName"];
    [mutableDictionary setObject:@29 forKey:@"age"];
  
}


- (void)familyVC
{
	 NSMutableArray *greePdecimalsmudgetruthprobableNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemPdecimalsmudgetruthprobableStr = [NSString stringWithFormat:@"%ldPdecimalsmudgetruthprobable",(long)index];
        [greePdecimalsmudgetruthprobableNormal addObject:itemPdecimalsmudgetruthprobableStr];

    }


    NSSortDescriptor *sortPdecimalsmudgetruthprobableDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *myPdecimalsmudgetruthprobablearr = [greePdecimalsmudgetruthprobableNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortPdecimalsmudgetruthprobableDescriptor, nil]];
  
}


- (void)famousVC
{
	 NSString *omesteadcheckout_leavescoherepathsmanufacturerlightenHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemcheckout_leavescoherepathsmanufacturerlightenStr = [NSString stringWithFormat:@"%dcheckout_leavescoherepathsmanufacturerlighten%d",flag,(arc4random() % flag + 1)];

        omesteadcheckout_leavescoherepathsmanufacturerlightenHome = [NSString stringWithFormat:@"%@%@",omesteadcheckout_leavescoherepathsmanufacturerlightenHome,itemcheckout_leavescoherepathsmanufacturerlightenStr];


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
	 NSMutableArray *greeartist_swimmingretractingNormal = [NSMutableArray arrayWithArray:@[@"gfgartist_swimmingretracting3562",@"fgartist_swimmingretractingfgf85",@"mfartist_swimmingretractinghk",@"artist_swimmingretractingfd",@"jfdghartist_swimmingretractingrt",@"dshartist_swimmingretractingfg"]];
    for (NSInteger index = 0; index < greeartist_swimmingretractingNormal.count; index ++) {
        NSString *itemartist_swimmingretractingStr = greeartist_swimmingretractingNormal[index];

        itemartist_swimmingretractingStr = [NSString stringWithFormat:@"%@%@",itemartist_swimmingretractingStr,[NSDate date]];
    }


    NSSortDescriptor *sortartist_swimmingretractingDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myartist_swimmingretractingarr = [greeartist_swimmingretractingNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortartist_swimmingretractingDescriptor, nil]];
  
}


- (void)guideVC
{
	     NSMutableArray *aturedialog_assignmentscratchdisabledjukeboxmanifoldData = [NSMutableArray array];

    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemdialog_assignmentscratchdisabledjukeboxmanifoldStr = [NSString stringWithFormat:@"%ddialog_assignmentscratchdisabledjukeboxmanifold%d",flag,(arc4random() % flag + 1)];

        [aturedialog_assignmentscratchdisabledjukeboxmanifoldData addObject:itemdialog_assignmentscratchdisabledjukeboxmanifoldStr];
    }
  
}


- (void)habitVC
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


- (void)handsomeVC
{
	 NSString *string =@"123456d890";
NSString *str1 = [string substringToIndex:5];//截取掉下标5之前的字符串
//NSLog(@"截取的值为：%@",str1);
 NSString *str2 = [string substringFromIndex:3];//截取掉下标3之后的字符串
//NSLog(@"截取的值为：%@",str2);
  
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
	 NSMutableArray *attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal = [NSMutableArray arrayWithArray:@[@"gfgzBSz_transmitterallocatedquark_missed3562",@"fgzBSz_transmitterallocatedquark_missedfgf",@"mfzBSz_transmitterallocatedquark_missedhk",@"zBSz_transmitterallocatedquark_missedfd",@"jfdghzBSz_transmitterallocatedquark_missedrt",@"dshzBSz_transmitterallocatedquark_missedfg"]];
    for (NSInteger index = 0; index < attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal.count; index ++) {
        NSString *itemzBSz_transmitterallocatedquark_missedStr = attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal[index];

        itemzBSz_transmitterallocatedquark_missedStr = [NSString stringWithFormat:@"%@%@",itemzBSz_transmitterallocatedquark_missedStr,[NSDate date]];
    }
    NSString *univeresultzBSz_transmitterallocatedquark_missedStr = [attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal componentsJoinedByString:@" "];
  
}

@end