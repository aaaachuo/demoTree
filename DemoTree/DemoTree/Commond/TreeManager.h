//
//  TreeManager.h
//  DemoTree
//
//  Created by 翟志杰 on 15/6/25.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeManager : NSObject

+ (TreeManager *)shareDemoTreeManager;

FOUNDATION_EXPORT NSString *getDeviceScreen();
FOUNDATION_EXPORT NSDictionary *getCommonHeaderInfo();

FOUNDATION_EXPORT CGFloat adjustsSizeToFitWithWidth320(CGFloat size);

@end
