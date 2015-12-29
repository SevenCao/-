//
//  WbTabBarButton.h
//  CD1505Weibo
//
//  Created by luhongyu on 15/12/29.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WbTabBarButton : UIButton
/**
 *  是图片占整个高度的比例0~1 缺省值0.6
 */
@property(nonatomic,assign)CGFloat ratio;


@property(nonatomic,strong)UITabBarItem * tabBarItem;
@end
