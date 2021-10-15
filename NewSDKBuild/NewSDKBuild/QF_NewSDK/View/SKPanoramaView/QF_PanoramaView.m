//
//  SKPanoramaView.m
//  SKPanoramaView
//
//  Created by Sachin Kesiraju on 1/5/15.
//  Copyright (c) 2015 Sachin Kesiraju. All rights reserved.
//

#import "QF_PanoramaView.h"

static const CGFloat SKAnimationUpdateInterval = 1 / 100;
static const CGFloat SKPanoramaRotationFactor = 1.0f;

@interface QF_PanoramaView ()

typedef NS_ENUM(NSInteger, GradientType)
{
    GradientFromTopToBottom = 0,
    GradientFromLeftToRight,
    GradientFromLeftTopToRightBottom,
    GradientFromLeftBottomToRightTop
};


@property (nonatomic, assign) CGRect QF_viewFrame;

@property (nonatomic, strong) UIScrollView *QF_SscrollView;

@property (nonatomic, assign) CGFloat QF_SmotionRate;
@property (nonatomic, assign) NSInteger QF_SQminimumXOffset;
@property (nonatomic, assign) NSInteger QF_FWmaximumXOffset;

@property (nonatomic, strong) NSTimer *QF_SFQtimer;

@end

@implementation QF_PanoramaView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _QF_viewFrame = CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    self = [self initWithFrame:frame];
    if (self) {
        [self createPanoramaWithImage:image];
    }
    return self;
}


- (UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect = CGRectMake(0.0f,0.0f,600,400.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}


- (UIImage *)gradientImageWithColors:(NSArray *)colors rect:(CGRect)rect
{
    if (!colors.count || CGRectEqualToRect(rect, CGRectZero)) {
        return nil;
    }

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    gradientLayer.frame = rect;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    NSMutableArray *mutColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = [NSArray arrayWithArray:mutColors];

    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.opaque, 0);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}



- (void)createPanoramaWithImage:(UIImage *)image
{
    _QF_image = image;
    if (_QF_image == nil) {
        _QF_image = [self gradientImageWithColors:@[[UIColor magentaColor],[UIColor blueColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor blackColor],[UIColor purpleColor]] rect:CGRectMake(0, 0, 900, 400)];
    }
    
    //Initialize scroll view and add to view
    _QF_SscrollView = [[UIScrollView alloc] initWithFrame:_QF_viewFrame];
    [_QF_SscrollView setUserInteractionEnabled:NO];
    [_QF_SscrollView setBounces:NO];
    [_QF_SscrollView setContentSize:CGSizeZero];
    [self addSubview:_QF_SscrollView];
    
    //Initialize image view and add to scroll view
    CGFloat width = _QF_viewFrame.size.height / _QF_image.size.height * _QF_image.size.width;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, _QF_viewFrame.size.height)];
    [imageView setBackgroundColor:[UIColor blackColor]];
    [imageView setImage:_QF_image];
    [_QF_SscrollView addSubview:imageView];
    
    _QF_SscrollView.contentSize = CGSizeMake(imageView.frame.size.width, _QF_SscrollView.frame.size.height);
    _QF_SmotionRate = _QF_image.size.width / _QF_viewFrame.size.width * SKPanoramaRotationFactor;
}

#pragma mark - Animation

- (void)QF_startAnimating
{
    if(!_QF_animationSpeed) {
        _QF_animationSpeed = 10.0f; //Default: 10 seconds for each full panorama transition
    }
    
    //adjust initial offset based on start position
    if(_startPosition == SKPanoramaStartPositionRight) {
        _QF_SscrollView.contentOffset = CGPointMake((_QF_SscrollView.contentSize.width - _QF_SscrollView.frame.size.width), 0);
    }
    else if(_startPosition == SKPanoramaStartPositionLeft) {
        _QF_SscrollView.contentOffset = CGPointMake(0, 0);
    }
    
    _QF_SQminimumXOffset = 0;
    _QF_FWmaximumXOffset = _QF_SscrollView.contentSize.width - _QF_SscrollView.frame.size.width;
    _QF_SFQtimer = [NSTimer timerWithTimeInterval:SKAnimationUpdateInterval target:self selector:@selector(transition) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_QF_SFQtimer forMode:NSRunLoopCommonModes];
}

- (void) transition
{
    CGFloat rotationRate = 0.3;
    CGFloat offsetX = _QF_SscrollView.contentOffset.x;
    if(_startPosition == SKPanoramaStartPositionRight) {
        offsetX -= rotationRate * _QF_SmotionRate;
    }
    else if(_startPosition == SKPanoramaStartPositionLeft) {
       offsetX += rotationRate * _QF_SmotionRate;
    }
    
    if (offsetX > _QF_FWmaximumXOffset) {
        offsetX = _QF_FWmaximumXOffset;
    } else if (offsetX < _QF_SQminimumXOffset) {
        offsetX = _QF_SQminimumXOffset;
    }
    
    [UIView animateWithDuration:self.QF_animationSpeed
                          delay:0.0f
                        options:UIViewAnimationOptionRepeat| UIViewAnimationOptionAutoreverse| UIViewAnimationCurveEaseInOut
                     animations:^{
                         [self.QF_SscrollView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
                     }
                     completion:nil];
}

- (void) QF_stopAnimating
{
    [_QF_SFQtimer invalidate];
}

@end
