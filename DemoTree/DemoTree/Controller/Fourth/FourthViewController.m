//
//  FourthViewController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "FourthViewController.h"
#import "MineViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    MineViewController *mineVc = [[MineViewController alloc] init];
    ZZNaivgationController *nav = [[ZZNaivgationController alloc] initWithRootViewController:mineVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
