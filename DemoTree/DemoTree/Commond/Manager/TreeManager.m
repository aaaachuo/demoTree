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

FOUNDATION_EXPORT NSDictionary *getCommonHeaderInfo() {
    
    NSDictionary *clientInfo = @{@"editionld":@"1.0.0", @"softLanguage":@"1", @"platformld":@"100"};
    NSDictionary *properties = @{@"password":@"", @"username":@"", @"uuid":@"1", @"stauts":@"0"};
    
    NSDictionary *dic = @{@"clientInfo":clientInfo, @"properties":properties};
    return dic;
};


FOUNDATION_EXPORT CGFloat adjustsSizeToFitWithWidth320(CGFloat size) {
    
    CGFloat width = SCREEN_WIDTH;
    return size * width/320;
}

@end
