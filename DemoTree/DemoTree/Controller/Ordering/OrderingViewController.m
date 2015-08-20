//
//  OrderingViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "OrderingViewController.h"
#import "RestaurantView.h"
#import "MainTableViewCell.h"

@interface OrderingViewController ()<UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *_tableView;
}

@end

@implementation OrderingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开始点餐";
    [self createTable];
    [self createFooterView];
}

- (void)createTable {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 50)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    RestaurantView *resView = [[RestaurantView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 174)];
    _tableView.tableHeaderView = resView;
    
    [self.view addSubview:_tableView];
}

- (void)createFooterView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50 - 64, SCREEN_WIDTH, 50)];
    view.backgroundColor = BACKGRAY_COLOR;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, SCREEN_WIDTH - 20, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"merchant_bg2"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(accountOrdering) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"确认点餐" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:button];
    [self.view addSubview:view];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:nil options:nil] lastObject];
    
    return cell;
}

- (void)accountOrdering {
    
    
}

@end
