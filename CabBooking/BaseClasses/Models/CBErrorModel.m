//
//  CBErrorModel.m
//  CabBooking
//
//  Created by Nirma on 05/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBErrorModel.h"

@implementation CBErrorModel

+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
