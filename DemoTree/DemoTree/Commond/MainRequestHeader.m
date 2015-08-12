//
//  MainRequestHeader.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/1.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "MainRequestHeader.h"

@implementation MainRequestHeader

+ (NSDictionary *)getMainBannerRequestHeader {
        
    NSDictionary *dic = getCommonHeaderInfo();
    return dic;
}

+ (NSDictionary *)getMainDailySaleListRequestHeader:(NSInteger)page {
    
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    
    [body setObject:[@(page) stringValue] forKey:@"page"];
    return body;
}

+ (NSDictionary *)getResListWithType:(NSString *)type page:(NSInteger)page {
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    NSDictionary *commandInfo = [NSDictionary dictionaryWithObjectsAndKeys:type, @"type",
                                 @"0", @"parentId", nil];
    [body setObject:commandInfo forKey:@"commandInfo"];
    [body setObject:[@(page) stringValue] forKey:@"page"];
    
    
    
    return body;
}

+ (NSDictionary *)getMerchantList:(NSInteger)page {
    
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    NSDictionary *commandInfo = @{@"merchantId":@"2"};
    [body setObject:commandInfo forKey:@"commandInfo"];
    [body setObject:[@(page) stringValue] forKey:@"page"];
    
    return body;
}

@end
