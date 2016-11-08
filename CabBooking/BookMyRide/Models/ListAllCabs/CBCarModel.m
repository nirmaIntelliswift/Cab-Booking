//
//  CBCarModel.m
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCarModel.h"

@implementation CBCarModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    NSArray *optinalValues = @[@"cabRating",@"latitude",@"longitude"];
    return [optinalValues containsObject:propertyName];
}


@end
