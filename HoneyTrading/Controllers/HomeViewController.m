//
//  HomeViewController.m
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import "HomeViewController.h"
#import "ShowViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _honeyArray = [NSArray array];
    
    [self getLoad];
    
    [self createUI];
}

#pragma mark - 获取数据列表 -
/** 查询全部数据 */
- (void)getLoad {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _honeyArray = [HoneyModel findAll];
        
        [_tableView reloadData];
    });
    
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//        _honeyArray = [HoneyModel findAll];
//        
//        [_tableView reloadData];
//    });
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = kBackgroundColor;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //去掉分割线
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _honeyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    
    HoneyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[HoneyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    HoneyModel *honeyModel = (HoneyModel *)_honeyArray[indexPath.row];
    
    [cell config:honeyModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HoneyModel *honey = _honeyArray[indexPath.row];
    
    ShowViewController *showVC = [[ShowViewController alloc] init];
    showVC.honeyModel = honey;
}



@end
