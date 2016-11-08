//
//  CBCityModel.m
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCityModel.h"

@implementation CBCityModel

-(CBRateCardModel*)getCabRateCard:(NSString*)cabCategory{
    
    for (int i = 0; i<[_rateCard count]; i++) {
        CBRateCardModel *cabRateCard = [_rateCard objectAtIndex:i];
        if ([cabRateCard.categoryName isEqualToString:cabCategory]) {
            return cabRateCard;
        }
    }
    return nil;
}

@end
