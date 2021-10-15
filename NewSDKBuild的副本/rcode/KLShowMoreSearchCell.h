//
//  HZ_downBtn.h
//  HZGameSDK
//
//  Created by K on 2019/2/22.
//  Copyright © 2019 HZGameSDK. All rights reserved.
//


#import <UIKit/UIKit.h>




typedef NS_ENUM(NSInteger, MenuMode) {
    SingleMenu = 0,//单个tableView,默认
    DoubleMenu = 1,//带子TableView的菜单
    
};
@class KLShowMoreSearchCell;
@protocol HZMenuButtonDelegate <NSObject>
@optional
-(void)willSelectedDDMenuButton:(KLShowMoreSearchCell *)button;
-(void)showProductpageshowParamstaoKeParamstrackParamtradeProcessSuccessCallbacktradeProcessFailedCallback:(KLShowMoreSearchCell *)ddbtn tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//定制tableCell
-(UITableViewCell *)ddButton:(KLShowMoreSearchCell *)ddbtn tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface KLShowMoreSearchCell : UIButton <UITableViewDataSource,UITableViewDelegate>


//下拉菜单
@property (nonatomic,copy) UIView * KLsnsId;
//
@property (nonatomic,assign) CGFloat KLvideoUploadEnable;
//左tableView
@property (nonatomic,strong) UITableView * KLcreateStyletime;
//右tableView
@property (nonatomic,strong) UITableView * supportTableView;
//tableView代理
@property (nonatomic,assign) id<HZMenuButtonDelegate>delegate;
//菜单类型
@property (nonatomic,assign) MenuMode KLvideoSequeue;

@property (nonatomic,strong) NSMutableArray * mainTableDataArray;
@property (nonatomic,copy) NSArray * supportTableDataArray;
/**
 *  下拉箭头
 */
@property (nonatomic,strong) UIImageView * KLskipLine;


//收起菜单
-(void)idsAtIndex;
-(void)processMusicPath;
-(instancetype)initWithFrame:(CGRect)frame fromView:(UIView *)superView;
@end
