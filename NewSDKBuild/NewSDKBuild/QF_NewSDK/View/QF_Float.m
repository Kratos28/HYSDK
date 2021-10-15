//
//  GArConstraint.h
//  WJGameSDK
//
//  Created by 张文杰 on 2018/12/3.
//  Copyright © 2018年 MeiAnKeJi. All rights reserved.
//

#import "QF_Float.h"
#import "QF_Tool.h"
#import "QF_NewSDKNet.h"

#define WIDTH self.frame.size.width

#define HEIGHT self.frame.size.height
#define WWW_QYScreenW_www [UIScreen mainScreen].bounds.size.width
#define WWW_QYScreenH_www [UIScreen mainScreen].bounds.size.height

#define animateDuration 0.3

#define showDuration 0.1

#define statusChangeDuration  3.0

#define normalAlpha  1

#define sleepAlpha  1

#define myBorderWidth 1.0

#define marginWith  5

#define WZFlashInnerCircleInitialRaius  20



@interface QF_Float()

@property(nonatomic, assign)float  controller;
@property(nonatomic, copy)NSString *  eee;

@property(nonatomic)NSInteger frameWidth;
@property(nonatomic)NSInteger frameHeigh;
@property(nonatomic)NSInteger contentWidth;

@property(nonatomic)BOOL  isShowTab;
@property(nonatomic,strong)UIPanGestureRecognizer *pan;
@property(nonatomic,strong)UITapGestureRecognizer *tap;
@property(nonatomic,strong)UIButton *QF_mainImageButton;
@property(nonatomic,strong)UIView *QF_contentView;
@property(nonatomic,copy)NSDictionary *QF_imagesAndTitle;
@property(nonatomic,strong)UIColor *bgcolor;
@property(nonatomic,strong)CAAnimationGroup *QF_animationGroup;
@property(nonatomic,strong)CAShapeLayer *QF_circleShape;
@property(nonatomic,strong)UIColor *QF_animationColor;

@property(nonatomic,strong) NSMutableArray *array;

@end
@implementation QF_Float

- (instancetype)QF_initMenu{
    

    
    
    return  [self initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 30, 50, 50, 50) mainImageName:@"mainButton" imagesAndTitle:@{@"float_gift1":@"用户注册",@"float_gift2":@"用户注册",@"float_gift3":@"用户注册"} bgcolor:[UIColor whiteColor] animationColor:nil];
}




// contentview 操作

- (void)QF_resetContentview_fff{
    
    _QF_contentView.frame = (CGRect){
        
        self.frameWidth + 0,0,_QF_contentView.frame.size.width,_QF_contentView.frame.size.height
        
    };
}
- (void)QF_showWindow_XJ
{
    self.hidden = false;
    
}

- (void)QF_dissmissWindow_XJ
{
     self.hidden = true;
    
}

- (void)QF_moveContentviewLeft_fff{
    
    _QF_contentView.frame = (CGRect){
        
        self.frameWidth/4, 0 ,_QF_contentView.frame.size.width,_QF_contentView.frame.size.height
        
    };
}


- (void)QF_setButtons_fff{
    
    NSMutableArray *array = [NSMutableArray array];


    self.array = array;
    
    NSDictionary *user = [QF_Tool QF_getUserInfo];
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:
                           user[@"id"],@"uid",
                           user[@"token"],@"token", nil];
    
    
    
    

    NSMutableDictionary *pp = [NSMutableDictionary dictionary];
    [pp setObject:@"用户" forKey:@"user_1"];
    NSMutableDictionary *pp1 = [NSMutableDictionary dictionary];
    [pp1 setObject:@"客服" forKey:@"server_2"];
    
    NSMutableDictionary *pp2 = [NSMutableDictionary dictionary];
    [pp2 setObject:@"礼包" forKey:@"gift_3"];

    
//    [array addObject:pp];
//    [array addObject:pp1];
//    [array addObject:pp2];


    
    NSString *url = [NSString stringWithFormat:@"%@/v1/api/config",GameTop];
    NSString *timeStr = [QF_Tool QF_getNowTimeTimestamp];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                timeStr,@"time",nil];
    NSDictionary *tempdic = @{@"params":dic};

    NSMutableDictionary *temp = [NSMutableDictionary dictionary];

    [QF_NewSDKNet QF_requestWithURLString:url parameters:tempdic type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            return ;
        }
        
        
        
        
        if ([responseObject[@"code"] intValue] == 0) {
  
            NSDictionary *data = responseObject[@"data"];
            guard(data!=nil) else{
                return;
            }

            NSArray *user_moniter_show = data[@"user_moniter_show"];
            
                     
            NSArray *array1 = user_moniter_show;
        for (NSDictionary *dict in array1) {
            
            NSString *title = dict[@"type"];
            [temp setObject:@"ss" forKey:title];
            
            if ([title isEqualToString:@"user_center"]) {
                
                
                NSMutableDictionary *pp = [NSMutableDictionary dictionary];
                [pp setObject:@"用户" forKey:@"user_1"];
                [array addObject:pp];
                

            }else if ([title isEqualToString:@"customer_service"])
            {

                NSMutableDictionary *pp1 = [NSMutableDictionary dictionary];
                [pp1 setObject:@"客服" forKey:@"server_2"];
                [array addObject:pp1];

            }else if ([title isEqualToString:@"official_accounts"])
            {
                NSMutableDictionary *pp2 = [NSMutableDictionary dictionary];
                [pp2 setObject:@"礼包" forKey:@"gift_3"];
                [array addObject:pp2];

            }

        }
            
         
            
        }else if ([responseObject[@"code"] intValue] != 0)
        {
            
            if ([responseObject[@"message"] isKindOfClass:[NSString class]] ) {
                [QF_Tool QF_alertView:responseObject[@"message"] withcompletion:nil];
                return;;
            }
            
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.QF_imagesAndTitle = temp;
            
            
//            self.QF_contentView.width =  array.count *self.frameWidth;
            [self setupUI:array];
        });

    } failure:^(NSError * _Nonnull error) {
        
    }];
    
    
    
    
    
  
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    int maxCols = MIN(self.array.count, 3);
    CGFloat buttonW = self.frameWidth;
      CGFloat buttonH = self.frameWidth;
    CGFloat KScreenW = 110;

    CGFloat buttonStartY = (KScreenW - 2 *buttonH) * 0.5;
     CGFloat buttonSrartX = 0;
        CGFloat xMargin = 0;
        CGFloat yMargin = 5;
    for (int i = 0; i <self.QF_contentView.subviews.count; i++) {
        int row =  i / maxCols;
        int col  = i % maxCols;
        CGFloat x = buttonSrartX + col * (xMargin + buttonW);
        CGFloat y =  buttonStartY + row * (buttonH + yMargin);
        UIButton *button = self.QF_contentView.subviews[i];
        
        [button setFrame: CGRectMake(x ,y, buttonW , buttonH )];

    }
    
//    for (NSInteger i = 0; i<array.count; i++) {
//        NSDictionary *dic = array[i];
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        int row =  i / maxCols;
//        int col  = i % maxCols;
//        CGFloat x = buttonSrartX + col * (xMargin + buttonW);
//        CGFloat y =  buttonStartY + row * (buttonH + yMargin);
//        [button setFrame: CGRectMake(x ,y, buttonW , buttonH )];
    
}


- (void)setupUI:(NSMutableArray *)array
{
      CGFloat buttonW = self.frameWidth;
        CGFloat buttonH = self.frameWidth;
        _frameHeigh = buttonW;
        CGFloat KScreenW = 110;
       CGFloat buttonStartY = (KScreenW - 2 *buttonH) * 0.5;
        CGFloat buttonSrartX = 0;
    int maxCols = MIN(array.count, 3);

        CGFloat xMargin = 0;
        CGFloat yMargin = 5;

        for (NSInteger i = 0; i<array.count; i++) {
            NSDictionary *dic = array[i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            int row =  i / maxCols;
            int col  = i % maxCols;
            CGFloat x = buttonSrartX + col * (xMargin + buttonW);
            CGFloat y =  buttonStartY + row * (buttonH + yMargin);
            [button setFrame: CGRectMake(x ,y, buttonW , buttonH )];
            [button setBackgroundColor:[UIColor clearColor]];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            UIImage *image = [QF_Tool QF_SetBundleImageName:[dic allKeys].firstObject bundleName:@"Bundle"];
    //        UIImage *image = [dic allKeys].firstObject;
            [button setTitle:[dic allValues].firstObject forState:UIControlStateNormal];
            
            [button setImage:image forState:UIControlStateNormal];
            button.tag = i;
            if (array.count - 1) {
                _frameHeigh = CGRectGetMaxY(button.frame);
                _contentWidth = (maxCols * buttonW)+ (xMargin*maxCols);
            }
            button.tintColor = [UIColor blackColor];
            CGSize imgViewSize,titleSize,btnSize;
            CGFloat heightSpace = 5.0f;
            imgViewSize = button.imageView.bounds.size;
            titleSize = button.titleLabel.bounds.size;
            btnSize = button.bounds.size;
            button.imageEdgeInsets = UIEdgeInsetsMake(heightSpace,0.0, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
            button.titleEdgeInsets = UIEdgeInsetsMake(imgViewSize.height +heightSpace , - imgViewSize.width, 0.0, 0.0);
            button.titleLabel.font = [UIFont systemFontOfSize: self.frameWidth/5];
            [button addTarget:self action:@selector(FFF_itemsClick_fff:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.QF_contentView addSubview:button];
        }
}


// 绘图操作
- (void)drawRect:(CGRect)rect {
    
    [self QF_drawDash_fff];
    
}


- (void)QF_drawDash_fff{
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.1);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGFloat lengths[] = {2,1};
    CGContextSetLineDash(context, 0, lengths,2);
    
    for (int i = 1; i < _QF_imagesAndTitle.count; i++){
        
        CGContextMoveToPoint(context, self.QF_contentView.frame.origin.x + i * self.frameWidth, marginWith * 2);
        CGContextAddLineToPoint(context, self.QF_contentView.frame.origin.x + i * self.frameWidth, self.frameWidth - marginWith * 2);
    }
    CGContextStrokePath(context);
}

- (void)dealloc
{
    
    
}

// animation
- (void)QF_buttonAnimation_fff{
    
    self.layer.masksToBounds = NO;
    
    CGFloat scale = 1.0f;
    CGFloat width = self.QF_mainImageButton.bounds.size.width, height = self.QF_mainImageButton.bounds.size.height;
    CGFloat biggerEdge = width > height ? width : height, smallerEdge = width > height ? height : width;
    CGFloat radius = smallerEdge / 2 > WZFlashInnerCircleInitialRaius ? WZFlashInnerCircleInitialRaius : smallerEdge / 2;
    scale = biggerEdge / radius + 0.5;
    
    _QF_circleShape = [self QF_createCircleShapeWithPosition_fff:CGPointMake(width/2, height/2)
                                              pathRect:CGRectMake(0, 0, radius * 2, radius * 2)
                                                radius:radius];
    
    [self.QF_mainImageButton.layer addSublayer:_QF_circleShape];
    
    CAAnimationGroup *groupAnimation = [self QF_createFlashAnimationWithScale_fff:scale duration:1.0f];
    
    [_QF_circleShape addAnimation:groupAnimation forKey:nil];
    
}


- (void)QF_stopAnimation_fff{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(QF_buttonAnimation_fff) object:nil];
    
    if (_QF_circleShape) {
        
        [_QF_circleShape removeFromSuperlayer];
        
    }
}


- (void)QF_locationChange_fff:(UIPanGestureRecognizer*)p
{
    self.isShowTab = FALSE;
    self.layer.masksToBounds = NO;
    _QF_contentView.alpha  = 0;
    if (self.frame.origin.x + self.QF_mainImageButton.frame.origin.x <= WWW_QYScreenW_www/2) {
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frameWidth ,self.frameWidth);
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frameWidth ,self.frameHeigh);

        
    }else{
        
        self.QF_mainImageButton.frame = CGRectMake(0, 0, self.frameWidth, self.frameWidth);
//        
//        self.frame = CGRectMake(self.frame.origin.x + _QF_imagesAndTitle.count * (self.frameWidth + marginWith), self.frame.origin.y, self.frameWidth ,self.frameWidth);
        
        
           self.frame = CGRectMake(self.frame.origin.x + _QF_imagesAndTitle.count * (self.frameWidth + marginWith), self.frame.origin.y, self.frameWidth ,self.frameWidth);
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    [self performSelector:@selector(QF_changeStatus_fff) withObject:nil afterDelay:statusChangeDuration];
    
    UIWindow *appWindow = [UIApplication sharedApplication].delegate.window;
    
    CGPoint panPoint = [p locationInView:appWindow];
    
    if(p.state == UIGestureRecognizerStateBegan)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(QF_changeStatus_fff) object:nil];
        _QF_mainImageButton.alpha = normalAlpha;
        
    }
    
    if(p.state == UIGestureRecognizerStateChanged){
        
        self.center = CGPointMake(panPoint.x, panPoint.y);
        
    }else if(p.state == UIGestureRecognizerStateEnded){
        
        [self QF_stopAnimation_fff];
        [self performSelector:@selector(QF_changeStatus_fff) withObject:nil afterDelay:statusChangeDuration];
        
        if(panPoint.x <= WWW_QYScreenW_www/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x >= 20+WIDTH/2)
                
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    
                    self.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }else if(panPoint.y >= WWW_QYScreenH_www-HEIGHT/2-40 && panPoint.x >= 20+WIDTH/2)
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(panPoint.x, WWW_QYScreenH_www-HEIGHT/2);
                }];
            }
            else if (panPoint.x < WIDTH/2+20 && panPoint.y > WWW_QYScreenH_www-HEIGHT/2)
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(WIDTH/2, WWW_QYScreenH_www-HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y < HEIGHT/2 ? HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(WIDTH/2, pointy);
                }];
            }
        }
        else if(panPoint.x > WWW_QYScreenW_www/2)
        {
            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x < WWW_QYScreenW_www-WIDTH/2-20 )
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(panPoint.x, HEIGHT/2);
                }];
            }
            else if(panPoint.y >= WWW_QYScreenH_www-40-HEIGHT/2 && panPoint.x < WWW_QYScreenW_www-WIDTH/2-20)
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(panPoint.x, WWW_QYScreenH_www-HEIGHT/2);
                }];
            }
            else if (panPoint.x > WWW_QYScreenW_www-WIDTH/2-20 && panPoint.y < HEIGHT/2)
            {
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(WWW_QYScreenW_www-WIDTH/2, HEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y > WWW_QYScreenH_www-HEIGHT/2 ? WWW_QYScreenH_www-HEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:animateDuration animations:^{
                    self.center = CGPointMake(WWW_QYScreenW_www-WIDTH/2, pointy);
                }];
            }
        }
    }
}


- (void)QF_click_fff:(UITapGestureRecognizer*)p
{
    [self QF_stopAnimation_fff];
    _QF_mainImageButton.alpha = normalAlpha;
    if (self.center.x == 0) {
        
        self.center = CGPointMake(WIDTH/2, self.center.y);
    }else if (self.center.x == WWW_QYScreenW_www) {
        
        self.center = CGPointMake(WWW_QYScreenW_www - WIDTH/2, self.center.y);
    }else if (self.center.y == 0) {
        
        self.center = CGPointMake(self.center.x, HEIGHT/2);
    }else if (self.center.y == WWW_QYScreenH_www) {
        
        self.center = CGPointMake(self.center.x, WWW_QYScreenH_www - HEIGHT/2);
    }
    if (!self.isShowTab) {
        
        self.isShowTab = TRUE;
        
        self.layer.masksToBounds = YES;
        
        for (UIView *view in self.QF_contentView.subviews) {
                                       view.hidden =false;
        }
        
        [UIView animateWithDuration:showDuration animations:^{
            
            self->_QF_contentView.alpha  = 1;
            
            if (self.frame.origin.x <= WWW_QYScreenW_www/2) {
                [self QF_resetContentview_fff];

            
                
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, WIDTH + self->_QF_imagesAndTitle.count * (self.frameWidth + marginWith) ,self.frameHeigh);
                
            }else{
                [self QF_moveContentviewLeft_fff];

                
                
                
                  self.QF_mainImageButton.frame = CGRectMake((self->_QF_imagesAndTitle.count * (self.frameWidth + marginWith)), 0, self.frameWidth, self.frameWidth);

                  self.frame = CGRectMake(self.frame.origin.x  - self->_QF_imagesAndTitle.count * (self.frameWidth + marginWith), self.frame.origin.y, (WIDTH + self->_QF_imagesAndTitle.count * (self.frameWidth + marginWith)) ,self.frameHeigh);
                

        
                
            }
            
            
            
            
            if (self->_bgcolor) {
                
                self.backgroundColor = self->_bgcolor;
            }else{
                
                self.backgroundColor = [UIColor grayColor];
            }
        }];
        
        CGRect rect1 = self.QF_contentView.frame;
        rect1.size.height = self.frameHeigh;
        rect1.size.width = self.contentWidth;
        self.QF_contentView.frame = rect1;
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(QF_changeStatus_fff) object:nil];
    }else{
        //关闭浮球
        self.isShowTab = FALSE;
        self.layer.masksToBounds = NO;
        
        for (UIView *view in self.QF_contentView.subviews) {
                        view.hidden =true;
            }
        
        [UIView animateWithDuration:showDuration animations:^{
            
            self->_QF_contentView.alpha  = 0;
            if (self.frame.origin.x + self.QF_mainImageButton.frame.origin.x <= WWW_QYScreenW_www/2) {
                
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frameWidth ,self.frameWidth);
                
                CGRect rect1 = self.QF_contentView.frame;
                rect1.size.height = self.frameWidth;
                rect1.size.width = self.frameWidth;
                
                self.QF_contentView.frame = rect1;
                
          
            }else{
                
                self.QF_mainImageButton.frame = CGRectMake(0, 0, self.frameWidth, self.frameWidth);
                
                self.frame = CGRectMake(self.frame.origin.x + self->_QF_imagesAndTitle.count * (self.frameWidth + marginWith), self.frame.origin.y, self.frameWidth ,self.frameWidth);
        
                CGRect rect1 = self.QF_contentView.frame;
                rect1.size.height = self.frameWidth;
                rect1.size.width = self.frameWidth;

                self.QF_contentView.frame = rect1;
                
            
                
        
            }
            
            self.backgroundColor = [UIColor clearColor];
        }];
        
        [self performSelector:@selector(QF_changeStatus_fff) withObject:nil afterDelay:statusChangeDuration];
        
    }
}



- (void)QF_changeStatus_fff
{
    [UIView animateWithDuration:1.0 animations:^{
        
        self->_QF_mainImageButton.alpha = sleepAlpha;
    }];
    [UIView animateWithDuration:0.5 animations:^{
        
        CGFloat x = self.center.x < 20+WIDTH/2 ? 0 :  self.center.x > WWW_QYScreenW_www - 20 -WIDTH/2 ? WWW_QYScreenW_www : self.center.x;
        CGFloat y = self.center.y < 40 + HEIGHT/2 ? 0 : self.center.y > WWW_QYScreenH_www - 40 - HEIGHT/2 ? WWW_QYScreenH_www : self.center.y;
        
        if((x == 0 && y ==0) || (x == WWW_QYScreenW_www && y == 0) || (x == 0 && y == WWW_QYScreenH_www) || (x == WWW_QYScreenW_www && y == WWW_QYScreenH_www)){
            
            y = self.center.y;
        }
        self.center = CGPointMake(x, y);
    }];
}


- (void)QF_doBorderWidth_fff:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    
    if (!color) {
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }else{
        
        self.layer.borderColor = color.CGColor;
    }
}



- (instancetype)initWithFrame:(CGRect)frame mainImageName:(NSString *)mainImageName imagesAndTitle:(NSDictionary*)imagesAndTitle bgcolor:(UIColor *)bgcolor animationColor:animationColor{
    
    if(self = [super initWithFrame:frame])
        
    {
        NSAssert(mainImageName != nil, @"mainImageName can't be nil !");
        NSAssert(imagesAndTitle != nil, @"OOO_imagesAndTitle_ooo can't be nil !");
        _isShowTab = FALSE;
        
        self.backgroundColor = [UIColor clearColor];

        _bgcolor = bgcolor;
        _frameWidth = frame.size.width;
        _QF_imagesAndTitle = imagesAndTitle;
        _QF_animationColor = animationColor;
        
        
        
      
        
        
        _QF_contentView = [[UIView alloc] initWithFrame:(CGRect){_frameWidth ,0,imagesAndTitle.count * (_frameWidth),_frameWidth}];
        _QF_contentView.alpha  = 0;
        [self addSubview:_QF_contentView];
        
        [self QF_setButtons_fff];
        CGRect rect1 = _QF_contentView.frame;
        rect1.size.height = _frameHeigh;
        _QF_contentView.frame = rect1;
        _QF_mainImageButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_QF_mainImageButton setFrame:(CGRect){0, 0,frame.size.width, frame.size.height}];
        
        [_QF_mainImageButton setImage:[QF_Tool QF_SetBundleImageName:mainImageName bundleName:nil] forState:UIControlStateNormal];
        _QF_mainImageButton.alpha = sleepAlpha;
        
        [_QF_mainImageButton addTarget:self action:@selector(QF_click_fff:) forControlEvents:UIControlEventTouchUpInside];
        
        if (_QF_animationColor) {
            
            [_QF_mainImageButton addTarget:self action:@selector(QF_mainBtnTouchDown_fff) forControlEvents:UIControlEventTouchDown];
        }
        
        [self addSubview:_QF_mainImageButton];
        
        [self QF_doBorderWidth_fff:myBorderWidth color:nil cornerRadius:_frameWidth/2];
        
        _pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(QF_locationChange_fff:)];
        _pan.delaysTouchesBegan = NO;
        
        [self addGestureRecognizer:_pan];
        
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(QF_click_fff:)];
        [self addGestureRecognizer:_tap];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(QF_orientChange_fff:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    }
    return self;
}



// 设备旋转
- (void)QF_orientChange_fff:(NSNotification *)notification{
    
    self.layer.masksToBounds = YES;

    if (self.frame.origin.x < self.frame.size.width) {
        self.frame = CGRectMake(WWW_QYScreenW_www - self.frame.size.width, WWW_QYScreenH_www - self.frame.origin.y - self.frame.size.height, self.frame.size.width,self.frame.size.height);
        
         if (self.frame.origin.x <0 ||self.frame.origin.y < 0)
         {
             self.frame = CGRectMake(0, 0 , self.frame.size.width,self.frame.size.height);

         }
        



    }
    else{
        
        self.frame = CGRectMake(0, WWW_QYScreenH_www - self.frame.origin.y - self.frame.size.height, self.frame.size.width,self.frame.size.height);
        
        if (self.frame.origin.x <0 ||self.frame.origin.y < 0)
        {
            self.frame = CGRectMake(0, 0 , self.frame.size.width,self.frame.size.height);


        }
//        self.frame = CGRectMake(0, WWW_QYScreenH_www - self.frame.origin.y - self.frame.size.height , 50,50);


    }
    self.QF_mainImageButton.frame = CGRectMake(0, 0, self.frameWidth, self.frameWidth);

    if (self.isShowTab) {
           
           [self QF_click_fff:nil];
       }
    
   
}


- (CAShapeLayer *)QF_createCircleShapeWithPosition_fff:(CGPoint)position pathRect:(CGRect)rect radius:(CGFloat)radius
{
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = [self QF_createCirclePathWithRadius_fff:rect radius:radius];
    circleShape.position = position;
    circleShape.bounds = CGRectMake(0, 0, radius * 2, radius * 2);
    circleShape.fillColor = _QF_animationColor.CGColor;
    circleShape.opacity = 0;
    circleShape.lineWidth = 1;
    return circleShape;
}



- (CAAnimationGroup *)QF_createFlashAnimationWithScale_fff:(CGFloat)scale duration:(CGFloat)duration
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1)];
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    _QF_animationGroup = [CAAnimationGroup animation];
    _QF_animationGroup.animations = @[scaleAnimation, alphaAnimation];
    _QF_animationGroup.duration = duration;
    _QF_animationGroup.repeatCount = INFINITY;
    _QF_animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    return _QF_animationGroup;
}



- (CGPathRef)QF_createCirclePathWithRadius_fff:(CGRect)frame radius:(CGFloat)radius
{
    return [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius].CGPath;
}

#if DEBUG
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(UIEventSubtypeMotionShake == motion) {
        //可以发送通知等
    }
}
# endif

// button事件
- (void)FFF_itemsClick_fff:(id)sender{
    
    if (self.isShowTab){
        
        [self QF_click_fff:nil];
    }
    
    
    
    UIButton *button = (UIButton *)sender;
    
    if (self.clickBolcks) {
        
        self.clickBolcks(button.tag,[button currentTitle],self);
    }
}



- (void)QF_mainBtnTouchDown_fff{
    
    if (!self.isShowTab) {
        
        [self performSelector:@selector(QF_buttonAnimation_fff) withObject:nil afterDelay:0.5];
    }
}

@end
