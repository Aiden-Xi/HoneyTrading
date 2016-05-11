//
//  AddViewController.m
//  HoneyTrading
//
//  Created by xxy on 16/5/9.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

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

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonClick:(UIButton *)sender {
    HoneyModel *honey = [[HoneyModel alloc] init];
    honey.date = _dateField.text;
    honey.sales_name = _salceNameField.text;
    honey.name = _nameField.text;
    honey.allMoney = _moneyField.text;
    honey.count = _countField.text;
    honey.phone = _phoneField.text;
    honey.shipping = _shippingField.text;
    honey.shipping_name = _shippingNameField.text;
    honey.gross = _grossField.text;
    honey.address = _addressField.text;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [honey save];
        
        
    });
}

@end
