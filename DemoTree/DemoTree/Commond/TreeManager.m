//
//  TreeManager.m
//  DemoTree
//
//  Created by 翟志杰 on 15/6/25.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "TreeManager.h"

@implementation TreeManager

+ (TreeManager *)shareDemoTreeManager {
    
    static TreeManager *sharedTreeManagerInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        sharedTreeManagerInstance = [[self alloc] init];
    });
    
    return sharedTreeManagerInstance;
}

FOUNDATION_EXPORT NSString *getDeviceScreen() {
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    NSInteger width = screen.size.width;
    NSInteger height = screen.size.height;
    
    if (width == 320 && height == 480) {
        
        return @"3.5";
    }else if (width == 320 && height == 568){
        
        return @"4.0";
    }else if (width == 375 && height == 667){
        
        return @"4.7";
    }else if (width == 414 && height == 736){
        
        return @"5.5";
    }
    
    return nil;
}

@end
