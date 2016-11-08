//
//  CBUserDefaults.m
//  CabBooking
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBUserDefaults.h"
#import "CBUtility.h"

@implementation CBUserDefaults

+(NSString *)getUserHomeAddress{
    [CBUtility readFromDisk:USER_HOME_ADDRESS];
    return @"";
}
+(NSString *)getUserWorkAddress{
    return @"";
}
@end
