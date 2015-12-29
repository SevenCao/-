//
//  WeiboTabBar.h
//  CD1505Weibo
//
//  Created by luhongyu on 15/12/29.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBTabBarDelegate <NSObject>

- (void)passIndex:(NSInteger )index;

@end
typedef void(^passIndex)(NSInteger index);
@interface WeiboTabBar : UITabBar

@property (nonatomic,strong)UITabBarItem * tabBarItem;
@property (nonatomic,assign)id <WBTabBarDelegate> WBdelegate;
@property (nonatomic,copy)passIndex passIndex;
@end
