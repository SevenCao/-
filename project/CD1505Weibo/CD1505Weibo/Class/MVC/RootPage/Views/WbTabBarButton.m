//
//  WbTabBarButton.m
//  CD1505Weibo
//
//  Created by luhongyu on 15/12/29.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "WbTabBarButton.h"

@implementation WbTabBarButton

-(void)setRatio:(CGFloat)ratio{
    if (ratio <= 0 || ratio > 1) {
        NSException * expre  = [NSException exceptionWithName:@"异常提示" reason:@"参数范围不在0到1之间" userInfo:nil];
        @throw expre;
    }else
    {
        _ratio = ratio;
        
    }
    

}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ratio = 0.6;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return self;
}

/**
 *  生成按钮内部图片的位置
 */

-(CGRect)imageRectForContentRect:(CGRect)contentRect{


    CGFloat  imgX = 0;
    CGFloat  imgY = 0;
    CGFloat  imgW = CGRectGetWidth(contentRect);
    CGFloat  imgH = CGRectGetHeight(contentRect) * _ratio;

    CGRect rect = CGRectMake(imgX, imgY, imgW, imgH);
    return rect;

}


/**
 *  生成按钮内部titlelabel的位置
 */
-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    
    CGFloat titleX = 0;
    CGFloat titleY  = CGRectGetHeight(contentRect) * _ratio;
    CGFloat titleW = CGRectGetWidth(contentRect);
    CGFloat titleH = CGRectGetHeight(contentRect) * (1 - _ratio );
    return CGRectMake(titleX, titleY, titleW, titleH);

}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{


    [self setTitle:tabBarItem.title forState:UIControlStateNormal];
    [self setImage:tabBarItem.image forState:UIControlStateNormal];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];

}

/**
 *  拦截高亮状态响应
 */
-(void)setHighlighted:(BOOL)highlighted{

}
@end
