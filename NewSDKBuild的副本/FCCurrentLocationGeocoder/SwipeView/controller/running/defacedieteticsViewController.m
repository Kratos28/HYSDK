//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "defacedieteticsViewController.h"

 @interface defacedieteticsViewController()
 
@end

@implementation defacedieteticsViewController
 


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
	  NSArray *arr1 = @[@"111",@"222",@"333"];

        NSArray *arr2 = @[@"111",@"333",@"222"];


        

        if ([arr1 isEqualToArray:arr2])

        {

            //NSLog(@"内容完全相等");

        }

        else

        {

            //NSLog(@"内容不完全相等");

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


- (void)familyVC
{
	  NSMutableArray *greeunify_OmYQhadditionallyNormal = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSString *itemunify_OmYQhadditionallyStr = [NSString stringWithFormat:@"%ldunify_OmYQhadditionally",(long)index];

        [greeunify_OmYQhadditionallyNormal addObject:itemunify_OmYQhadditionallyStr];
    }


    NSSortDescriptor *sortunify_OmYQhadditionallyDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];


    NSArray *myunify_OmYQhadditionallyarr = [greeunify_OmYQhadditionallyNormal sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortunify_OmYQhadditionallyDescriptor, nil]];
  
}


- (void)famousVC
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


- (void)favourVC
{
	   NSString *s1=@"3hello world1";
        NSString *s2=@"2hello world2";
        NSComparisonResult result=[s1 compare:s2];

       // //NSLog(@"compare:%@",[NSNumber numberWithInt:result]);
        if(result==NSOrderedDescending){
            //NSLog(@"s1>s2");
        }
  
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
	 NSMutableArray *mbodyinvalidation_rotationsbordernanowattsData = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        int flag = arc4random() % 30 + 1;
        NSString *iteminvalidation_rotationsbordernanowattsStr = [NSString stringWithFormat:@"%dinvalidation_rotationsbordernanowatts%d",flag,(arc4random() % flag + 1)];


        [mbodyinvalidation_rotationsbordernanowattsData addObject:iteminvalidation_rotationsbordernanowattsStr];
    }

  
}


- (void)habitVC
{
	  NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionaryWithCapacity:3];
    [mutableDictionary setObject:@"wujy" forKey:@"name"];

    [mutableDictionary setObject:@"cnblogs.com/wujy" forKey:@"webName"];
    [mutableDictionary setObject:@29 forKey:@"age"];
  
}


- (void)handsomeVC
{
	 NSMutableArray *hroughaudiences_subsidiaryvignettinglifecycleArr = [NSMutableArray arrayWithArray:@[@"audiences_subsidiaryvignettinglifecycle32",@"audiences_subsidiaryvignettinglifecyclefgf",@"audiences_subsidiaryvignettinglifecyclehk",@"audiences_subsidiaryvignettinglifecyclefd",@"jfdghaudiences_subsidiaryvignettinglifecycle",@"dshaudiences_subsidiaryvignettinglifecyclefg"]];

    NSInteger hroughArrCount = hroughaudiences_subsidiaryvignettinglifecycleArr.count;
    for (NSInteger index = 0; index < hroughArrCount; index ++) {

        NSString *pageaudiences_subsidiaryvignettinglifecycleStr = [NSString stringWithFormat:@"dfsgaudiences_subsidiaryvignettinglifecycle8676%ld",(long)index];

        [hroughaudiences_subsidiaryvignettinglifecycleArr insertObject:pageaudiences_subsidiaryvignettinglifecycleStr atIndex:index];
    }
    NSString *resultaudiences_subsidiaryvignettinglifecycleStr = [hroughaudiences_subsidiaryvignettinglifecycleArr componentsJoinedByString:@"|"];
  
}


- (void)howeverVC
{
	 NSMutableArray *verlapbackspacekey_yGSminimizebuttData = [NSMutableArray array];
    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbackspacekey_yGSminimizebutt%d",flag,(arc4random() % flag + 1)];


        [verlapbackspacekey_yGSminimizebuttData addObject:itemStr];
    }
  
}


- (void)humanVC
{
	 NSMutableArray * array =[[NSMutableArray alloc] initWithObjects:@"a",@"b",@"c" ,nil];


        

NSMutableArray * array1 =[NSMutableArray arrayWithObjects:@"a",@"b",@"c" , nil];

NSArray * array2 = @[@"1",@"2",@"3"];

 

NSMutableArray * array3 = [[NSMutableArray alloc]initWithArray:array2];
  
}

@end