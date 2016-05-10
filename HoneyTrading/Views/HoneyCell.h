//
//  HoneyCell.h
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoneyCell : UITableViewCell

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *phoneLabel;
@property (strong, nonatomic) UILabel *moneyLabel;
@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UILabel *grossLabel;
@property (strong, nonatomic) UILabel *shippingLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *dateLabel;

- (void)config:(HoneyModel *)honeyModel;

@end
