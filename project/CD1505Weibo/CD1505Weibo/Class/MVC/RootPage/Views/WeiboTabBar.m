//
//  WeiboTabBar.m
//  CD1505Weibo
//
//  Created by luhongyu on 15/12/29.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "WeiboTabBar.h"
#import "WbTabBarButton.h"



@interface WeiboTabBar(){

    WbTabBarButton * _seletedBtn;//当前选中按钮

}

@property (nonatomic,strong)NSMutableArray * buttonArr;
@property (nonatomic,strong)UIButton * plusBtn;
@end

@implementation WeiboTabBar


-(NSMutableArray *)buttonArr{


    if (_buttonArr == nil) {
        _buttonArr = @[].mutableCopy;
    }
    return _buttonArr;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建一个按钮
        UIButton * plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:plusBtn];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        _plusBtn = plusBtn;
    }
    return self;
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem{

        
    NSLog(@"%@",tabBarItem.title);
    WbTabBarButton * button = [WbTabBarButton buttonWithType:UIButtonTypeCustom];
    button.tabBarItem = tabBarItem;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.buttonArr addObject:button];
    if ([tabBarItem.title isEqualToString:@"首页"]) {
        [self buttonPressed:button];
    }
    
    
}


-(void)layoutSubviews{

    [super layoutSubviews];
    CGFloat btnW = CGRectGetWidth(self.frame)/(CGFloat)(self.buttonArr.count + 1);
    CGFloat plusW = self.plusBtn.currentBackgroundImage.size.width;
    CGFloat plusH = self.plusBtn.currentBackgroundImage.size.height;
    _plusBtn.frame = CGRectMake(0, 0, plusW, plusH);
    _plusBtn.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);
    
    for (int i = 0; i < self.buttonArr.count; i++) {
     
        WbTabBarButton * button = self.buttonArr[i];
     
        CGFloat bX = btnW * i;
        if (i > 1 ) {
            bX += btnW;
        }
        CGFloat bY = 0;
        CGFloat bW = btnW;
        CGFloat bH = CGRectGetHeight(self.frame);
        button.frame = CGRectMake(bX, bY, bW, bH);
    }
    
}

#pragma mark - 按钮点击

- (void)buttonPressed:(WbTabBarButton *)sender{

//    sender.selected = !sender.selected;
    _seletedBtn.selected = NO;
    sender.selected = YES;
    _seletedBtn = sender;
    NSInteger index = [self.buttonArr indexOfObject:sender];
//    if ([_WBdelegate respondsToSelector:@selector(passIndex:)]) {
//        [_WBdelegate passIndex:index];
//    }
    if (_passIndex) {
        _passIndex(index);
    }
    
}

@end
