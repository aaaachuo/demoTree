//
//  HomeViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/7/31.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "HomeViewController.h"
#import "TabButton.h"
#import "HomePageViewController.h"
#import "HomeDetailViewController.h"
#import "DefaultReplyMerchantList.h"

@interface HomeViewController () {
    
    TabButton *_leftBtn;
    TabButton *_rightBtn;
    NSInteger _index;
    HomeDetailViewController *_detailVc;
    HomePageViewController *_pageVc;
}

@end

@implementation HomeViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"餐厅详情";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _detailVc = [[HomeDetailViewController alloc] init];
    _pageVc = [[HomePageViewController alloc] init];
    _pageVc.merchant = _merchant;
    [self addChildViewController:_detailVc];
    [self addChildViewController:_pageVc];
    [self.view addSubview:_pageVc.view];
    
    [self createTabView];
    _index = 0;
}

- (void)createTabView {
    
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 54 - 64, SCREEN_WIDTH, 54)];
    
    TabButton *btnLeft = [TabButton new];
    btnLeft.selected = YES;
    btnLeft.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, CGRectGetHeight(tabView.frame));
    [tabView addSubview:btnLeft];
    [btnLeft setImage:[UIImage imageNamed:@"merchant_home"] forState:UIControlStateNormal];
    [btnLeft setImage:[UIImage imageNamed:@"merchant_home_sel"] forState:UIControlStateSelected];
    [btnLeft setTitle:@"餐厅首页" forState:UIControlStateNormal];
    [btnLeft setTitleColor:PICK_COLOR forState:UIControlStateSelected];
    [btnLeft setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
    btnLeft.tag = 100;
    _leftBtn = btnLeft;
    
    TabButton *btnRight = [TabButton new];
    btnRight.frame = CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, CGRectGetHeight(tabView.frame));
    
    [tabView addSubview:btnRight];
    [btnRight setImage:[UIImage imageNamed:@"merchant_details"] forState:UIControlStateNormal];
    [btnRight setImage:[UIImage imageNamed:@"merchant_details_sel"] forState:UIControlStateSelected];
    [btnRight setTitle:@"餐厅详情" forState:UIControlStateNormal];
    [btnRight setTitleColor:PICK_COLOR forState:UIControlStateSelected];
    [btnRight setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(tabAction:) forControlEvents:UIControlEventTouchUpInside];
    btnRight.tag = 200;
    _rightBtn = btnRight;
    
    [self.view addSubview:tabView];
}

- (void)tabAction:(UIButton *)sender {
    
    if (_index == sender.tag) {
        return;
    }
    
    _index = sender.tag;
    _leftBtn.selected = !_leftBtn.selected;
    _rightBtn.selected = !_rightBtn.selected;
    
    UIViewController *curVc;
    UIViewController *transVc;
    
    if (_rightBtn.selected) {
        curVc = _pageVc;
        transVc = _detailVc;
    }else {
        curVc = _detailVc;
        transVc = _pageVc;
    }
    
    [self transitionFromViewController:curVc
                      toViewController:transVc
                              duration:0
                               options:UIViewAnimationOptionLayoutSubviews
                            animations:nil
                            completion:nil];
}

@end
