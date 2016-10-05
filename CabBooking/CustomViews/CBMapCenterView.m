//
//  CBMapCenterView.m
//  CabBooking
//
//  Created by Nirma on 27/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapCenterView.h"

@implementation CBMapCenterView

-(id)init{
    self = [super initWithImage:[UIImage imageNamed:@"ic_pickup_marker"]];
    if (self) {
        
    }
    return self;
}
-(id)initWithCurrent{
    self = [super initWithImage:[UIImage imageNamed:@"ic_pickup_marker"]];
    if (self) {
        
    }
    return self;
}
-(id)initWithDestination{
    self = [super initWithImage:[UIImage imageNamed:@"ic_drop_marker"]];
    if (self) {
        
    }
    return self;
}

@end
