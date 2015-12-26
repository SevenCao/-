//
//  TabBarViewController.m
//  ximalaya
//
//  Created by luhongyu on 15/12/26.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTabBarItem];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatTabBarItem{

    //设置UITabBar背景图片
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbae_bg"]];
   
    

//    设置视图控制器 和 item背景
//  发现页面
    UINavigationController * DiscoverNavi = [[UINavigationController alloc]initWithRootViewController:[[DiscoverViewController alloc]init]];
    DiscoverNavi.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tabbar_find_n"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_find_h"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    定制听页面
    CustomListenViewController * customListenVC  = [[CustomListenViewController alloc]init];
    customListenVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tabbar_sound_n"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_sound_h"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    下载听页面
    DownloadViewController * downloadVC = [[DownloadViewController alloc]init];
    downloadVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tabbar_download_n"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_download_h"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    我的页面
    MeViewController * meVC = [[MeViewController alloc]init];
    meVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"tabbar_me_n"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_me_h"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    self.viewControllers = @[DiscoverNavi,customListenVC,downloadVC,meVC];

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
