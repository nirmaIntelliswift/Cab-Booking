//
//  LeftRightStrip.m
//  DemoLayout
//
//  Created by Nirma on 15/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "LeftRightStrip.h"

@implementation LeftRightStrip
-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addLabels];
        _lblLeft.text = leftString;
        _lblRight.text = rightString;
    }
    return self;
}
-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString
               withFont:(UIFont*)font{
    self = [self initWithLeftString:leftString andRightString:rightString];
    if (self) {
        _lblLeft.font = _lblRight.font = font;
    }
    return self;
}
-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString
              rightFont:(UIFont*)rightFont
               leftFont:(UIFont*)leftFont
{
    self = [self initWithLeftString:leftString andRightString:rightString];
    if (self) {
        _lblLeft.font = leftFont;
        _lblRight.font = rightFont;
    }
    return self;
}
-(void)addLabels{
   
    
    _lblLeft = [UILabel new];
    [self addSubview:_lblLeft];
    [_lblLeft autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [_lblLeft autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_lblLeft autoPinEdgeToSuperviewEdge:ALEdgeBottom];
   
    
    
    _lblRight = [UILabel new];
    [self addSubview:_lblRight];
    [_lblRight autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
    [_lblRight autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_lblRight autoPinEdgeToSuperviewEdge:ALEdgeBottom];
   
    
    _lblRight.textAlignment = NSTextAlignmentRight;
    
    _lblRight.font =  [UIFont systemFontOfSize:10];
    _lblLeft.font = [UIFont systemFontOfSize:14];
    _lblRight.textColor = [UIColor grayColor];
    _lblLeft.textColor = [UIColor blackColor];
}

@end
