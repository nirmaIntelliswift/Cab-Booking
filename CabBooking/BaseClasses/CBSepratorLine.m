//
//  CBSepratorLine.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBSepratorLine.h"

@implementation CBSepratorLine
-(id)init{
    self = [super init];
    if (self) {
       [self setColor];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setColor];
    }
    return self;
}
-(void)setColor{
     self.backgroundColor = [UIColor lightGrayColor];
}
@end
