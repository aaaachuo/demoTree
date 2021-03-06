//
//  RestaurantController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/28.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RestaurantController.h"
#import "FilterView.h"
#import "CotegoryView.h"
#import "RestaurantCell.h"
#import "HomePageViewController.h"
#import "HomeViewController.h"
#import "DefaultReplyMerchantList.h"
#import "ZZRequestAPI.h"

@interface RestaurantController ()<UITableViewDelegate, UITableViewDataSource> {

    FilterView *_filterView;
    UITableView *_tableView;
    NSMutableArray *_tableList;
}

@end

@implementation RestaurantController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"全部餐厅";
        _tableList = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initFilterView];
    [self initCurrentTable];
    [self requestResList];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.zz_tabBarController setTabBarHidden:YES animeted:YES];
}

- (void)initNavItem {
    
}

- (void)initFilterView {
    
    _filterView = [[FilterView alloc] init];
    [self.view addSubview:_filterView];
    
    [_filterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        
        make.height.equalTo(@(40));
    }];
    
}

- (void)initCurrentTable {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = kUIColorFromRGB(0xeeeee9);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_filterView.mas_bottom).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        
        make.height.equalTo(@(CGRectGetHeight(self.view.frame) - 40 - 64));
    }];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    view.backgroundColor = kUIColorFromRGB(0xeeeee9);
    _tableView.tableHeaderView = view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _tableList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantCell *cell = cell = [[[NSBundle mainBundle] loadNibNamed:@"RestaurantCell" owner:nil options:nil] lastObject];
    
    if (_tableList.count) {
        cell.cellData = _tableList[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    
    [self.navigationController pushViewController:homeVc animated:YES];
}

- (void)requestResList {
    
    NSDictionary *dic = [MainRequestHeader getMerchantListWithType:@"area" area:nil distance:nil page:1];
    
    [ZZRequestAPI postBody:dic andUrl:IDS_RES_MERCHANTLIST andSucceed:^(DefaultReply *reply) {
        
        for (NSDictionary *dic in reply.merchantList) {
            DefaultReplyMerchantList *obj = [DefaultReplyMerchantList objectWithKeyValues:dic];
            [_tableList addObject:obj];
        }
        
        [_tableView reloadData];
        
    } andFailed:^(NSError *error) {
        
    }];
    
}

@end
