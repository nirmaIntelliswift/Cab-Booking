//
//  CBMyRideModel.m
//  CabBooking
//
//  Created by Nirma on 20/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideModel.h"

@implementation CBMyRideModel


+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    NSArray *optinalValues = @[@"rateByYou",@"sourceLatitude",@"sourceLongitude",@"destLatitude",@"destLongitude"];
    return [optinalValues containsObject:propertyName];
}

@end
