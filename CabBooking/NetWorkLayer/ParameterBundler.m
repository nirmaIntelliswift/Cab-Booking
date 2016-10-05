//
//  ParameterBundler.m
//  Specimen
//
//  Created by Nirma on 18/05/16.
//  Copyright © 2016 Intelliswift. All rights reserved.
//

#import "ParameterBundler.h"
#define App_Token @"29f8ba4f8e16818b8ced9f474421b0ad"
@implementation ParameterBundler
+(NSMutableDictionary*)getAllCabsForLatitude:(double)latitude
                                   longitude:(double)longitude{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];;
    //[mutDict setObject:@"19.45478787878" forKey:@"latitude"];
    //[mutDict setObject:@"72.3232545454" forKey:@"longitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",latitude] forKey:@"latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",longitude] forKey:@"longitude"];
    [self addCommonParametersInDic:mutDict method:@"allcabs"];
    return mutDict;
}
+(void)addCommonParametersInDic:(NSMutableDictionary*)dict
                         method:(NSString*)method{
   
    [dict setObject:method forKey:@"method"];
    
}
@end
