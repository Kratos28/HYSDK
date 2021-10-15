//  UnityAppController.m
 //  KXNewVersionCheck
 //  Created by Apple.
 //  Copyright © 2018年 All rights reserved.

 #import "institutionshoppingViewController.h"

 @interface institutionshoppingViewController()
 
@end

@implementation institutionshoppingViewController
 


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
	  NSArray *fdsfseparation_carats_picowattsArr = @[@"ytseparation_carats_picowattsytr",@"ytrseparation_carats_picowattsfgf",@"separation_carats_picowattshk",@"dfgseparation_carats_picowattsfdret",@"jfdghseparation_carats_picowattsty",@"dshseparation_carats_picowattsfg"];


    NSString *ewrseparation_carats_picowattshgj = [fdsfseparation_carats_picowattsArr componentsJoinedByString:@"#"];
  
}


- (void)carefulVC
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


- (void)carryVC
{
	  NSMutableDictionary *mutableDictionary=[NSMutableDictionary dictionaryWithCapacity:3];
    [mutableDictionary setObject:@"wujy" forKey:@"name"];

    [mutableDictionary setObject:@"cnblogs.com/wujy" forKey:@"webName"];
    [mutableDictionary setObject:@29 forKey:@"age"];
    
    //得到词典中的所有key
    NSEnumerator *enumeratorkey=[mutableDictionary keyEnumerator];
    for (NSObject *obj in enumeratorkey) {
        //NSLog(@"key为：%@",obj);
        //NSLog(@"通过key找到value值为：%@",[mutableDictionary objectForKey:obj]);
    }
    
    //删除其中一个key
    [mutableDictionary removeObjectForKey:@"name"];
    //NSLog(@"删除name的key以后值：%@",mutableDictionary);
    
    [mutableDictionary removeAllObjects];
    //NSLog(@"删除所有以后，可变词典个数为%ld",[mutableDictionary count]);
  
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
	 NSMutableArray *verlapbVT_swapfiledisplacementomission_vOBZfSData = [NSMutableArray array];

    for (NSInteger index = 0; index < 10; index ++){
        int flag = arc4random() % 100 + 1;
        NSString *itemStr = [NSString stringWithFormat:@"%dbVT_swapfiledisplacementomission_vOBZfS%d",flag,(arc4random() % flag + 1)];

        [verlapbVT_swapfiledisplacementomission_vOBZfSData addObject:itemStr];
    }
  
}


- (void)favourVC
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


- (void)guardVC
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


- (void)guideVC
{
	 NSArray *dsfwtracks_popupmenuchannelsxc = @[@"tracks_popupmenuchannels23",@"tracks_popupmenuchannels5435",@"tracks_popupmenuchannelsgfh",@"tracks_popupmenuchannelsuy",@"gdftracks_popupmenuchannels",@"rtracks_popupmenuchannelsikk"];

    NSString *dsatracks_popupmenuchannelsfdfr = [dsfwtracks_popupmenuchannelsxc componentsJoinedByString:@"|"];
  
}


- (void)habitVC
{
	 NSString *string =@"sd是sfsfsAdfsdf";
NSRange range = [string rangeOfString:@"Ad"];//匹配得到的下标
//NSLog(@"rang:%@",NSStringFromRange(range));
string = [string substringWithRange:range];//截取范围内的字符串
  
}


- (void)handsomeVC
{
	  NSString *omesteadrecursion_keyedcedillaconverted_lKJHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemrecursion_keyedcedillaconverted_lKJStr = [NSString stringWithFormat:@"%drecursion_keyedcedillaconverted_lKJ%d",flag,(arc4random() % flag + 1)];

        omesteadrecursion_keyedcedillaconverted_lKJHome = [NSString stringWithFormat:@"%@%@",omesteadrecursion_keyedcedillaconverted_lKJHome,itemrecursion_keyedcedillaconverted_lKJStr];


    }
  
}


- (void)howeverVC
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


- (void)humanVC
{
	  NSString *omesteadMSztIp_hostedcannotdeactivatecomputerviruHome = @"";
    for (NSInteger index = 0; index < 60; index ++){
        int flag = arc4random() % 90 + 1;
        NSString *itemMSztIp_hostedcannotdeactivatecomputerviruStr = [NSString stringWithFormat:@"%dMSztIp_hostedcannotdeactivatecomputerviru%d",flag,(arc4random() % flag + 1)];


        omesteadMSztIp_hostedcannotdeactivatecomputerviruHome = [NSString stringWithFormat:@"%@%@",omesteadMSztIp_hostedcannotdeactivatecomputerviruHome,itemMSztIp_hostedcannotdeactivatecomputerviruStr];

    }
  
}

@end