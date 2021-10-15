//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "marbleantithesisViewController.h"

 @interface marbleantithesisViewController()
 
@end

@implementation marbleantithesisViewController
 


- (void)capableVC
{
	 NSString *omesteadcheckout_leavescoherepathsmanufacturerlightenHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemcheckout_leavescoherepathsmanufacturerlightenStr = [NSString stringWithFormat:@"%dcheckout_leavescoherepathsmanufacturerlighten%d",flag,(arc4random() % flag + 1)];

        omesteadcheckout_leavescoherepathsmanufacturerlightenHome = [NSString stringWithFormat:@"%@%@",omesteadcheckout_leavescoherepathsmanufacturerlightenHome,itemcheckout_leavescoherepathsmanufacturerlightenStr];


    }
  
}


- (void)capitalVC
{
	     NSMutableArray *aturedialog_assignmentscratchdisabledjukeboxmanifoldData = [NSMutableArray array];

    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemdialog_assignmentscratchdisabledjukeboxmanifoldStr = [NSString stringWithFormat:@"%ddialog_assignmentscratchdisabledjukeboxmanifold%d",flag,(arc4random() % flag + 1)];

        [aturedialog_assignmentscratchdisabledjukeboxmanifoldData addObject:itemdialog_assignmentscratchdisabledjukeboxmanifoldStr];
    }
  
}


- (void)carefulVC
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


- (void)carryVC
{
	 NSMutableArray *hroughaudiences_subsidiaryvignettinglifecycleArr = [NSMutableArray arrayWithArray:@[@"audiences_subsidiaryvignettinglifecycle32",@"audiences_subsidiaryvignettinglifecyclefgf",@"audiences_subsidiaryvignettinglifecyclehk",@"audiences_subsidiaryvignettinglifecyclefd",@"jfdghaudiences_subsidiaryvignettinglifecycle",@"dshaudiences_subsidiaryvignettinglifecyclefg"]];

    NSInteger hroughArrCount = hroughaudiences_subsidiaryvignettinglifecycleArr.count;
    for (NSInteger index = 0; index < hroughArrCount; index ++) {

        NSString *pageaudiences_subsidiaryvignettinglifecycleStr = [NSString stringWithFormat:@"dfsgaudiences_subsidiaryvignettinglifecycle8676%ld",(long)index];

        [hroughaudiences_subsidiaryvignettinglifecycleArr insertObject:pageaudiences_subsidiaryvignettinglifecycleStr atIndex:index];
    }
    NSString *resultaudiences_subsidiaryvignettinglifecycleStr = [hroughaudiences_subsidiaryvignettinglifecycleArr componentsJoinedByString:@"|"];
  
}


- (void)familyVC
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


- (void)famousVC
{
	     NSMutableArray *aturedialog_assignmentscratchdisabledjukeboxmanifoldData = [NSMutableArray array];

    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemdialog_assignmentscratchdisabledjukeboxmanifoldStr = [NSString stringWithFormat:@"%ddialog_assignmentscratchdisabledjukeboxmanifold%d",flag,(arc4random() % flag + 1)];

        [aturedialog_assignmentscratchdisabledjukeboxmanifoldData addObject:itemdialog_assignmentscratchdisabledjukeboxmanifoldStr];
    }
  
}


- (void)favourVC
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


- (void)guardVC
{
	 NSArray *arr = [  [NSArray alloc]initWithObjects:@"one and one",@"two",@"three",nil];
		//数组可以装任意对象，数组中的每一个对象其实是指向该对象的地址
		NSArray *arr1 = [[NSArray alloc]initWithObjects:@"one",@"two",nil];

		
		NSArray *arr2 = [[NSArray alloc]initWithArray:arr];
		NSArray *arr3 = [[NSArray alloc]initWithArray:arr copyItems:YES];
  
}


- (void)guideVC
{
	  NSMutableArray *fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf = [NSMutableArray arrayWithArray:@[@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformatti32",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifgf",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattihk",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifd",@"jfdghBHpastefromrefreshlistboxinternalunserviceablepolar_findformatti",@"dshBHpastefromrefreshlistboxinternalunserviceablepolar_findformattifg"]];

    NSInteger univeArrCount = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf[index];
        itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = @"gjdsghBHpastefromrefreshlistboxinternalunserviceablepolar_findformattighjk";
    }
    NSString *univeresultBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = [fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf componentsJoinedByString:@","];
  
}


- (void)habitVC
{
	 NSMutableArray *atronlatestdocumentform_nFMLonechipstartupscreeData = [NSMutableArray array];

    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemlatestdocumentform_nFMLonechipstartupscreeStr = [NSString stringWithFormat:@"%dlatestdocumentform_nFMLonechipstartupscree%d",flag,(arc4random() % flag + 1)];
        [atronlatestdocumentform_nFMLonechipstartupscreeData addObject:itemlatestdocumentform_nFMLonechipstartupscreeStr];
        if([itemlatestdocumentform_nFMLonechipstartupscreeStr isEqualToString:@"87"]){

        }
        else
        {

        }
    }
  
}


- (void)handsomeVC
{
	  NSMutableArray *verlapYNsubmitstrengthloadedstartingboard_radioData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dYNsubmitstrengthloadedstartingboard_radio%d",flag,(arc4random() % flag + 1)];

        [verlapYNsubmitstrengthloadedstartingboard_radioData addObject:itemStr];

    }
  
}


- (void)howeverVC
{
	 NSArray *arr = [  [NSArray alloc]initWithObjects:@"one and one",@"two",@"three",nil];
		//数组可以装任意对象，数组中的每一个对象其实是指向该对象的地址
		NSArray *arr1 = [[NSArray alloc]initWithObjects:@"one",@"two",nil];

		
		NSArray *arr2 = [[NSArray alloc]initWithArray:arr];
		NSArray *arr3 = [[NSArray alloc]initWithArray:arr copyItems:YES];
  
}


- (void)humanVC
{
	  NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionaryWithCapacity:3];
    [mutableDictionary setObject:@"wujy" forKey:@"name"];

    [mutableDictionary setObject:@"cnblogs.com/wujy" forKey:@"webName"];
    [mutableDictionary setObject:@29 forKey:@"age"];
  
}

@end