//
//  RestaurantController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/28.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "RestaurantController.h"
#import "FilterView.h"

@interface RestaurantController ()

@end

@implementation RestaurantController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"show" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showFilter) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btn];
}

- (void)showFilter {
    
    FilterView *fv = [[FilterView alloc] initWithItem:@[@"a",@"b"] type:FilterSynthesis];
    [fv show];
    
}

@end
