//
//  RootViewController.m
//  SiderDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "RootViewController.h"
#import "LeftMenuController.h"
#import "MainTableViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController
-(void)awakeFromNib{
    UIStoryboard * mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LeftMenuController * leftVC = [mainSb instantiateViewControllerWithIdentifier:@"LeftMenuController"];
 //MainTableViewController * mainVC = [mainSb instantiateViewControllerWithIdentifier:@"MainTableViewController"];
    self.leftMenuViewController = leftVC;
    UINavigationController * navi = [mainSb instantiateViewControllerWithIdentifier:@"NavigationVC"];
    self.contentViewController =  navi;
//    self.contentViewController =  mainVC;
    self.scaleContentView = NO;
    self.scaleMenuView = NO;
    self.contentViewInPortraitOffsetCenterX = 50;
    self.contentViewShadowEnabled = YES;
    self.contentViewShadowOffset = CGSizeMake(-50, 0);
    self.contentViewShadowColor = [UIColor grayColor ];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
