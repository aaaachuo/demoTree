//
//  ZZRequestAPI.m
//  DemoTree
//
//  Created by 翟志杰 on 15/8/2.
//  Copyright (c) 2015年 小悠美厨. All rights reserved.
//

#import "ZZRequestAPI.h"
#import "BannerObject.h"
#import "JSONKit.h"

@implementation ZZRequestAPI

+ (void)postBody:(NSDictionary *)body andUrl:(NSString *)url andSucceed:(Succeed)succeed andFaild:(Failed)faild {
    
    NSMutableURLRequest *request = [ZZRequestAPI addRequestHeaderWithMethod:@"GET" URL:url paramers:body];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.10.10.16:8080/meichu/api/common/getResList?page=1"]];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
//    [[NSOperationQueue mainQueue] addOperation:operation];
    [operation start];
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
