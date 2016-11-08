//
//  ParameterBundler.h
//  Specimen
//
//  Created by Nirma on 18/05/16.
//  Copyright © 2016 Intelliswift. All rights reserved.
//

//This Class is Project specific
//It builds parameter dictionary for specfic API
//funcation called addCommonParametersInDic is used to add common keys in every request

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface ParameterBundler : NSObject

+(NSMutableDictionary*)getAllCabsForLocation:(CLLocation*)location;
+(NSMutableDictionary*)getRidesEstimationPickUpLocation:(CLLocation*)pickUpLocation
                                  toDestinationLocation:(CLLocation*)destinationLocation;
+(NSMutableDictionary*)getConfirmRidePickUpLocation:(CLLocation*)pickUpLocation
                              toDestinationLocation:(CLLocation*)destinationLocation
                                      cabCategoryId:(int)cabId;
+(NSMutableDictionary*)getMyRidesStartIndex:(int)startIndex
                                      count:(int)total;

+(NSMutableDictionary*)getUpdatedLocation:(NSArray*)cabs;

+(NSMutableDictionary*)getRideDetails:(NSString*)crnNo;
+(NSMutableDictionary*)getCancelRide:(NSString*)crnNo reasonCode:(int)resonCode;
+(NSMutableDictionary*)getRateCard;
+(NSMutableDictionary*)getOffers;
+(NSMutableDictionary*)getEmergencyContacts;
+(NSMutableDictionary*)getUserData;

@end
