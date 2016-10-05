//
//  CBBaseModel.m
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@implementation CBBaseModel

+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}
@end
