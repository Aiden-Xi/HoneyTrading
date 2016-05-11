//
//  HoneyModel.h
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HoneyModel : JKDBModel

/**
 *  日期
 */
@property (nonatomic, copy) NSString *date;

/**
 *  销售人
 */
@property (nonatomic, copy) NSString *sales_name;

/**
 *  购买者姓名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  电话
 */
@property (nonatomic, copy) NSString *phone;

/**
 *  付款金额
 */
@property (nonatomic, copy) NSString *allMoney;

/**
 *  邮费
 */
@property (nonatomic, copy) NSString *shipping;

/**
 *  数量
 */
@property (nonatomic, copy) NSString *count;

/**
 *  净赚
 */
@property (nonatomic, copy) NSString *gross;

/**
 *  出邮费人
 */
@property (nonatomic, copy) NSString *shipping_name;

/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;

@end
