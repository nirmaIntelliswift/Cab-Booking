//
//  NetworkParser.m
//  IntelliSwiftDemoProject
//
//  Created by Nirma on 10/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "NetworkParser.h"
#import "JSONHTTPClient.h"
#import "Constants.h"

//#import "NetworkClient+GenericClient.h"
//#import "NWHttpResponse.h"
#import "IntelliHTTPClient.h"

@implementation NetworkParser

-(void)sendRequestWithParams:(NSMutableDictionary *)dict
                   requestId:(int)requestId{
   // [self sendRequestWithParams_BY_JSONMODEL:dict requestId:requestId];
    [self sendRequestWithParams_BY_INTELLI:dict requestId:requestId];
   // [self sendRequestWithParams_BY_AFNETWORKING:dict requestId:requestId];
}
-(void)sendRequestWithParams_BY_INTELLI:(NSMutableDictionary *)dict
                              requestId:(int)requestId{
    NSMutableString *fullUrl = [NSMutableString stringWithFormat:BASEURL];
    [fullUrl appendString:[dict objectForKey:@"method"]];
    [IntelliHTTPClient postJSONFromURLWithString:fullUrl
                                          params:dict
                                      completion:^(id json, NSError *err) {
                                          
                                          //check err, process json ...
                                          //  NSLog(@" response-->%@",json);
                                          
                                          [self checkJsonResponse:json requestId:requestId];
                                      }];
}

-(void)checkJsonResponse:(id)json
        requestId:(int)requestId{
    NSDictionary *jsonDic = (NSDictionary*)json;
    NSMutableDictionary *jsonServerData = jsonDic[@"data"];
    DLog(@"jsonSuccess---%@",jsonDic[@"status"]);
    
    jsonServerData[@"message"] =  jsonDic[@"message"];
    jsonServerData[@"server_time"] =  jsonDic[@"server_time"];
    jsonServerData[@"errors"] =  jsonDic[@"errors"];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonServerData options:NSJSONWritingPrettyPrinted error:&error];
    NSString* jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    [self.delegate onBusinessSuccess:jsonStr withAPIName:requestId];
}
#pragma mark -JSONMODEL HTTP CLIENT
-(void)sendRequestWithParams_BY_JSONMODEL:(NSMutableDictionary *)dict
                   requestId:(int)requestId{
    NSMutableString *fullUrl = [NSMutableString stringWithFormat:BASEURL];
    [fullUrl appendString:[dict objectForKey:@"method"]];
  /*  [JSONHTTPClient postJSONFromURLWithString:fullUrl
                                       params:dict
                                   completion:^(id json, JSONModelError *err) {
                                       
                                       //check err, process json ...
                                       //  NSLog(@" response-->%@",json);
                                       NSError *error;
                                       NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
                                       NSString* jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
                                       [self.delegate onBusinessSuccess:jsonStr withAPIName:requestId];
                                       
                                   }];*/
    NSDictionary *headers = [[NSDictionary alloc]initWithObjects:@[@"23443ABC"] forKeys:@[@"UserToken"]];
   [JSONHTTPClient JSONFromURLWithString:fullUrl method:@"POST" params:dict orBodyData:nil headers:headers completion:^(id json, JSONModelError *err) {
       //check err, process json ...
       //  NSLog(@" response-->%@",json);
       NSError *error;
       NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
       NSString* jsonStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
       [self.delegate onBusinessSuccess:jsonStr withAPIName:requestId];
   }];
}


@end
