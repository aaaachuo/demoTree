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

+ (NSDictionary *)getResListWithType:(NSString *)type
                                area:(NSString *)area
                            distance:(NSString *)distance
                                page:(NSInteger)page {
    
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    
    NSMutableDictionary *commandInfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"0", @"parentId", nil];
    
    if (type) {
        [commandInfo setObject:type forKey:@"type"];
    }
    if (area) {
        [commandInfo setObject:area forKey:@"area"];
    }
    if (distance) {
        [commandInfo setObject:distance forKey:@"distance"];
    }
    
    
    
    [body setObject:commandInfo forKey:@"commandInfo"];
    [body setObject:[@(page) stringValue] forKey:@"page"];
    
    
    
    return body;
}

+ (NSDictionary *)getMerchantListWithType:(NSString *)type
                                     area:(NSString *)area
                                 distance:(NSString *)distance
                                     page:(NSInteger)page {
    
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    NSMutableDictionary *commandInfo = [[NSMutableDictionary alloc] init];
    
    if (type) {
        [commandInfo setObject:type forKey:@"type"];
    }
    if (area) {
        [commandInfo setObject:area forKey:@"area"];
    }
    if (distance) {
        [commandInfo setObject:distance forKey:@"distance"];
    }
    
    if ([TreeManager shareDemoTreeManager].latitude) {
        [commandInfo setObject:[TreeManager shareDemoTreeManager].latitude forKey:@"indexY"];
    }
    
    if ([TreeManager shareDemoTreeManager].longitude) {
        [commandInfo setObject:[TreeManager shareDemoTreeManager].longitude forKey:@"indexX"];
    }
    
    [body setObject:commandInfo forKey:@"commandInfo"];
    [body setObject:[@(page) stringValue] forKey:@"page"];
    
    return body;
}

+ (NSDictionary *)getDishListWithMerchantID:(NSInteger)merchantID {
    
    NSMutableDictionary *body = getCommonHeaderInfo().mutableCopy;
    NSDictionary *commandInfo = [NSDictionary dictionaryWithObjectsAndKeys:[@(merchantID) stringValue],@"merchantId", nil];
    
    [body setObject:commandInfo forKey:@"commandInfo"];
    
    return body;
}


@end
