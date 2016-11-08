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
    NSArray *optinalValues = @[@"isSelected"];
    return [optinalValues containsObject:propertyName];
}

-(NSString*)getCabCategoryImageName{
    if (_isSelected) {
        return @"compactEnable";
    }
    else{
        return @"compact";
    }
}
-(UIColor*)getCabCategoryColor{
    if (_isSelected) {
        return UIColorFromRGB(COLOR_BLUE);
    }
    else{
        return [UIColor grayColor];//UIColorFromRGB(COLOR_PINK);
    }
    
}
@end
