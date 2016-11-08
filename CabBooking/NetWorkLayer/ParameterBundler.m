//
//  ParameterBundler.m
//  Specimen
//
//  Created by Nirma on 18/05/16.
//  Copyright © 2016 Intelliswift. All rights reserved.
//

#import "ParameterBundler.h"
#import "ApiNamesConstant.h"

#define App_Token @"29f8ba4f8e16818b8ced9f474421b0ad"
@implementation ParameterBundler
+(NSMutableDictionary*)getAllCabsForLocation:(CLLocation*)location{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];;
    [mutDict setObject:[NSString stringWithFormat:@"%f",location.coordinate.latitude] forKey:@"latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",location.coordinate.longitude] forKey:@"longitude"];
    [self addCommonParametersInDic:mutDict method:API_NAME_ALL_CABS];
    return mutDict;
}
+(NSMutableDictionary*)getRidesEstimationPickUpLocation:(CLLocation*)pickUpLocation
                       toDestinationLocation:(CLLocation*)destinationLocation{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];;
    [mutDict setObject:[NSString stringWithFormat:@"%f",pickUpLocation.coordinate.latitude] forKey:@"source_latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",pickUpLocation.coordinate.longitude] forKey:@"source_longitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",destinationLocation.coordinate.latitude] forKey:@"dest_latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",destinationLocation.coordinate.longitude] forKey:@"dest_longitude"];
    [self addCommonParametersInDic:mutDict method:API_NAME_GET_RIDE_ESTIMATE];
    return mutDict;
}
+(NSMutableDictionary*)getConfirmRidePickUpLocation:(CLLocation*)pickUpLocation
                                  toDestinationLocation:(CLLocation*)destinationLocation
                                      cabCategoryId:(int)cabId{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];;
    [mutDict setObject:[NSString stringWithFormat:@"%f",pickUpLocation.coordinate.latitude] forKey:@"source_latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",pickUpLocation.coordinate.longitude] forKey:@"source_longitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",destinationLocation.coordinate.latitude] forKey:@"dest_latitude"];
    [mutDict setObject:[NSString stringWithFormat:@"%f",destinationLocation.coordinate.longitude] forKey:@"dest_longitude"];
     [mutDict setObject:[NSString stringWithFormat:@"%d",cabId] forKey:@"category_id"];
    [self addCommonParametersInDic:mutDict method:API_NAME_CONFIRM_RIDE];
    return mutDict;
}
+(NSMutableDictionary*)getMyRidesStartIndex:(int)startIndex count:(int)total{
     NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [mutDict setObject:[NSString stringWithFormat:@"%d",startIndex] forKey:@"start_index"];
    [mutDict setObject:[NSString stringWithFormat:@"%d",total] forKey:@"count"];
     [self addCommonParametersInDic:mutDict method:API_NAME_MY_RIDES];
    return mutDict;
}
+(NSMutableDictionary*)getRideDetails:(NSString*)crnNo {
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [mutDict setObject:crnNo forKey:@"crn_no"];
    [self addCommonParametersInDic:mutDict method:API_NAME_RIDE_DETAIL];
    return mutDict;
}
+(NSMutableDictionary*)getCancelRide:(NSString *)crnNo reasonCode:(int)resonCode{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]initWithObjects:@[crnNo,[NSString stringWithFormat:@"%d",resonCode]] forKeys:@[@"crn_no",@"reason_code"]];
    [self addCommonParametersInDic:mutDict method:API_NAME_CANCEL_RIDE];
    return mutDict;
}
+(NSMutableDictionary*)getRateCard{
     NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [self addCommonParametersInDic:mutDict method:API_NAME_RATE_CARD];
    return mutDict;

}
+(NSMutableDictionary*)getOffers{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [self addCommonParametersInDic:mutDict method:API_NAME_OFFERS];
    return mutDict;
    
}
+(NSMutableDictionary*)getEmergencyContacts{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [self addCommonParametersInDic:mutDict method:API_NAME_EMERGENCY_CONTACTS];
    return mutDict;
}
+(NSMutableDictionary*)getUserData{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [self addCommonParametersInDic:mutDict method:API_NAME_USER_DATA];
    return mutDict;
}
+(NSMutableDictionary*)getUpdatedLocation:(NSArray*)cabs{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]init];
    [self addCommonParametersInDic:mutDict method:API_NAME_UPDATED_LOCATION];
    return mutDict;
}
+(void)addCommonParametersInDic:(NSMutableDictionary*)dict
                         method:(NSString*)method{
   
    [dict setObject:method forKey:@"method"];
    
}

@end
