//
//  ParallaxCell.h
//  ParallaDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxCell : UITableViewCell
@property (nonatomic,copy)NSString  * imageName;
-(void)scrollImageInTableView:(UITableView *)tableView inView:(UIView *)view;
@end
