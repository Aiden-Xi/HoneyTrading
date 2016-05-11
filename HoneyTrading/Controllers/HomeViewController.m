//
//  HomeViewController.m
//  HoneyTrading
//
//  Created by xxy on 16/5/10.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import "HomeViewController.h"
#import "ShowViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, SWTableViewCellDelegate>

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
//    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
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
        cell = [[HoneyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID tableView:tableView];
        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.rightUtilityButtons = [self rightButtons];
        cell.delegate = self;
    }
    
//    cell.contentView.backgroundColor = [UIColor purpleColor];
    
    HoneyModel *honeyModel = (HoneyModel *)_honeyArray[indexPath.row];
    
    [cell config:honeyModel];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  // 取消选中
    
    HoneyModel *honey = _honeyArray[indexPath.row];
    
    UIStoryboard *main = kStoryBoard(@"Main");
    
    ShowViewController *showVC = [main instantiateViewControllerWithIdentifier:@"showController"];
    showVC.honeyModel = honey;
    
    [self.navigationController pushViewController:showVC animated:YES];
}

#pragma mark - SWTableViewCell Utility -
/**
 *  返回UITableViewCell左滑后出现的按钮组
 *
 *  @return 按钮组
 */
- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray array];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:kRedColor title:@"删除"];
    
    return rightUtilityButtons;
}

/**
 *  prevent multiple cells from showing utilty buttons simultaneously
 *
 *  @param cell 所在的cell
 *
 *  @return 如果返回YES,则不能同时处理多个左滑
 */
- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    return YES;
}

#pragma mark - SWTableViewCellDelegate -
/**
 *  左滑按钮组中的按钮点击事件处理方法
 *
 *  @param cell  <#cell description#>
 *  @param index <#index description#>
 */
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index indexPath:(NSIndexPath *)indexPath
{
    HoneyModel *honey = (HoneyModel *)_honeyArray[indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [honey deleteObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self getLoad];
        });
    });
}



@end
