//
//  MeViewController.m
//  ximalaya
//
//  Created by luhongyu on 15/12/26.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *HeaderImage;

@end

@implementation MeViewController

-(void)awakeFromNib{
    [self.tableView addScaleImageViewWithImage:[UIImage imageNamed:@"me"]];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)createUI{
//
//    UITableView *  tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
//    [self.view addSubview:tableview];
//    tableview.delegate = self;
//    tableview.dataSource = self;
//}
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//    return 3;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//
//    switch (section) {
//        case 0:
//            return 1;
//            break;
//        case 1:
//            return 2;
//            case 2:
//            return 3;
//        default:
//            return 0;
//            break;
//    }
//
//}
//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    
//    
//
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
