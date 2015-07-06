//
//  MenuViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "HomePageViewController.h"


@interface MenuViewController ()<UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
    UILabel     *_count;
}

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self initNavItem];
    [self initClosingFreeView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.zz_tabBarController setTabBarHidden:YES animeted:YES];
}

- (void)initNavItem {
    
    UIButton *button = [UIButton new];
    [button setTitle:@"餐厅" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 30, 30);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button addTarget:self action:@selector(goToHomePage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = item;
}

- (void)initClosingFreeView {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_tableView.frame) - 50, SCREEN_WIDTH, 50)];
    
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8f];
    
    [self.view addSubview:view];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cart"]];
    image.frame = CGRectMake(10, 15, 22, 22);
    [view addSubview:image];
    
    _count = [[UILabel alloc] initWithFrame:CGRectMake(12, -3, 14, 14)];
    _count.backgroundColor = [UIColor colorWithRed:252/255.0 green:113/255.0 blue:114/255.0 alpha:0.8];
    _count.text = @"1";
    _count.textColor = [UIColor whiteColor];
    _count.textAlignment = NSTextAlignmentCenter;
    _count.font = [UIFont systemFontOfSize:10];
    _count.layer.cornerRadius = 7;
    _count.layer.masksToBounds = YES;
    [image addSubview:_count];
}

- (void)goToHomePage {
    HomePageViewController *homePageVc = [[HomePageViewController alloc] init];
    [self.navigationController pushViewController:homePageVc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}   

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"menuID";
    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

@end
