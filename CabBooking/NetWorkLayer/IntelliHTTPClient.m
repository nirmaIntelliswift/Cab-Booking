//
//  IntelliHTTPClient.m
//  IntelliSwiftDemoProject
//
//  Created by Nirma on 13/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "IntelliHTTPClient.h"

@implementation IntelliHTTPClient



+(void)postJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(completeBlock)completeBlock{
     NSError *error;
     NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
     [IntelliHTTPClient requestDataFromURL:[NSURL URLWithString:urlString] method:@"POST" requestBody:jsonData handler:completeBlock];
    
}
+(void)getJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(completeBlock)completeBlock{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    [IntelliHTTPClient requestDataFromURL:[NSURL URLWithString:urlString] method:@"GET" requestBody:nil handler:completeBlock];
    
}
+(void)requestDataFromURL:(NSURL*)url method:(NSString*)method requestBody:(NSData*)bodyData  handler:(RequestResultBlock)handler
{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url
                                                                cachePolicy: defaultCachePolicy
                                                            timeoutInterval: defaultTimeoutInSeconds];
    [request setHTTPMethod:method];
    
    if (bodyData) {
        [request setHTTPBody: bodyData];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)bodyData.length] forHTTPHeaderField:@"Content-Length"];
    }
    [request setValue: @"application/json" forHTTPHeaderField:@"Content-type"];
     NSDictionary *headers = [[NSDictionary alloc]initWithObjects:@[@"23443ABC"] forKeys:@[@"UserToken"]];
    for (NSString* key in [headers allKeys]) {
        [request setValue:headers[key] forHTTPHeaderField:key];
    }
    void (^completionHandler)(NSData *, NSURLResponse *, NSError *) = ^(NSData *data, NSURLResponse *origResponse, NSError *origError) {
        // NSHTTPURLResponse *response = (NSHTTPURLResponse *)origResponse;
        NSError *error = nil;
        id jsonObject = nil;
        if (error==nil) {
            // Note: it is possible to have a valid response with empty response data (204 No Content).
            // So only create the JSON object if there is some response data.
            if(data.length > 0)
            {
                //convert to an object
                jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            }
        }
        handler(jsonObject, error);
    };
    
    //fire the request
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0 || __MAC_OS_X_VERSION_MIN_REQUIRED >= __MAC_10_10
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
#else
    NSOperationQueue *queue = [NSOperationQueue new];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        completionHandler(data, response, error);
    }];
#endif
}

@end
