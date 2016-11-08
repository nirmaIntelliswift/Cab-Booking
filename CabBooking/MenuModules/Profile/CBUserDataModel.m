//
//  CBUserDataModel.m
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBUserDataModel.h"

@implementation CBUserDataModel

-(NSString*)getUserFullName{
    return [NSString stringWithFormat:@"%@  %@",_firstName,_lastName];
}
@end
