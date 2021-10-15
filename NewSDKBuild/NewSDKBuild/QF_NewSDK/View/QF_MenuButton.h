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
@class QF_MenuButton;
@protocol HZMenuButtonDelegate <NSObject>
@optional
-(void)willSelectedDDMenuButton:(QF_MenuButton *)button;
-(void)QF_ddButton:(QF_MenuButton *)ddbtn tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//定制tableCell
-(UITableViewCell *)ddButton:(QF_MenuButton *)ddbtn tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface QF_MenuButton : UIButton <UITableViewDataSource,UITableViewDelegate>


//下拉菜单
@property (nonatomic,copy) UIView * QF_dropDownMenu;
//
@property (nonatomic,assign) CGFloat QF_menuRowHeight;
//左tableView
@property (nonatomic,strong) UITableView * QF_mainTableView;
//右tableView
@property (nonatomic,strong) UITableView * supportTableView;
//tableView代理
@property (nonatomic,assign) id<HZMenuButtonDelegate>delegate;
//菜单类型
@property (nonatomic,assign) MenuMode QF_menuMode;

@property (nonatomic,strong) NSMutableArray * mainTableDataArray;
@property (nonatomic,copy) NSArray * supportTableDataArray;
/**
 *  下拉箭头
 */
@property (nonatomic,strong) UIImageView * QF_arrowView;


//收起菜单
-(void)QF_closeMenu;
-(void)QF_removeMenuView;
-(instancetype)initWithFrame:(CGRect)frame fromView:(UIView *)superView;
@end
