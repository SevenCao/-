//
//  UIScrollView+Scale.h
//  SiderDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScaleView : UIImageView
@property (nonatomic,weak)UIScrollView * scrollView;

@end

@interface UIScrollView (Scale)

@property (nonatomic,weak)ScaleView * scaleView;

- (void)addScaleImageViewWithImage:(UIImage *)image;

- (void)removeScaleImageView;





@end
