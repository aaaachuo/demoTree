//
//  ZZRequestAPI.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ZZRequestAPI.h"
#import "JSONKit.h"
#import "Default.h"


@implementation ZZRequestAPI

+ (void)postBody:(NSDictionary *)body andUrl:(NSString *)url andSucceed:(Succeed)succeed andFailed:(Failed)failed {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:url parameters:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = (NSDictionary *)responseObject;
        Default *def = [Default objectWithKeyValues:result];
        
        if (def.code == 0) {
            succeed(def.reply);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
    
}

+ (NSMutableURLRequest *)addRequestHeaderWithMethod:(NSString *)method URL:(NSString *)URL paramers:(NSDictionary *)parameters {
    
    NSMutableURLRequest *request;
    
    if ([method isEqualToString:@"GET"]) {
        
        NSString *url = [ZZRequestAPI getMethodParameters:parameters];
        URL = [URL stringByAppendingString:url];
        request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:URL parameters:nil error:nil];
        
    }else {
        request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:URL parameters:nil error:nil];
        request.HTTPBody = [parameters JSONData];
    }
    
    
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
//    for (NSString *key in paramers.allKeys) {
//        [request setValue:[paramers objectForKey:key] forHTTPHeaderField:key];
//    }
    
    request.timeoutInterval = 15;
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    
    return request;
}

+ (NSString *)getMethodParameters:(NSDictionary *)parameters {
    
    NSMutableString *str = [NSMutableString string];
    NSArray *keys = parameters.allKeys;
    
    
    str = [parameters JSONString];
    
    for (int i = 0; i < keys.count; i++) {
        if (!i) {
            [str appendString:[NSString stringWithFormat:@"?%@=%@", keys[i], parameters[keys[i]]]];
        } else {
            [str appendString:[NSString stringWithFormat:@"&%@=%@", keys[i], parameters[keys]]];
        }
    }
    
    return str;
}




@end
