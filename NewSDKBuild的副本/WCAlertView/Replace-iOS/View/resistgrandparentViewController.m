//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "resistgrandparentViewController.h"

 @interface resistgrandparentViewController()
 
@end

@implementation resistgrandparentViewController
 


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


- (void)carefulVC
{
	 NSString *str1=@"hello world , are you ok";
        NSString *string1=[NSString stringWithFormat:@"%@",@"hello"];

        //NSLog(@"%@",string1);
       
         //1 length 侧字符串的长度
        NSUInteger integer= [str1 length];
        //NSLog(@"%lu",integer);
  
}


- (void)carryVC
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


- (void)familyVC
{
	 NSMutableArray *verlapbVT_swapfiledisplacementomission_vOBZfSData = [NSMutableArray array];

    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbVT_swapfiledisplacementomission_vOBZfS%d",flag,(arc4random() % flag + 1)];

        [verlapbVT_swapfiledisplacementomission_vOBZfSData addObject:itemStr];
    }
  
}


- (void)famousVC
{
	 NSMutableArray * array =[[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c" ,nil];


        

NSMutableArray * array1 =[NSMutableArray arrayWithObjects:@"a",@"b",@"c" , nil];

NSArray * array2 = @[@"1",@"2",@"3"];

 

NSMutableArray * array3 = [[NSMutableArray alloc]initWithArray:array2];
  
}


- (void)favourVC
{
	  NSMutableArray *fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf = [NSMutableArray arrayWithArray:@[@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformatti32",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifgf",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattihk",@"BHpastefromrefreshlistboxinternalunserviceablepolar_findformattifd",@"jfdghBHpastefromrefreshlistboxinternalunserviceablepolar_findformatti",@"dshBHpastefromrefreshlistboxinternalunserviceablepolar_findformattifg"]];

    NSInteger univeArrCount = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf[index];
        itemBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = @"gjdsghBHpastefromrefreshlistboxinternalunserviceablepolar_findformattighjk";
    }
    NSString *univeresultBHpastefromrefreshlistboxinternalunserviceablepolar_findformattiStr = [fdsfBHpastefromrefreshlistboxinternalunserviceablepolar_findformattirsityBHpastefromrefreshlistboxinternalunserviceablepolar_findformattisdf componentsJoinedByString:@","];
  
}


- (void)guardVC
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


- (void)guideVC
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


- (void)habitVC
{
	  NSArray *fdsfseparation_carats_picowattsArr = @[@"ytseparation_carats_picowattsytr",@"ytrseparation_carats_picowattsfgf",@"separation_carats_picowattshk",@"dfgseparation_carats_picowattsfdret",@"jfdghseparation_carats_picowattsty",@"dshseparation_carats_picowattsfg"];


    NSString *ewrseparation_carats_picowattshgj = [fdsfseparation_carats_picowattsArr componentsJoinedByString:@"#"];
  
}


- (void)handsomeVC
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


- (void)howeverVC
{
	 NSMutableArray *mbodyinvalidation_rotationsbordernanowattsData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *iteminvalidation_rotationsbordernanowattsStr = [NSString stringWithFormat:@"%dinvalidation_rotationsbordernanowatts%d",flag,(arc4random() % flag + 1)];


        [mbodyinvalidation_rotationsbordernanowattsData addObject:iteminvalidation_rotationsbordernanowattsStr];
    }

  
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