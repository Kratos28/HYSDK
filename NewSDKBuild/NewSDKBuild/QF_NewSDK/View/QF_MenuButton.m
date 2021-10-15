//
//  HZ_downBtn.m
//  HZGameSDK
//
//  Created by K on 2019/2/22.
//  Copyright © 2019 HZGameSDK. All rights reserved.
//



#import "QF_MenuButton.h"
#import "QF_Tool.h"
#define lKeyWindow [(UIApplication *)[UIApplication sharedApplication] keyWindow]
/*系统屏幕的高*/
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/*系统屏幕的宽*/
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kenabledViewH 30


@interface QF_MenuButton ()
@property (nonatomic,copy) UIView * QF_enabledView;
@property (nonatomic,assign) CGFloat QF_menuHeight;
@property (nonatomic,strong) UIView *QF_superVWiew;
@end

@implementation QF_MenuButton

-(instancetype)initWithFrame:(CGRect)frame fromView:(UIView *)superView 
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        if ([QF_Tool QF_getAccount].count == 0 ) {
            self.enabled = false;
        }else
        {
            self.enabled = true;
        }

        
        _mainTableDataArray = [[NSMutableArray alloc] init];
        self.QF_superVWiew = superView;
         _QF_menuHeight = kScreenHeight/2-self.frame.size.height;
        _QF_menuRowHeight = kenabledViewH;
        _QF_menuHeight = _QF_menuRowHeight *4;
        
        //获取superView所在的UIViewController
        id target=superView;
        while (target) {
            target = ((UIResponder *)target).nextResponder;
            if ([target isKindOfClass:[UIViewController class]]) {
                break;
            }
        }
        
        UIViewController *vc = (UIViewController *)[QF_Tool QF_weakVC];
        
        //计算button所在ViewController的相对位置
        CGRect rc = [vc.view convertRect:self.frame fromView:superView];
        rc.origin.y +=  superView.frame.size.height ;
        rc.origin.x = rc.origin.x;
        
        rc.size = CGSizeMake(superView.frame.size.width  , 0);
        
        

        
        
        _QF_dropDownMenu = [[UIView alloc] initWithFrame:rc];
        [self config];
        
        if (@available(iOS 10.0, *)) {
            [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:true block:^(NSTimer * _Nonnull timer) {
                
                if ([self isDisplayedInScreen] == true) {
                    [self QF_userEnabled:false];
                }
                
                

                
                
            }];
        } else {

            
              NSTimer *timer =  [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(QF_timerWithTimeIntervals) userInfo:nil repeats:true];
            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

        }

       

    }
    return self;
    
}
- (void)QF_timerWithTimeIntervals
{
    if ([self isDisplayedInScreen] == true) {
        [self QF_userEnabled:false];
    }
}

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen
{
    if (self == nil) {
        return FALSE;
    }

    CGRect screenRect = [UIScreen mainScreen].bounds;

    

    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return FALSE;
    }

    // 若view 隐藏
    if (self.hidden) {
        return FALSE;
    }

    // 若没有superview
    if (self.superview == nil) {
        return FALSE;
    }

    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  FALSE;
    }

    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }

    return TRUE;
}

- (void)dealloc
{
    [self QF_removeMenuView];
}



-(void)config{
    [self addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    id target= self.QF_superVWiew;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    UIViewController * vc = (UIViewController *)[QF_Tool QF_weakVC];
    CGRect rc = [vc.view convertRect:self.frame fromView:self.QF_superVWiew];

    
    _QF_enabledView = [[UIView alloc] initWithFrame:CGRectMake(rc.origin.x, _QF_dropDownMenu.frame.origin.y,_QF_dropDownMenu.frame.size.width, kenabledViewH)];
    _QF_enabledView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _QF_enabledView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(QF_closeMenu)];
    [_QF_enabledView addGestureRecognizer:tap];
    
    //下拉箭头
//    UIImage * image = [QF_Tool QF_SetBundleImageName:@"下拉箭头" bundleName:nil];
    UIImage *image =  randomBlockImage(10, 10);
    
    
    _QF_arrowView = [[UIImageView alloc] initWithImage:image];
    [_QF_arrowView sizeToFit];
    _QF_arrowView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:_QF_arrowView];
    
}


UIImage *randomBlockImage(CGFloat sideLength, CGFloat inset)
{
    UIGraphicsBeginImageContext(CGSizeMake(sideLength, sideLength));
    CGContextRef context = UIGraphicsGetCurrentContext();

    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 5, 10); // 向左画线
    CGContextAddLineToPoint(context, 10, 0);

    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

    return newImage;
}


-(void)clickButton{
    if ([self.delegate respondsToSelector:@selector(willSelectedDDMenuButton:)]) {
        [self.delegate willSelectedDDMenuButton:self];
    }
    self.selected = !self.selected;
}




-(void)QF_userEnabled:(BOOL)enabled{
    
  

    
    if(enabled){
        [lKeyWindow addSubview:_QF_enabledView];
        [lKeyWindow addSubview:_QF_dropDownMenu];
    }
    
    CGRect frame = _QF_dropDownMenu.frame;
    CGRect lFrame = self.QF_mainTableView.frame;
    CGRect rFrame = self.supportTableView.frame;
    
    
    if (enabled == YES) {
        frame.size.height = _QF_menuHeight;
    }else{
        frame.size.height = 0;
    }
    lFrame.size.height = frame.size.height;
    rFrame.size.height = frame.size.height;
    
    __weak __typeof(self)  weakSelf = self;
    weakSelf.userInteractionEnabled = NO;
    [UIView animateWithDuration:enabled?0.5:0.3 delay:0 usingSpringWithDamping:enabled?0.55:1 initialSpringVelocity:1 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        weakSelf.QF_arrowView.transform = CGAffineTransformMakeScale (1 , 1-2*enabled );
        
        weakSelf.QF_dropDownMenu.frame = frame;
        weakSelf.QF_mainTableView.frame = lFrame;
        weakSelf.supportTableView.frame = rFrame;
        //_dropDownMenu.alpha = enabled;
        weakSelf.QF_enabledView.alpha = enabled;
    } completion:^(BOOL finished) {
        weakSelf.userInteractionEnabled = YES;
        if (!enabled) {
            [weakSelf.QF_dropDownMenu removeFromSuperview];
            [weakSelf.QF_enabledView removeFromSuperview];
        }
        
    }];
}
-(void)QF_closeMenu{
    self.selected = NO;
}
#pragma mark - Set/Get
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self QF_userEnabled:selected];
}

-(void)setQF_menuMode:(MenuMode)menuMode{
    _QF_menuMode = menuMode;
    if(menuMode == DoubleMenu){
        CGRect frame = _QF_mainTableView.frame;
        frame.size.width = _QF_dropDownMenu.frame.size.width/2;
        _QF_mainTableView.frame = frame;
    }else{
        CGRect frame = _QF_mainTableView.frame;
        frame.size.width = _QF_dropDownMenu.frame.size.width;
        _QF_mainTableView.frame = frame;
    }
}
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self layoutSubviews];
    
    CGRect frame =  _QF_arrowView.frame;
    frame.origin.x =self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width+10;
    _QF_arrowView.frame = frame;
}
-(void)setMainTableDataArray:(NSMutableArray *)mainTableDataArray{
    if (_mainTableDataArray != mainTableDataArray) {
        _mainTableDataArray = nil;
        _mainTableDataArray = mainTableDataArray;
    }
    _QF_menuHeight =  mainTableDataArray.count * kenabledViewH;
    
    if (mainTableDataArray.count > 4) {
        _QF_menuHeight = 5 * kenabledViewH;
    }
    
    //根据数据容量改变Menu高度、限制极限值
    [_QF_mainTableView reloadData];
}
-(void)setSupportTableDataArray:(NSArray *)supportTableDataArray{
    if (_supportTableDataArray != supportTableDataArray) {
        _supportTableDataArray = nil;
        _supportTableDataArray = supportTableDataArray;
    }
    [_supportTableView reloadData];
}

-(UITableView *)QF_mainTableView{
    if(!_QF_mainTableView){
        _QF_mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _QF_dropDownMenu.frame.size.width,0) style:UITableViewStylePlain];
        _QF_mainTableView.delegate = self;
        _QF_mainTableView.dataSource = self;
        //_mainTableView.bounces = NO;
        _QF_mainTableView.backgroundColor = [UIColor whiteColor];
        _QF_mainTableView.showsHorizontalScrollIndicator = NO;
        _QF_mainTableView.showsVerticalScrollIndicator = NO;
        
        //去除无数据时tableView的横线
        _QF_mainTableView.tableFooterView = [[UIView alloc] init];
        
        [_QF_dropDownMenu addSubview:_QF_mainTableView];
        
    }
    return _QF_mainTableView;
}
-(UITableView *)supportTableView{
    if (_QF_menuMode == SingleMenu) {
        return nil;
    }
    if (!_supportTableView) {
        _supportTableView = [[UITableView alloc] initWithFrame:CGRectMake(_QF_dropDownMenu.frame.size.width/2, 0, _QF_dropDownMenu.frame.size.width/2, 0) style:UITableViewStylePlain];
        _supportTableView.delegate = self;
        _supportTableView.dataSource = self;
        _supportTableView.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
        [_QF_dropDownMenu addSubview:_supportTableView];
    }
    return _supportTableView;
}


#pragma mark - UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _QF_mainTableView) {
        return _mainTableDataArray.count;
    }else{
        return _supportTableDataArray.count;
    }
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(ddButton:tableView:cellForRowAtIndexPath:)]) {
        return [self.delegate ddButton:self tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    if (tableView == self.QF_mainTableView) {
        static NSString * cellID = @"mainCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
            
            UIButton *btton = [[UIButton alloc] init];
            btton.tag = indexPath.row;
//            [btton setImage:[Tools SetBundleImageName:@"secondlogin_icon_deleteuser_normal@3x" bundleName:@"LZBundle"] forState:UIControlStateNormal];
            [cell.contentView addSubview:btton];
//            [btton mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.bottom.equalTo(cell.contentView);
//                make.right.equalTo(cell.contentView).mas_offset(-10);
//            }];
//            [btton XJ_addEventHandler_XJ:^(UIButton * _Nonnull button) {
//
//                [Tools removeAccountAtindex:indexPath.row];
//                [self.mainTableDataArray removeObjectAtIndex:indexPath.row];
//
//                if (self.mainTableDataArray.count > 4) {
//                    self.menuHeight = 5 * kenabledViewH;
//                }
//                self.menuHeight =  self.mainTableDataArray.count * kenabledViewH;
////                [self.enabledView mas_remakeConstraints:^(MASConstraintMaker *make) {
////                    make.height.equalTo(self.menuHeight);
////                }];
//
//                if (self.mainTableDataArray.count == 0 ) {
//                    self.selected = false;
//                    self.enabled = false;
//                }else
//                {
//                    self.enabled = true;
//                }
//                [self.mainTableView reloadData];
//
//            } forControlEvents:UIControlEventTouchUpInside];
            
        }
        if (indexPath.row == 0) {
            cell.selected = YES;
        }
        NSDictionary *temo = _mainTableDataArray[indexPath.row];
        cell.textLabel.text = temo[@"account"];
        return cell;
    }
    
    static NSString * cellID = @"supportCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = _supportTableDataArray[indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(QF_ddButton:tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate QF_ddButton:self tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    if (_QF_menuMode == SingleMenu) {
        self.selected = NO;
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }else{
        if (tableView == self.supportTableView) {
            self.selected = NO;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _QF_menuRowHeight;
}

-(void)QF_removeMenuView{
    [_QF_dropDownMenu removeFromSuperview];
    [_QF_enabledView removeFromSuperview];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if([keyPath isEqualToString:@"lastObject"])
    {
        [self QF_removeMenuView];
    }
}





@end



