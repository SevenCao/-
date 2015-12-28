//
//  UIScrollView+Scale.m
//  SiderDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "UIScrollView+Scale.h"
#import <objc/runtime.h>
static NSString * const kScalView = @"kScallView";
#define Height 300
@implementation ScaleView

-(void)setScrollView:(UIScrollView *)scrollView{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    [self setNeedsLayout];

    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    if (_scrollView.contentOffset.y < 0 ) {
        
        CGFloat offset = _scrollView.contentOffset.y;
        self.frame = CGRectMake(offset, offset, CGRectGetWidth(_scrollView.frame) - offset * 2, Height- offset);
        
    }else{
    
        self.frame = CGRectMake(0  , 0, CGRectGetWidth(_scrollView.frame) , Height);

    }
    
    
}

-(void)dealloc{

    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    
}

- (void)removeFromSuperview{

    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];


}

@end


@implementation UIScrollView (Scale)
// 添加可拉伸图片
- (void)addScaleImageViewWithImage:(UIImage *)image{
    
    ScaleView * scaleView = [[ScaleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), Height)];
    scaleView.image = image;
    [self addSubview:scaleView];
    [self sendSubviewToBack:scaleView];
    self.scaleView = scaleView;
    scaleView.scrollView = self;
}

-(void)removeScaleImageView{
    [self.scaleView removeFromSuperview];
    self.scaleView = nil;

}

- (void)setScaleView:(ScaleView *)ScaleView{

        //用运行时给UIScrollView绑定属性
    objc_setAssociatedObject(self, &kScalView, ScaleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (ScaleView * )ScaleView{

    return objc_getAssociatedObject(self, &kScalView);

}
@end
