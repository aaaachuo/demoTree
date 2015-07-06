//
//  ZZNaivgationController.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/22.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ZZNaivgationController.h"

@interface ZZNaivgationController ()

@end

@implementation ZZNaivgationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [super initWithRootViewController:rootViewController]) {
        
        // 设置navigationBar的背景颜色，根据需要自己设置
        UIColor * color = PICK_COLOR;
        self.navigationBar.barTintColor = color;
        // 设置navigationBar是否透明，不透明的话会使可用界面原点下移（0，0）点为导航栏左下角下方的那个点
        self.navigationBar.translucent = NO;
        // 设置navigationBar是不是使用系统默认返回，默认为YES
        self.interactivePopGestureRecognizer.enabled = YES;
        // 设置navigationBar元素的背景颜色，不包括title
        
        NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        self.navigationBar.titleTextAttributes = dict;
        //        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        //        self.navigationBar.shadowImage= [[UIImage alloc] init];
        //
        //        self.navigationItem.titleView.layoutMargins = UIEdgeInsetsMake(1, 0, 0, 0);
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
