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
{
//    FilterView *_fv;
}
@end

@implementation RestaurantController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"show" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showFilter) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
//    _fv = [[FilterView alloc] initWithItem:@[@"a",@"b"] type:FilterSynthesis];
}

- (void)showFilter {
    FilterView *_fv = [[FilterView alloc] initWithItem:@[@"a",@"b"] type:FilterSynthesis];
    [_fv show];
    
}

@end
