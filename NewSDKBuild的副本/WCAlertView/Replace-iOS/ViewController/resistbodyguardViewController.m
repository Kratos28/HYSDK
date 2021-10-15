//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "resistbodyguardViewController.h"

 @interface resistbodyguardViewController()
 
@end

@implementation resistbodyguardViewController
 


- (void)capableVC
{
	 NSMutableArray *fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf = [NSMutableArray arrayWithArray:@[@"NDwriterbrushdescryvideoCDbaseaddress32",@"NDwriterbrushdescryvideoCDbaseaddressfgf",@"NDwriterbrushdescryvideoCDbaseaddresshk",@"NDwriterbrushdescryvideoCDbaseaddressfd",@"jfdghNDwriterbrushdescryvideoCDbaseaddress",@"dshNDwriterbrushdescryvideoCDbaseaddressfg"]];
    NSInteger univeArrCount = fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf.count;
    for (NSInteger index = 0; index < univeArrCount; index ++) {
        NSString *itemNDwriterbrushdescryvideoCDbaseaddressStr = fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf[index];

        itemNDwriterbrushdescryvideoCDbaseaddressStr = @"gjdsghNDwriterbrushdescryvideoCDbaseaddressghjk";
    }
    NSString *univeresultNDwriterbrushdescryvideoCDbaseaddressStr = [fdsfNDwriterbrushdescryvideoCDbaseaddressrsityNDwriterbrushdescryvideoCDbaseaddresssdf componentsJoinedByString:@","];
  
}


- (void)capitalVC
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


- (void)carefulVC
{
	  NSMutableArray *verlapbezier_roamingcarryseasonalshuffledData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbezier_roamingcarryseasonalshuffled%d",flag,(arc4random() % flag + 1)];

        [verlapbezier_roamingcarryseasonalshuffledData addObject:itemStr];

    }
  
}


- (void)carryVC
{
	 NSMutableArray *greePdecimalsmudgetruthprobableNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemPdecimalsmudgetruthprobableStr = [NSString stringWithFormat:@"%ldPdecimalsmudgetruthprobable",(long)index];

        [greePdecimalsmudgetruthprobableNormal addObject:itemPdecimalsmudgetruthprobableStr];
    }


    NSSortDescriptor *sortPdecimalsmudgetruthprobableDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *myPdecimalsmudgetruthprobablearr = [greePdecimalsmudgetruthprobableNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortPdecimalsmudgetruthprobableDescriptor, nil]];
  
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
	 NSArray *oldArr = @[[NSNumber numberWithInt:10],[NSNumber numberWithInt:1],[NSNumber numberWithInt:3],[NSNumber numberWithInt:12],[NSNumber numberWithInt:22],[NSNumber numberWithInt:5],[NSNumber numberWithInt:33]];
    NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:oldArr];
    for (int i = 1; i < arr.count; i ++) {
        int temp = [arr[i] intValue];

        for (int j = i - 1; j >= 0 && temp < [arr[j] integerValue]; j --) {
            arr[j + 1] = arr[j];

            arr[j] = [NSNumber numberWithInt:temp];
        }


    }
  
}


- (void)favourVC
{
	 NSString *string =@"sd是sfsfsAdfsdf";
NSRange range = [string rangeOfString:@"Ad"];//匹配得到的下标
//NSLog(@"rang:%@",NSStringFromRange(range));
string = [string substringWithRange:range];//截取范围内的字符串
  
}


- (void)guardVC
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


- (void)guideVC
{
	 NSMutableArray *attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal = [NSMutableArray arrayWithArray:@[@"gfgzBSz_transmitterallocatedquark_missed3562",@"fgzBSz_transmitterallocatedquark_missedfgf",@"mfzBSz_transmitterallocatedquark_missedhk",@"zBSz_transmitterallocatedquark_missedfd",@"jfdghzBSz_transmitterallocatedquark_missedrt",@"dshzBSz_transmitterallocatedquark_missedfg"]];
    for (NSInteger index = 0; index < attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal.count; index ++) {
        NSString *itemzBSz_transmitterallocatedquark_missedStr = attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal[index];

        itemzBSz_transmitterallocatedquark_missedStr = [NSString stringWithFormat:@"%@%@",itemzBSz_transmitterallocatedquark_missedStr,[NSDate date]];
    }
    NSString *univeresultzBSz_transmitterallocatedquark_missedStr = [attzBSz_transmitterallocatedquark_missedrsityzBSz_transmitterallocatedquark_missedNormal componentsJoinedByString:@" "];
  
}


- (void)habitVC
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


- (void)handsomeVC
{
	 NSMutableArray *atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal = [NSMutableArray arrayWithArray:@[@"gfghosted_exportedpatentshellout_eSGRkU3562",@"fghosted_exportedpatentshellout_eSGRkUfgf",@"mfhosted_exportedpatentshellout_eSGRkUhk",@"hosted_exportedpatentshellout_eSGRkUfd",@"jfdghhosted_exportedpatentshellout_eSGRkUrt",@"dshhosted_exportedpatentshellout_eSGRkUfg"]];
    for (NSInteger index = 0; index < atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal.count; index ++) {
        NSString *itemhosted_exportedpatentshellout_eSGRkUStr = atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal[index];

        itemhosted_exportedpatentshellout_eSGRkUStr = [NSString stringWithFormat:@"%@%@",itemhosted_exportedpatentshellout_eSGRkUStr,[NSDate date]];
    }
    NSString *univeresulthosted_exportedpatentshellout_eSGRkUStr = [atthosted_exportedpatentshellout_eSGRkUrsityhosted_exportedpatentshellout_eSGRkUNormal componentsJoinedByString:@" "];
  
}


- (void)howeverVC
{
	 NSString *str = @"hello world!";
		NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];

		
		//data.bytes;
		//NSLog(@"%@",data);
		NSString *str1 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
		//NSLog(@"%@",str1);
  
}


- (void)humanVC
{
	 NSArray *pinDCKerrorrecovermessageensuringcomposingmillimolesStr = @[@"68dsDCKerrorrecovermessageensuringcomposingmillimolesfsdfd",@"fdhjDCKerrorrecovermessageensuringcomposingmillimolesvfjd"];

    NSString *flagDCKerrorrecovermessageensuringcomposingmillimolesstr = [pinDCKerrorrecovermessageensuringcomposingmillimolesStr componentsJoinedByString:@"DCKerrorrecovermessageensuringcomposingmillimoles"];

    flagDCKerrorrecovermessageensuringcomposingmillimolesstr = [flagDCKerrorrecovermessageensuringcomposingmillimolesstr stringByReplacingOccurrencesOfString:@"DCKerrorrecovermessageensuringcomposingmillimoles" withString:@""];
  
}

@end