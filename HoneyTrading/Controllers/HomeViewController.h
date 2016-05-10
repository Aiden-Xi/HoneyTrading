//
//  HomeViewController.h
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *honeyArray;

@property (nonatomic, strong) HoneyModel *honeyModel;

@end
