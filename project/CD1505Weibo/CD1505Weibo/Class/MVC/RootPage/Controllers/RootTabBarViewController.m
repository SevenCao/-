//
//  RootTabBarViewController.m
//  CD1505Weibo
//
//  Created by luhongyu on 15/12/29.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "MessageTableViewController.h"
#import "MeTableViewController.h"
#import "DiscoverTableViewController.h"
#import "HomeTableViewController.h"
#import "WeiboTabBar.h"

@interface RootTabBarViewController ()<WBTabBarDelegate>
@property (nonatomic,strong)WeiboTabBar * wbTabBar;
@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self addCustomTabBar];
    
    [self addViewControllers];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addCustomTabBar{
    self.tabBar.hidden = YES;
    self.wbTabBar = [[WeiboTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT- 49, SCREEN_WIDTH, 49)];
    [self.view addSubview:self.wbTabBar];
    self.wbTabBar.backgroundColor = [UIColor redColor];
    //self.wbTabBar.WBdelegate =self;
    __weak typeof (self) weakself = self;
    self.wbTabBar.passIndex = ^(NSInteger index){
    
        
        weakself.selectedIndex = index;
        
    
    };
    
}

- (void)addViewControllers{

    NSArray * vcNameArray = @[@"HomeTableViewController",@"MessageTableViewController",@"DiscoverTableViewController",@"MeTableViewController"];
    NSArray * vcTitle = @[@"首页",@"消息",@"发现",@"我"];
    NSArray * norImageArray = @[@"tabbar_home",@"tabbar_message_center",@"tabbar_discover",@"tabbar_profile"];
     NSArray * hlImageArray = @[@"tabbar_home_highlighted",@"tabbar_message_center_highlighted",@"tabbar_discover_highlighted",@"tabbar_profile_highlighted"];
     NSArray * selImageArray = @[@"tabbar_home_selected",@"tabbar_message_center_selected",@"tabbar_discover_selected",@"tabbar_profile_selected"];
    for (NSString * vcName in vcNameArray) {
        Class vcClass = NSClassFromString(vcName);
        NSInteger index = [vcNameArray indexOfObject:vcName];
        UITableViewController * vc = [[vcClass alloc]init];
        vc.title = vcTitle[index];
        [vc.tabBarItem setImage:[[UIImage imageNamed:norImageArray[index]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selImageArray[index]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
        UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:navi];
        self.wbTabBar.tabBarItem = vc.tabBarItem;
        
        
    }


}

#pragma mark - WBdelegate

- (void)passIndex:(NSInteger)index{

    self.selectedIndex = index;

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
