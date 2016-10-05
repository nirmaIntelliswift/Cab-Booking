//
//  NetworkParser.h
//  IntelliSwiftDemoProject
//
//  Created by Nirma on 10/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerInfo.h"
#import "ParameterBundler.h"
#import "ApiNamesConstant.h"

@protocol NetworkParserDelegate <NSObject>
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)nameOfAPI;
-(void)onBusinessFailure:(id)dataObj withAPIName:(int)nameOfAPI;
@optional
-(void)businessTransactionFailed:(id)dataObj;
@end

@interface NetworkParser : NSObject

@property (nonatomic,weak)  id <NetworkParserDelegate> delegate;

-(void)sendRequestWithParams:(NSMutableDictionary *)parameters
                   requestId:(int)requestId;
@end
