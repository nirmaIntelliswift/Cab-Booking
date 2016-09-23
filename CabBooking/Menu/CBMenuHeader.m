//
//  CBMenuHeader.m
//  CabBooking
//
//  Created by Nirma on 15/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMenuHeader.h"

@implementation CBMenuHeader

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //add userpjhoto
        //add Name
        //addcomment
        [self initGradientLayer];
        [self addUserPhoto];
        [self addUserDetails];
        [self addUserName];
        _lblUserEmailId.text = @"ganeshband@intelliswift.com";
        _lblUserName.text = @"Ganesh Bond";
    }
    return self;
}
+ (Class)layerClass
{
    return [CAGradientLayer class];
    
}
-(void)addUserPhoto{
    _imgUserPhoto = [[UIImageView alloc]init];
    [self addSubview:_imgUserPhoto];
    [_imgUserPhoto autoSetDimensionsToSize:CGSizeMake(50, 50)];
    [_imgUserPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_imgUserPhoto autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    _imgUserPhoto.layer.cornerRadius = 25;
    _imgUserPhoto.layer.borderWidth = 2.0;
    _imgUserPhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgUserPhoto.backgroundColor = [UIColor lightGrayColor];
}
-(void)addUserDetails{
    _lblUserEmailId = [[UILabel alloc]init];
    [self addSubview:_lblUserEmailId];
    [_lblUserEmailId autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_lblUserEmailId autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_lblUserEmailId setFont:[UIFont fontWithName:FONT_LIGHT size:10]];
    _lblUserEmailId.textColor = [UIColor whiteColor];
}
-(void)addUserName{
    _lblUserName = [[UILabel alloc]init];
    [self addSubview:_lblUserName];
    [_lblUserName autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_lblUserName autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_lblUserEmailId withOffset:1];
    [_lblUserName setFont:[UIFont fontWithName:FONT_MEDIUM size:16]];
     _lblUserName.textColor = [UIColor whiteColor];
}
- (void)initGradientLayer {
    CAGradientLayer *gLayer = (CAGradientLayer *)self.layer;
    gLayer.colors = [NSArray arrayWithObjects:(id)UIColorFromRGB(COLOR_PINK).CGColor, (id)UIColorFromRGB(COLOR_BLUE).CGColor, nil];
   //  gLayer.colors = [NSArray arrayWithObjects:(id)[UIColor blackColor].CGColor, (id)[UIColor whiteColor].CGColor, nil];
    gLayer.startPoint = CGPointMake(0, 0.30);;
    gLayer.endPoint = CGPointMake(1.0, 1.0);
    gLayer.locations = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.35]];
}
@end
