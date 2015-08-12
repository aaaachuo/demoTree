//
//  OrderingViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "OrderingViewController.h"
#import "RestaurantView.h"

@interface OrderingViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation OrderingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
