//
//  HoneyCell.m
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import "HoneyCell.h"

@implementation HoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        
        self.backgroundColor = kBackgroundColor;
    }
    return self;
}

- (void)createUI {
    // 时间
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding_10, kPadding_5, kScreenWidth - 2 * kPadding_10, kPadding_20)];
    _dateLabel.font = kFontSizeFamily(20);
    _dateLabel.textColor = kDefaultBlackColor;
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_dateLabel];

    // 姓名
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding_10, CGRectGetMaxY(_dateLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _nameLabel.font = kFontSizeFamily(20);
    _nameLabel.textColor = kDefaultBlackColor;
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_nameLabel];
    
    // 电话
    _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_nameLabel.frame), CGRectGetMaxY(_dateLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _phoneLabel.font = kFontSizeFamily(20);
    _phoneLabel.textColor = kDefaultBlackColor;
    _phoneLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_phoneLabel];
    
    // 金额
    _moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding_10, CGRectGetMaxY(_nameLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _moneyLabel.font = kFontSizeFamily(20);
    _moneyLabel.textColor = kDefaultBlackColor;
    _moneyLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_moneyLabel];
    
    // 邮费
    _shippingLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_moneyLabel.frame), CGRectGetMaxY(_nameLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _shippingLabel.font = kFontSizeFamily(20);
    _shippingLabel.textColor = kDefaultBlackColor;
    _shippingLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_shippingLabel];
    
    // 数量
    _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding_10, CGRectGetMaxY(_moneyLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _countLabel.font = kFontSizeFamily(20);
    _countLabel.textColor = kDefaultBlackColor;
    _countLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_countLabel];
    
    // 净赚
    _grossLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_countLabel.frame), CGRectGetMaxY(_shippingLabel.frame) + kPadding_5, (kScreenWidth - 2 * kPadding_10) / 2, kPadding_20)];
    _grossLabel.font = kFontSizeFamily(20);
    _grossLabel.textColor = kDefaultBlackColor;
    _grossLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_grossLabel];
    
    // 地址
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPadding_10, CGRectGetMaxY(_countLabel.frame) + kPadding_5, kScreenWidth - 2 * kPadding_10, kPadding_20)];
    _addressLabel.font = kFontSizeFamily(20);
    _addressLabel.textColor = kDefaultBlackColor;
    _addressLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_addressLabel];
    
    // 分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_addressLabel.frame) + kPadding_10, kScreenWidth, kLineHeight)];
    lineView.backgroundColor = [UIColor grayColor];

    [self.contentView addSubview:lineView];
}

- (void)config:(HoneyModel *)honeyModel {
    _dateLabel.text = [NSString stringWithFormat:@"日期：%@", honeyModel.date];
    _nameLabel.text = [NSString stringWithFormat:@"姓名：%@", honeyModel.name];
    _phoneLabel.text = [NSString stringWithFormat:@"电话：%@", honeyModel.phone];
    _moneyLabel.text = [NSString stringWithFormat:@"金额：%@", honeyModel.allMoney];
    _shippingLabel.text = [NSString stringWithFormat:@"邮费：%@", honeyModel.shipping];
    _grossLabel.text = [NSString stringWithFormat:@"净赚：%@", honeyModel.gross];
    _countLabel.text = [NSString stringWithFormat:@"数量：%@", honeyModel.count];
    _addressLabel.text = [NSString stringWithFormat:@"地址：%@", honeyModel.address];
}

@end
