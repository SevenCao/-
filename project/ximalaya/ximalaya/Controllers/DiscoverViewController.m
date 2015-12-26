//
//  DiscoverViewController.m
//  ximalaya
//
//  Created by luhongyu on 15/12/26.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "DiscoverViewController.h"
#define BUTTON_TAG 10
#define TABLEVIEW_TAG 20
@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{

    UIScrollView * _scrollView;
    UIView * _slideView;
    UIButton * _selectedButton;
}

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 创建tableview scrollerview
- (void)creatUI{

    NSArray * titleArr = @[@"推荐",@"分类",@"直播",@"榜单",@"主播"];
    //创建题目栏
    UIView * titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenSize.width, 25)];
    [self.view addSubview:titleView];
    titleView .backgroundColor = [UIColor whiteColor];
    
    //创建_scrollView
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), ScreenSize.width, ScreenSize.height - CGRectGetMaxY(titleView.frame))];
    [self.view  addSubview:_scrollView];
    
    for (int index = 0; index < titleArr.count; index ++) {
        //创建title
        
        UIButton * button = [[UIButton  alloc]initWithFrame:CGRectMake(index * ScreenSize.width / 5.0 , 0, ScreenSize.width/5.0, 20)];
        [titleView addSubview:button];
        if (index == 0) {
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            _selectedButton = button;
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        [button setTitle:titleArr[index] forState:UIControlStateNormal];
        button.tag = index + BUTTON_TAG;
        
        
        //创建tableView
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(index * ScreenSize.width, 0, ScreenSize.width, ScreenSize.height - 64 - CGRectGetHeight(titleView.frame))];
        [_scrollView addSubview:tableView];
        tableView.delegate  = self;
        tableView.dataSource   = self;
        tableView.tag = index + TABLEVIEW_TAG;
        
    }
    //下滑条
    _slideView = [[UIView alloc]initWithFrame:CGRectMake(20, 22, ScreenSize.width/5.0 - 40, 3)];
    [titleView addSubview:_slideView];
    _slideView.backgroundColor = [UIColor orangeColor];
    //_scrollView
    _scrollView.contentSize = CGSizeMake(ScreenSize.width * titleArr.count, ScreenSize.height - 64 - CGRectGetMaxY(titleView.frame));
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
}


#pragma mark - tableViewData

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 0;}






#pragma mark - scrollView

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    if (scrollView == _scrollView) {
        [_selectedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _selectedButton.titleLabel.font = [UIFont systemFontOfSize:13];
        NSInteger index =    scrollView.contentOffset.x/ScreenSize.width;
        UIButton * button = [self.view viewWithTag:index + BUTTON_TAG];
        [UIView  animateWithDuration:0.6 animations:^{
            _slideView.frame = CGRectMake(index * ScreenSize.width/5.0 + 20, 22, ScreenSize.width / 5.0 - 40, 3);
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            _selectedButton = button;
            
        }];
    }

    



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
