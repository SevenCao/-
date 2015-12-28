//
//  ParallaxCell.m
//  ParallaDemo
//
//  Created by luhongyu on 15/12/28.
//  Copyright © 2015年 cjl. All rights reserved.
//

#import "ParallaxCell.h"

@interface ParallaxCell()
@property (weak, nonatomic) IBOutlet UIImageView *parallaxImageView;

@end
@implementation ParallaxCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setImageName:(NSString *)imageName{

    self.parallaxImageView.image = [UIImage imageNamed:imageName];

}
-(void)scrollImageInTableView:(UITableView *)tableView inView:(UIView *)view{

    CGRect inSuperViewRect = [tableView convertRect:self.frame toView:view];
    //获取当前cell的起始y离vc.view的中线距离
    CGFloat disFromCenterY = CGRectGetMidY(view.frame) - CGRectGetHeight(inSuperViewRect);
    //获取imageView的高度和cell的高度的差值
    CGFloat diff = CGRectGetHeight(self.parallaxImageView.frame) - CGRectGetHeight(self.frame);
    //获取移动速度
    CGFloat moveDis = disFromCenterY / CGRectGetHeight(view.frame) * diff ;
    //让图片的frame移动距离 --movedis
    CGRect scrollRect = self.parallaxImageView.frame;
    scrollRect.origin.y = - (diff / 2.0) + moveDis;
    self.parallaxImageView.frame = scrollRect;
    
}

@end
