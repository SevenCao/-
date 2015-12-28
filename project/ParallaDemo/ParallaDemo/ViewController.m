//
//  ViewController.m
//  ParallaDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray * imaNameArr;
@end

@implementation ViewController
//懒加载
-(NSMutableArray *)imaNameArr{

    if (_imaNameArr == nil) {
        _imaNameArr = @[].mutableCopy;
        for (int i = 0; i < 14; i++) {
            NSString *  imageName = [NSString stringWithFormat:@"image%03d.jpg",i];
            [_imaNameArr addObject:imageName];
        }
    }
    return _imaNameArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Delegate & DataSources

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.imaNameArr.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ParallaxCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ParallaxCell"];
    cell.imageName = _imaNameArr[indexPath.row];
    
    return cell;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    //取出显示在tableView的所有Cell
    NSArray * cells = [self.tableView visibleCells];
    //循环所有的可视cell
    for (ParallaxCell * cell in cells) {
        [cell scrollImageInTableView:self.tableView inView:self.view];
    }
}

@end
