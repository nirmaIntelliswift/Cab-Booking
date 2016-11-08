//
//  CBProfileHeaderView.m
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBProfileHeaderView.h"

@implementation CBProfileHeaderView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addPhoto];
        [self addName];
        [self addBtnCamera];
    }
    return self;
}
-(void)addPhoto{
    _imgPhoto = [CBUIImageView new];
    [self addSubview:_imgPhoto];
    
    [_imgPhoto autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_imgPhoto autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:-10];
    [_imgPhoto autoSetDimensionsToSize:CGSizeMake(200, 200)];
    
    _imgPhoto.layer.cornerRadius = 100;
    _imgPhoto.backgroundColor = [UIColor lightGrayColor];
    _imgPhoto.clipsToBounds = YES;
}

-(void)addName{
    _lblName = [UILabel new];
    [self addSubview:_lblName];
     [_lblName autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_lblName autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    _lblName.font = [UIFont fontWithName:FONT_BOLD size:20];
    _lblName.textColor = UIColorFromRGB(COLOR_PINK);
    _lblName.text = @"Sanjiv Patel";
    _lblName.textAlignment = NSTextAlignmentCenter;
    
}

-(void) addBtnCamera{
    _btnCameraIcon = [UIButton new];
    [self addSubview:_btnCameraIcon];
    
    [_btnCameraIcon autoPinEdge:ALEdgeTrailing toEdge:ALEdgeTrailing ofView:_imgPhoto];
    [_btnCameraIcon autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_imgPhoto withOffset:-5];
    [_btnCameraIcon autoSetDimensionsToSize:CGSizeMake(50, 50)];
    _btnCameraIcon.layer.cornerRadius = 25;
    _btnCameraIcon.backgroundColor = UIColorFromRGB(COLOR_PINK);
    
}
@end
