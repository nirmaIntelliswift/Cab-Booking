//
//  CBCarCategoryCell.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCarCategoryCell.h"
#define IMAGE_WIDTH 30
#define IMAGE_HEIGHT 20
@implementation CBCarCategoryCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCarAwayTime];
        [self addCarImage];
        [self addCarCategory];
        self.contentView.layer.borderWidth = 0.5;
        self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}

-(void)addCarImage{
    _imgCar = [UIImageView new];
    [self.contentView addSubview:_imgCar];
    [_imgCar autoSetDimensionsToSize:CGSizeMake(IMAGE_WIDTH, IMAGE_HEIGHT)];
    [_imgCar autoCenterInSuperview];
    _imgCar.image = [UIImage imageNamed:@"compact"];
    _imgCar.tintColor = [UIColor blackColor];
}
-(void)addCarAwayTime{
    _lblCarAwayTime = [UILabel new];
    [self.contentView addSubview:_lblCarAwayTime];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
    _lblCarAwayTime.text = @"1 Min Away";
    _lblCarAwayTime.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _lblCarAwayTime.textAlignment = NSTextAlignmentCenter;
}
-(void)addCarCategory{
    _lblCarCategory = [UILabel new];
    [self.contentView addSubview:_lblCarCategory];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
     _lblCarCategory.text = @"Compact";
    _lblCarCategory.font = [UIFont fontWithName:FONT_MEDIUM size:14];
    _lblCarCategory.textAlignment = NSTextAlignmentCenter;
}
@end
