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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self getLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _honeyArray = [NSArray array];
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        for (int i = 0; i < 2; i++) {
//            HoneyModel *honey = [[HoneyModel alloc] init];
//            honey.date = @"2016-05-10";
//            honey.sales_name = @"小欢";
//            honey.name = @"毛鹏";
//            honey.phone = @"15021170067";
//            honey.allMoney = @"240";
//            honey.shipping = @"10";
//            honey.shipping_name = @"席小雨";
//            honey.count = @"2";
//            honey.gross = @"88";
//            honey.address = @"上海市浦东新区张衡路666弄盛大研发中心";
//            
//            dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                [honey save];
//            });
//        }
//    });
    
    
    
    [self createUI];
}

#pragma mark - 获取数据列表 -
/** 查询全部数据 */
- (void)getLoad {
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        _honeyArray = [HoneyModel findAll];
//        
//        [_tableView reloadData];
//    });
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        _honeyArray = [HoneyModel findAll];
        
        [_tableView reloadData];
    });
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
    return 170;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  // 取消选中
    
    HoneyModel *honey = _honeyArray[indexPath.row];
    
    UIStoryboard *main = kStoryBoard(@"Main");
    
    ShowViewController *showVC = [main instantiateViewControllerWithIdentifier:@"showController"];
    showVC.honeyModel = honey;
    
    [self.navigationController pushViewController:showVC animated:YES];
}



@end
