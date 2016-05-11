//
//  ShowViewController.m
//  HoneyTrading
//
//  Created by xxy on 16/5/9.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()
@property (strong, nonatomic) IBOutlet UITextField *dateField;
@property (strong, nonatomic) IBOutlet UITextField *salceNameField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *moneyField;
@property (strong, nonatomic) IBOutlet UITextField *countField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;
@property (strong, nonatomic) IBOutlet UITextField *shippingField;
@property (strong, nonatomic) IBOutlet UITextField *shippingNameField;
@property (strong, nonatomic) IBOutlet UITextField *grossField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *naviTitle = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - 200) / 2, 0, 200, 44)];
    
    naviTitle.font = kFontSizeFamily(20);
    naviTitle.backgroundColor = [UIColor clearColor];
    naviTitle.textColor = kBackgroundColor;
    naviTitle.textAlignment = NSTextAlignmentCenter;
    naviTitle.text = @"销售记录详情";
    
    self.navigationItem.titleView = naviTitle;

    _dateField.text = _honeyModel.date;
    _salceNameField.text = _honeyModel.sales_name;
    _nameField.text = _honeyModel.name;
    _moneyField.text = _honeyModel.allMoney;
    _countField.text = _honeyModel.count;
    _phoneField.text = _honeyModel.phone;
    _shippingField.text = _honeyModel.shipping;
    _shippingNameField.text = _honeyModel.shipping_name;
    _grossField.text = _honeyModel.gross;
    _addressField.text = _honeyModel.address;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonClick:(UIButton *)sender {
    HoneyModel *honey = [[HoneyModel alloc] init];
    honey.date = _dateField.text;
    honey.sales_name = _salceNameField.text;
    honey.pk = _honeyModel.pk;
    honey.name = _nameField.text;
    honey.allMoney = _moneyField.text;
    honey.count = _countField.text;
    honey.phone = _phoneField.text;
    honey.shipping = _shippingField.text;
    honey.shipping_name = _shippingNameField.text;
    honey.gross = _grossField.text;
    honey.address = _addressField.text;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [honey update];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    });
}


@end
