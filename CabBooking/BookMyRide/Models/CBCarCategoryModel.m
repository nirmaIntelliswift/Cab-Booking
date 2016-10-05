//
//  CBCarCategoryModel.m
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCarCategoryModel.h"

@implementation CBCarCategoryModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"isSelected"])
        return YES;
    
    return NO;
}

@end
