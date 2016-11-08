//
//  CBCitiesWithRateCardModel.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCityModel.h"

@protocol CBCityModel;

@interface CBCitiesWithRateCardModel : CBBaseModel

@property (nonatomic, strong ) NSMutableArray <CBCityModel> *city;

-(CBCityModel*)getCityData:(NSString*)cityName;
@end
