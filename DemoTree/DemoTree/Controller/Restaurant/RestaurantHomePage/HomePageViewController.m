//
//  HomePageViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/5.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "HomePageViewController.h"
#import "MainTableViewCell.h"
#import "HomePageHeaderView.h"
#import "DefaultReplyMerchantList.h"
#import "ZZRequestAPI.h"

@interface HomePageViewController ()<UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_tableList;
}

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableList = [[NSMutableArray alloc] init];
    [self autoLayoutSubviews];
    [self requestResList];
}

- (void)autoLayoutSubviews {
    
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-113);
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 120;
    [self.view addSubview:_tableView];
    
    HomePageHeaderView *headerView = [[HomePageHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adjustsSizeToFitWithWidth320(175))];
    _tableView.tableHeaderView = headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _tableList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MainTableViewCell" owner:nil options:nil] lastObject];
    
    if (_tableList.count) {
        cell.dishDetail = _tableList[indexPath.row];
        cell.showCheck = NO;
    }
    
    return cell;
}

- (void)requestResList {
    
    NSDictionary *dic = [MainRequestHeader getDishListWithMerchantID:self.merchant.merchantId];
    
    [ZZRequestAPI postBody:dic andUrl:IDS_MERCH_DISHLIST andSucceed:^(DefaultReply *reply) {
        
        
        
    } andFailed:^(NSError *error) {
        
    }];
}

@end
