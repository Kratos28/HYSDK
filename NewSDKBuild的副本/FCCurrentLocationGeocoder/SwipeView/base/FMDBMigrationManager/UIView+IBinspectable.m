
#import <UIKit/UIKit.h>

@interface IndexHvoptionsinfoAtHilightedindex : NSObject<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UINavigationBarDelegate>
@property (nonatomic,retain) UITabBar* tabEndGetmicfromroom;
@property (atomic,retain) UIColor* colorAnimateCanlogin;
@property (atomic,strong) UIImage* imgTouchItemobj;
@property (nonatomic,strong) UIImage* imgAfterCurrentcells;
@property (nonatomic,strong) NSArray* arrayTransSusarray;
@property (nonatomic,weak) NSSet* setClickPar;
@property (nonatomic,strong) NSObject* objEndIron;

- (UISlider*)animateGiftversionAccordingToLayoutstack:(int)param0;
- (void)viewTotalnumUnderRoomid;
@end

@implementation IndexHvoptionsinfoAtHilightedindex

- (UISlider*)animateGiftversionAccordingToLayoutstack:(int)param0
{

	NSObject *objFlipSessionid = [[NSObject alloc] init];
	UISlider *sliderResDisplaytype = [[UISlider alloc] init];
	UIImage *imgReloadCollar = nil;
                                      	NSData *dataPopNextshowseq = UIImageJPEGRepresentation(imgReloadCollar, 0.19);
                                      	UIImage *resultImgReadMicinfomodel = [UIImage imageWithData:dataPopNextshowseq];

	while (dataPopNextshowseq.length > resultImgReadMicinfomodel.size.height) {
	}
	NSDictionary *dictComponentPic_Url = [[NSDictionary alloc] init];
	[dictComponentPic_Url description];
	[imgReloadCollar description];
	[sliderResDisplaytype description];
	return sliderResDisplaytype;
}

- (void)viewTotalnumUnderRoomid
{

	NSSet *setModelSapphire = [[NSSet alloc] init];
	UISwitch *swtchServerIsitalic = [[UISwitch alloc] init];
	UIColor *colorModelAnimationtime = [UIColor redColor];
	
	UITableView *tableViewStartYksvstyleweekofmonth = [[UITableView alloc] init];
	NSDictionary *dictReloadVisibly = [[NSDictionary alloc] init];
	UIColor *colorResMap = [UIColor redColor];
	
	[tableViewStartYksvstyleweekofmonth addSubview:swtchServerIsitalic];
	[swtchServerIsitalic removeFromSuperview];
	[colorResMap description];
	[dictReloadVisibly description];
	[tableViewStartYksvstyleweekofmonth description];
	[colorModelAnimationtime description];
}

@end
//
//  UIView+QF_NewSDKViewIBInspectable.m
//  11QF_NewSDK
//
//  Created by K on 2020/3/10.
//  Copyright © 2020 sowofw. All rights reserved.
//

#import "UIView+IBinspectable.h"



@implementation UIView (IBinspectable)
-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}
-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
-(void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}
- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}
- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}




- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType
{
   
    [self.layer .sublayers enumerateObjectsUsingBlock:^(__kindof CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.accessibilityLabel isEqualToString:@"shapeLayer"]) {
            [obj removeFromSuperlayer];
        }
    }];
    
    
 if (borderType == UIBorderSideTypeAll) {
  self.layer.borderWidth = borderWidth;
  self.layer.borderColor = color.CGColor;
  return self;
 }
   
   
 /// 左侧
 if (borderType & UIBorderSideTypeLeft) {
  /// 左侧线路径
  [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
 }
   
 /// 右侧
 if (borderType & UIBorderSideTypeRight) {
  /// 右侧线路径
  [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
 }
   
 /// top
 if (borderType & UIBorderSideTypeTop) {
  /// top线路径
  [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
 }
   
 /// bottom
 if (borderType & UIBorderSideTypeBottom) {
  /// bottom线路径
  [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
 }
   
 return self;
}
  
- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
  
 /// 线的路径
 UIBezierPath * bezierPath = [UIBezierPath bezierPath];
 [bezierPath moveToPoint:p0];
 [bezierPath addLineToPoint:p1];
   
 CAShapeLayer * shapeLayer = [CAShapeLayer layer];
 shapeLayer.strokeColor = color.CGColor;
    shapeLayer.accessibilityLabel = @"shapeLayer";
 shapeLayer.fillColor = [UIColor clearColor].CGColor;
 /// 添加路径
 shapeLayer.path = bezierPath.CGPath;
 /// 线宽度
 shapeLayer.lineWidth = borderWidth;
 return shapeLayer;
}


@end

