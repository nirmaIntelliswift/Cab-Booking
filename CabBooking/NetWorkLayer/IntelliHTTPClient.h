//
//  IntelliHTTPClient.h
//  IntelliSwiftDemoProject
//
//  Created by Nirma on 13/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RequestResultBlock)(NSData *data, NSError *error);
static NSURLRequestCachePolicy defaultCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

static int defaultTimeoutInSeconds = 60;
typedef void (^completeBlock)(id json, NSError* err);
@interface IntelliHTTPClient : NSObject

+(void)postJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(completeBlock)completeBlock;
+(void)getJSONFromURLWithString:(NSString*)urlString params:(NSDictionary*)params completion:(completeBlock)completeBlock;
@end
