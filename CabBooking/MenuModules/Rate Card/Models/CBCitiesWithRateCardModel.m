//
//  CBCitiesWithRateCardModel.m
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCitiesWithRateCardModel.h"

@implementation CBCitiesWithRateCardModel

-(CBCityModel*)getCityData:(NSString*)cityName{
    
    for (int i = 0; i<[_city count]; i++) {
        CBCityModel *cityData = [_city objectAtIndex:i];
        if ([cityData.name isEqualToString:cityName]) {
            return cityData;
        }
    }
    return nil;
}
@end
