//
//  ZZRequestAPI.h
//  DemoTree
//
//  Created by 翟志杰 on 15/8/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Succeed)(NSArray *success);
typedef void(^Failed)(NSError *error);

@interface ZZRequestAPI : NSObject

+ (void)postBody:(NSDictionary *)body andUrl:(NSString *)url andSucceed:(Succeed)succeed andFaild:(Failed)faild;

@end
