//
//  AppDelegate.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/14.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "ZZTabBarViewController.h"
#import "ZZTabBarView.h"
#import "ZZTabBarItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    UIViewController *controller = [self setupViewControllers];
    [self.window setRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (UIViewController *)setupViewControllers {
    
    MainViewController *mainVc = [[MainViewController alloc] init];
    ZZNaivgationController *mainNav = [[ZZNaivgationController alloc] initWithRootViewController:mainVc];
    SecondViewController *secVc = [[SecondViewController alloc] init];
    ZZNaivgationController *secNav = [[ZZNaivgationController alloc] initWithRootViewController:secVc];
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    ZZNaivgationController *thirdNav = [[ZZNaivgationController alloc] initWithRootViewController:thirdVc];
    FourthViewController *fourthVc = [[FourthViewController alloc] init];
    ZZNaivgationController *fourthNav = [[ZZNaivgationController alloc] initWithRootViewController:fourthVc];
    
    ZZTabBarViewController *tabBarController = [[ZZTabBarViewController alloc] init];
    tabBarController.controllers = @[mainNav, secNav, thirdNav, fourthNav];
    [self customizeTabBarForController:tabBarController];
    
    return tabBarController;
}

- (void)customizeTabBarForController:(ZZTabBarViewController *)tabBarController {
    
    NSArray *tabBarItemImages = @[@"main",@"second",@"third",@"fourth"];
    
    NSInteger index = 0;
    
    for (ZZTabBarItem *item in tabBarController.tabBar.items) {
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_Select",
                                                      tabBarItemImages[index]]];
        UIImage *unselectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_Uncheck",
                                                        tabBarItemImages[index]]];
        
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
        
        index ++;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
