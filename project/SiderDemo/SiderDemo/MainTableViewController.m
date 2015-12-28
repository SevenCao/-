//
//  MainTableViewController.m
//  SiderDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "MainTableViewController.h"
#import <RESideMenu.h>
@interface MainTableViewController ()
- (IBAction)ShowLeft:(UIBarButtonItem *)sender;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)ShowLeft:(UIBarButtonItem *)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}
@end
