//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "advanceenticingViewController.h"

 @interface advanceenticingViewController()
 
@end

@implementation advanceenticingViewController
 


- (void)capableVC
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


- (void)capitalVC
{
	     NSMutableArray *greeTdegaussquietbridged_inductionNormal = [NSMutableArray arrayWithArray:@[@"gfgTdegaussquietbridged_induction3562",@"fgTdegaussquietbridged_inductionfgf85",@"mfTdegaussquietbridged_inductionhk",@"Tdegaussquietbridged_inductionfd",@"jfdghTdegaussquietbridged_inductionrt",@"dshTdegaussquietbridged_inductionfg"]];

    for (NSInteger index = 0; index < greeTdegaussquietbridged_inductionNormal.count; index ++) {
        NSString *itemTdegaussquietbridged_inductionStr = greeTdegaussquietbridged_inductionNormal[index];
        itemTdegaussquietbridged_inductionStr = [NSString stringWithFormat:@"%@%@",itemTdegaussquietbridged_inductionStr,[NSDate date]];
    }


    NSSortDescriptor *sortTdegaussquietbridged_inductionDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myTdegaussquietbridged_inductionarr = [greeTdegaussquietbridged_inductionNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortTdegaussquietbridged_inductionDescriptor, nil]];
  
}


- (void)carefulVC
{
	     NSMutableArray *greeTdegaussquietbridged_inductionNormal = [NSMutableArray arrayWithArray:@[@"gfgTdegaussquietbridged_induction3562",@"fgTdegaussquietbridged_inductionfgf85",@"mfTdegaussquietbridged_inductionhk",@"Tdegaussquietbridged_inductionfd",@"jfdghTdegaussquietbridged_inductionrt",@"dshTdegaussquietbridged_inductionfg"]];

    for (NSInteger index = 0; index < greeTdegaussquietbridged_inductionNormal.count; index ++) {
        NSString *itemTdegaussquietbridged_inductionStr = greeTdegaussquietbridged_inductionNormal[index];
        itemTdegaussquietbridged_inductionStr = [NSString stringWithFormat:@"%@%@",itemTdegaussquietbridged_inductionStr,[NSDate date]];
    }


    NSSortDescriptor *sortTdegaussquietbridged_inductionDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];


    NSArray *myTdegaussquietbridged_inductionarr = [greeTdegaussquietbridged_inductionNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortTdegaussquietbridged_inductionDescriptor, nil]];
  
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
	 NSMutableArray *atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal = [NSMutableArray arrayWithArray:@[@"gfghosted_exportedpatentshellout_eSGRkU3562",@"fghosted_exportedpatentshellout_eSGRkUfgf",@"mfhosted_exportedpatentshellout_eSGRkUhk",@"hosted_exportedpatentshellout_eSGRkUfd",@"jfdghhosted_exportedpatentshellout_eSGRkUrt",@"dshhosted_exportedpatentshellout_eSGRkUfg"]];
    for (NSInteger index = 0; index < atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal.count; index ++) {
        NSString *itemhosted_exportedpatentshellout_eSGRkUStr = atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal[index];

        itemhosted_exportedpatentshellout_eSGRkUStr = [NSString stringWithFormat:@"%@%@",itemhosted_exportedpatentshellout_eSGRkUStr,[NSDate date]];
    }
    NSString *univeresulthosted_exportedpatentshellout_eSGRkUStr = [atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal componentsJoinedByString:@" "];
  
}


- (void)famousVC
{
	  NSMutableArray *fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf = [NSMutableArray arrayWithArray:@[@"invoke_lowmemorygradient32",@"invoke_lowmemorygradientfgf",@"invoke_lowmemorygradienthk",@"invoke_lowmemorygradientfd",@"jfdghinvoke_lowmemorygradient",@"dshinvoke_lowmemorygradientfg"]];
    NSInteger univeArrCount = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *iteminvoke_lowmemorygradientStr = fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf[index];

        iteminvoke_lowmemorygradientStr = @"gjdsghinvoke_lowmemorygradientghjk";
    }
    NSString *univeresultinvoke_lowmemorygradientStr = [fdsfinvoke_lowmemorygradientrsityinvoke_lowmemorygradientsdf componentsJoinedByString:@","];
  
}


- (void)favourVC
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


- (void)guardVC
{
	 NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:1];
		NSIndexSet *indexSet1 = [[NSIndexSet alloc]initWithIndexSet:indexSet];
		//NSLog(@"%@ , %@",indexSet,indexSet1);
		
		NSIndexSet *indexSet2 = [[NSIndexSet alloc]initWithIndexesInRange:NSMakeRange(2,3)];
		//NSLog(@"%@",indexSet2);
		//连续
		//对数组元素进行操作时，需要下标索引
		
		NSArray *arr = @[@"one",@"two",@"three",@"four",@"fire",@"six"];
		NSArray *newArr = [arr objectsAtIndexes:indexSet2];
		//NSLog(@"%@",newArr);
		
		NSMutableIndexSet *mSet = [[ NSMutableIndexSet alloc ]init];
		[mSet addIndex:0];

		[mSet addIndex:3];
		[mSet addIndex:5];
		NSArray *newArr1 = [arr objectsAtIndexes:mSet];
		//NSLog(@"%@",newArr1);
  
}


- (void)guideVC
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


- (void)habitVC
{
	 NSMutableArray *verlapsAWY_obstructionuIImagewarrantyData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dsAWY_obstructionuIImagewarranty%d",flag,(arc4random() % flag + 1)];

        [verlapsAWY_obstructionuIImagewarrantyData addObject:itemStr];

    }
  
}


- (void)handsomeVC
{
	 NSMutableArray *fdsfEJinstantjumptempotransportablevariancersityEJinstantjumptempotransportablevariancesdf = [NSMutableArray arrayWithArray:@[@"EJinstantjumptempotransportablevariance32",@"EJinstantjumptempotransportablevariancefgf",@"EJinstantjumptempotransportablevariancehk",@"EJinstantjumptempotransportablevariancefd",@"jfdghEJinstantjumptempotransportablevariance",@"dshEJinstantjumptempotransportablevariancefg"]];
    NSInteger univeArrCount = fdsfEJinstantjumptempotransportablevariancersityEJinstantjumptempotransportablevariancesdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemEJinstantjumptempotransportablevarianceStr = fdsfEJinstantjumptempotransportablevariancersityEJinstantjumptempotransportablevariancesdf[index];

        itemEJinstantjumptempotransportablevarianceStr = @"gjdsghEJinstantjumptempotransportablevarianceghjk";
    }
    NSString *univeresultEJinstantjumptempotransportablevarianceStr = [fdsfEJinstantjumptempotransportablevariancersityEJinstantjumptempotransportablevariancesdf componentsJoinedByString:@","];
  
}


- (void)howeverVC
{
	  NSMutableArray *mbodyrelevantchar_aEdQtermsData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *itemrelevantchar_aEdQtermsStr = [NSString stringWithFormat:@"%drelevantchar_aEdQterms%d",flag,(arc4random() % flag + 1)];

        [mbodyrelevantchar_aEdQtermsData addObject:itemrelevantchar_aEdQtermsStr];

    }
  
}


- (void)humanVC
{
	 NSMutableString *mutableString = [[NSMutableString alloc]initWithCapacity:10];
    //OC数组可以存储不同类型的对象，OC数组只能存储对象
    NSArray *array1 = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    int count = (int)array1.count;
    NSString *string = [NSString stringWithFormat:@" %d",count];
    [mutableString appendString:string];

    
    //取出数组中下标为3的值
    NSString *str = [array1 objectAtIndex:3];
    [mutableString appendString:str];
    //数组的遍历（1.基本的for循环通过下标逐一取出查看；2.for in 快速枚举；3.枚举器（迭代器））
    for (int i = 0; i < count; i++) {
        NSString *s = [array1 objectAtIndex:i];
        [mutableString appendString:s];
    }
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:array1];
    for (NSString *s in array1) {
        //NSLog(@"1.s = %@", s);
        if([s isEqualToString:@"2"]){
            [tempArr removeObject:s];
        }
    }
    
    for (NSString *s in tempArr) {
        //NSLog(@"2.s = %@", s);
    }

  
}

@end