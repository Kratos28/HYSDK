
#import <UIKit/UIKit.h>

@interface EditHascaptureaudioUnderStreaminfomodel : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (nonatomic,assign) int iCallNoblelevel;
@property (nonatomic,assign) double doubleResetBox;
@property (atomic,weak) UIImage* imgContentsArosetinjusk;
@property (nonatomic,retain) UIStepper* stepClickElementid;
@property (atomic,strong) NSDictionary* dictPressSapphire;
@property (nonatomic,retain) UIImage* imgIndexYksstyleheaderhidden;
@property (nonatomic,retain) UIColor* colorResCustomtoolbarrefreshbutton;
@property (atomic,copy) NSString* strResAncientdagger;
@property (atomic,retain) NSObject* objRestfulYkfstylereplytoolprovider;

@end

@implementation EditHascaptureaudioUnderStreaminfomodel

@end
//
//  SKPanoramaView.m
//  SKPanoramaView
//
//  Created by Sachin Kesiraju on 1/5/15.
//  Copyright (c) 2015 Sachin Kesiraju. All rights reserved.
//

#import "KLMGRoomVoteKillCell.h"

static const CGFloat SKAnimationUpdateInterval = 1 / 100;
static const CGFloat SKPanoramaRotationFactor = 1.0f;

@interface KLMGRoomVoteKillCell ()

typedef NS_ENUM(NSInteger, GradientType)
{
    GradientFromTopToBottom = 0,
    GradientFromLeftToRight,
    GradientFromLeftTopToRightBottom,
    GradientFromLeftBottomToRightTop
};


@property (nonatomic, assign) CGRect KLcheckBoxBlock;

@property (nonatomic, strong) UIScrollView *KLserialNO;

@property (nonatomic, assign) CGFloat KLtrayBackgroundView;
@property (nonatomic, assign) NSInteger KLcurrentFeedId;
@property (nonatomic, assign) NSInteger KLlocalView;

@property (nonatomic, copy) NSString *backGroundView;
@property (nonatomic, strong) NSTimer *KLJPPageUrl;

@end

@implementation KLMGRoomVoteKillCell

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _KLcheckBoxBlock = CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame));
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
    _KLactivityStylehour = image;
    if (_KLactivityStylehour == nil) {
        _KLactivityStylehour = [self gradientImageWithColors:@[[UIColor magentaColor],[UIColor blueColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor orangeColor],[UIColor blackColor],[UIColor purpleColor]] rect:CGRectMake(0, 0, 900, 400)];
    }
    
    //Initialize scroll view and add to view
    _KLserialNO = [[UIScrollView alloc] initWithFrame:_KLcheckBoxBlock];
    [_KLserialNO setUserInteractionEnabled:NO];
    [_KLserialNO setBounces:NO];
    [_KLserialNO setContentSize:CGSizeZero];
    [self addSubview:_KLserialNO];
    
    //Initialize image view and add to scroll view
    CGFloat width = _KLcheckBoxBlock.size.height / _KLactivityStylehour.size.height * _KLactivityStylehour.size.width;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, _KLcheckBoxBlock.size.height)];
    [imageView setBackgroundColor:[UIColor blackColor]];
    [imageView setImage:_KLactivityStylehour];
    [_KLserialNO addSubview:imageView];
    
    _KLserialNO.contentSize = CGSizeMake(imageView.frame.size.width, _KLserialNO.frame.size.height);
    _KLtrayBackgroundView = _KLactivityStylehour.size.width / _KLcheckBoxBlock.size.width * SKPanoramaRotationFactor;
}

#pragma mark - Animation

- (void)SpotSPMClick
{
    if(!_KLtopicEntranceView) {
        _KLtopicEntranceView = 10.0f; //Default: 10 seconds for each full panorama transition
    }
    
    //adjust initial offset based on start position
    if(_startPosition == SKPanoramaStartPositionRight) {
        _KLserialNO.contentOffset = CGPointMake((_KLserialNO.contentSize.width - _KLserialNO.frame.size.width), 0);
    }
    else if(_startPosition == SKPanoramaStartPositionLeft) {
        _KLserialNO.contentOffset = CGPointMake(0, 0);
    }
    
    _KLcurrentFeedId = 0;
    _KLlocalView = _KLserialNO.contentSize.width - _KLserialNO.frame.size.width;
    _KLJPPageUrl = [NSTimer timerWithTimeInterval:SKAnimationUpdateInterval target:self selector:@selector(transition) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_KLJPPageUrl forMode:NSRunLoopCommonModes];
}

- (void) transition
{
    CGFloat rotationRate = 0.3;
    CGFloat offsetX = _KLserialNO.contentOffset.x;
    if(_startPosition == SKPanoramaStartPositionRight) {
        offsetX -= rotationRate * _KLtrayBackgroundView;
    }
    else if(_startPosition == SKPanoramaStartPositionLeft) {
       offsetX += rotationRate * _KLtrayBackgroundView;
    }
    
    if (offsetX > _KLlocalView) {
        offsetX = _KLlocalView;
    } else if (offsetX < _KLcurrentFeedId) {
        offsetX = _KLcurrentFeedId;
    }
    
    [UIView animateWithDuration:self.KLtopicEntranceView
                          delay:0.0f
                        options:UIViewAnimationOptionRepeat| UIViewAnimationOptionAutoreverse| UIViewAnimationCurveEaseInOut
                     animations:^{
                         [self.KLserialNO setContentOffset:CGPointMake(offsetX, 0) animated:NO];
                     }
                     completion:nil];
}

- (void) scrollRectToTimeRecord
{
    [_KLJPPageUrl invalidate];
}


@end

