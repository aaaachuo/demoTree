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
#import "MenuViewController.h"

@interface RestaurantController ()<UITableViewDelegate, UITableViewDataSource> {

    FilterView *_filterView;
    UITableView *_tableView;
}

@end

@implementation RestaurantController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"全部餐厅";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initFilterView];
    [self initCurrentTable];
}

- (void)initNavItem {
    
    UIButton *button = [UIButton new];
//    button setTitle:@"" forState:<#(UIControlState)#>
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
        
        make.height.equalTo(@(CGRectGetHeight(self.view.frame) - 40 - 50 - 64));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"reuse";
    RestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RestaurantCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuViewController *menuVc = [[MenuViewController alloc] init];
    
    [self.navigationController pushViewController:menuVc animated:YES];
}



@end
