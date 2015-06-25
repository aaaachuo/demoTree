//
//  ZZTabBarViewController.m
//  CustTabbarController
//
//  Created by 翟志杰 on 15/6/8.
//  Copyright (c) 2015年 翟志杰. All rights reserved.
//

#import "ZZTabBarViewController.h"
#import "ZZTabBarView.h"
#import "ZZTabBarItem.h"
#import <objc/runtime.h>

@interface UIViewController (ZZTabBarViewControllerInternal)

- (void)zz_setTabBarController:(ZZTabBarViewController *)tabBarController;

@end

@interface ZZTabBarViewController () <ZZTabBarDelegate>{
    
    UIView *_contentView;
}

@property (nonatomic, readwrite) ZZTabBarView *tabBar;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation ZZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.contentView];
    [self.view addSubview:self.tabBar];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [self setSelectedIndex:self.selectedIndex];
    [self setTabBarHidden:self.isTabBarHidden animeted:NO];
}

- (UIViewController *)selectController {
    
    return self.controllers[self.selectedIndex];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    if ([self selectController]) {
        [self.selectController willMoveToParentViewController:nil];
        [self.selectController.view removeFromSuperview];
        [self.selectController removeFromParentViewController];
    }
    
    _selectedIndex = selectedIndex;
    [self.tabBar setSelectedItem:self.tabBar.items[selectedIndex]];
    
    [self setSelectController:self.controllers[selectedIndex]];
    [self addChildViewController:self.selectController];
    [self.selectController.view setFrame:self.contentView.bounds];
    [self.contentView addSubview:self.selectController.view];
    [self.selectController didMoveToParentViewController:self];
}

- (void)setControllers:(NSArray *)controllers {
    
    if (controllers && [controllers isKindOfClass:[NSArray class]]) {
        
        _controllers = [controllers copy];
        
        NSMutableArray *tabBarItems = [[NSMutableArray alloc] init];
        
        NSArray *titles = @[@"首页", @"美食汇", @"美食天地", @"金库"];
        NSInteger index = 0;
        
        for (UIViewController *controller in controllers) {
            
            ZZTabBarItem *item = [[ZZTabBarItem alloc] init];
            [item setTitle:titles[index]];
            [tabBarItems addObject:item];
            [controller zz_setTabBarController:self];
            
            index ++;
        }
        
        [self.tabBar setItems:tabBarItems];
    }else {
        for (UIViewController *controller in controllers) {
            [controller zz_setTabBarController:nil];
        }
        
        _controllers = nil;
    }
    
}

- (NSInteger)indexForViewController:(UIViewController *)viewController {
    
    UIViewController *searchedViewController = viewController;
    if ([searchedViewController navigationController]) {
        searchedViewController = searchedViewController.navigationController;
    }
    
    return [self.controllers indexOfObject:searchedViewController];
}

- (ZZTabBarView *)tabBar {
    
    if (!_tabBar) {
        _tabBar = [[ZZTabBarView alloc] init];
        [_tabBar setBackgroundColor:[UIColor clearColor]];
        [_tabBar setAutoresizingMask:(UIViewAutoresizingFlexibleWidth|
                                     UIViewAutoresizingFlexibleTopMargin|
                                     UIViewAutoresizingFlexibleLeftMargin|
                                     UIViewAutoresizingFlexibleRightMargin|
                                      UIViewAutoresizingFlexibleBottomMargin)];
        
        _tabBar.delegate = self;
    }
    
    return _tabBar;
}

- (UIView *)contentView {
    
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        [_contentView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|
                                           UIViewAutoresizingFlexibleWidth)];
    }
    
    return _contentView;
}

- (void)setTabBarHidden:(BOOL)tabBarHidden animeted:(BOOL)animeted {
    
    _tabBarHidden = tabBarHidden;
    
    __weak typeof(self) weakSelf = self;
    
    void (^block)() = ^{
        CGSize viewSize = weakSelf.view.frame.size;
        CGFloat tabBarStartingY = viewSize.height;
        CGFloat contentViewHeight = viewSize.height;
        CGFloat tabBarHeight = CGRectGetHeight(self.tabBar.frame);
        
        if (!tabBarHeight) {
            tabBarHeight = 54;
        }
        
        if (!tabBarHidden) {
            tabBarStartingY = viewSize.height - tabBarHeight;
            
            if (weakSelf.tabBar.translucent) {
                contentViewHeight -= (weakSelf.tabBar.minimumContentHeight ?: tabBarHeight);
            }
            
            weakSelf.tabBar.hidden = NO;
        }
        
        [weakSelf.tabBar setFrame:CGRectMake(0, tabBarStartingY, viewSize.width, tabBarHeight)];
        [weakSelf.contentView setFrame:CGRectMake(0, 0, viewSize.width, contentViewHeight)];
    };
    
    void (^complete)(BOOL) = ^(BOOL finished){
        
        if (tabBarHidden) {
            weakSelf.tabBar.hidden = YES;
        }
    };
    
    if (animeted) {
        [UIView animateWithDuration:0.24 animations:block completion:complete];
    }else {
        block();
        complete(YES);
    }
}

- (void)setTabBarHidden:(BOOL)tabBarHidden {
    
    [self setTabBarHidden:tabBarHidden animeted:NO];
}

#pragma mark - ZZTabBarViewDelegate

- (BOOL)ZZTabBar:(ZZTabBarView *)tabBar shouldSelectedItemAtIndex:(NSInteger)index {
    
    if ([self.delegate respondsToSelector:@selector(tabBarConroller:shouldSelectedViewController:)]) {
        
        if ([self.delegate tabBarConroller:self shouldSelectedViewController:self.controllers[index]]) {
            return NO;
        }
        
        if (self.selectController == self.controllers[index]) {
            if ([self.selectController isKindOfClass:[UINavigationController class]]) {
                
                UINavigationController *selectedController = (UINavigationController *)self.selectController;
                
                if ([selectedController topViewController] != [selectedController viewControllers][0]) {
                    [selectedController popToRootViewControllerAnimated:YES];
                }
            }
            
            return NO;
        }
    }
    
    return YES;
}

- (void)ZZTabBar:(ZZTabBarView *)tabBar didSelectItemAtIndex:(NSInteger)index {
    
    if (index < 0 || index >= self.controllers.count) {
        return;
    }
    
    [self setSelectedIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(tabBarConroller:didSelectViewController:)]) {
        [self.delegate tabBarConroller:self didSelectViewController:self.controllers[index]];
    }
    
}

@end

#pragma mark - UIViewController + ZZTabBarControllerItem

@implementation UIViewController (ZZTabBarViewControllerInternal)

- (void)zz_setTabBarController:(ZZTabBarViewController *)tabBarController {
    
    objc_setAssociatedObject(self, @selector(zz_tabBarController), tabBarController, OBJC_ASSOCIATION_ASSIGN);
    
}

@end

@implementation UIViewController (ZZTabBarControllerItem)

- (ZZTabBarViewController *)zz_tabBarController {
    
    ZZTabBarViewController *viewController = objc_getAssociatedObject(self, @selector(zz_tabBarController));
    
    if (!viewController && self.parentViewController) {
        viewController = [self.parentViewController zz_tabBarController];
    }
    
    return viewController;
}

- (ZZTabBarItem *)zz_tabBarItem {
    
    ZZTabBarViewController *tabBarController = [self zz_tabBarController];
    
    NSInteger index = [tabBarController indexForViewController:self];
    
    return tabBarController.tabBar.items[index];
}

- (void)zz_setTabBarItem:(ZZTabBarItem *)zz_tabBarItem {
    
    ZZTabBarViewController *tabBarController = [self zz_tabBarController];
    
    if (!tabBarController) {
        return;
    }
    
    ZZTabBarView *tabBar = tabBarController.tabBar;
    NSInteger index = [tabBarController indexForViewController:self];
    
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] initWithArray:tabBar.items];
    [tabBarItems replaceObjectAtIndex:index withObject:zz_tabBarItem];
    [tabBar setItems:tabBarItems];
    
}

@end


