//
//  SKPanoramaView.h
//  SKPanoramaView
//
//  Created by Sachin Kesiraju on 1/5/15.
//  Copyright (c) 2015 Sachin Kesiraju. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SKPanoramaStartPosition)
{
    SKPanoramaStartPositionLeft = 0,
    SKPanoramaStartPositionRight
};



@interface QF_PanoramaView : UIView
@property (nonatomic, strong) UIImage *QF_image; //Image in the panorama view
@property (nonatomic) CGFloat QF_animationSpeed; //Duration of one image animation (greater is longer; default:10s)
@property (nonatomic, assign) SKPanoramaStartPosition startPosition; //Side from which panorama animation starts from (either right or left side of the image; default:start from left)

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
- (void)QF_startAnimating;
- (void)QF_stopAnimating;

@end
