//
//  CBMyRideToFromView.m
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideToFromView.h"
#import "CBMyRideModel.h"

#define SIDE_MARGIN 10
#define SIDE_LEFT_MARGIN 20
#define TOP_MARGIN 15
#define IMG_SIZE 60

@implementation CBMyRideToFromView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *locationImage = [UIImage imageNamed:@"locationIndicatorBig.png"];
        _imgLocationIndicator = [[UIImageView alloc]init];
        _lblTravelFromTime = [UILabel new];
        _lblTravelToTime = [UILabel new];
        _lblTravelFrom = [UILabel new];
        _lblTravelTo = [UILabel new];
        
        
        [self addSubview:_lblTravelFromTime];
        [self addSubview:_lblTravelToTime];
        [self addSubview:_imgLocationIndicator];
        [self addSubview:_lblTravelFrom];
        [self addSubview:_lblTravelTo];
        
        _lblTravelFromTime.text = @"9.000";
        
        
        [_lblTravelFromTime autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_LEFT_MARGIN];
        [_lblTravelFromTime autoSetDimension:ALDimensionWidth toSize:50];
       
        
        [_lblTravelToTime autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_LEFT_MARGIN];
        
        
        [_imgLocationIndicator autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lblTravelFromTime withOffset:SIDE_LEFT_MARGIN/2];
        [_imgLocationIndicator autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_imgLocationIndicator autoSetDimensionsToSize:locationImage.size];
        
        
        
        
        
        [_lblTravelFrom autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLocationIndicator withOffset:10];
        [_lblTravelFrom autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN*2];
        [_lblTravelFrom autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_imgLocationIndicator withOffset:-5];
        
        
        [_lblTravelTo autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLocationIndicator withOffset:10];
        [_lblTravelTo autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN*2];
        
        [_lblTravelTo autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgLocationIndicator withOffset:-10];
        
         [_lblTravelToTime autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_lblTravelTo];
         [_lblTravelFromTime autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_lblTravelFrom];
      //[_lblTravelFromTime autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:TOP_MARGIN];
        
       
       // _imgLocationIndicator.backgroundColor = [UIColor lightGrayColor];
        _lblTravelFromTime.text = @"9.12 pm";
        _lblTravelToTime.text = @"9.30 pm";
       
        _lblTravelFrom.text = @"Sector 22, Kalash udyan, koperkhairan Navi Mumbai,";
        _lblTravelTo.text = @"Sector 12, Kalash udyan,koperkhairan  Navi Mumbai";
        
        //_lblTravelFromTime.backgroundColor  = [UIColor redColor];
        //_lblTravelToTime.backgroundColor = [UIColor blueColor];
        [_lblTravelFromTime setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        [_lblTravelToTime setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        [_lblTravelFrom setFont:[UIFont fontWithName:FONT_REGULAR size:14]];
        [_lblTravelTo setFont:[UIFont fontWithName:FONT_REGULAR size:14]];
        _lblTravelFrom.numberOfLines = _lblTravelTo.numberOfLines = 3;
        _imgLocationIndicator.image = locationImage;
        [self addHorizonatalSeprator];
    }
    return self;
}
-(void)addHorizonatalSeprator{
    _viewSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:_viewSepratorLine];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_LEFT_MARGIN];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_LEFT_MARGIN];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}

-(void)setData:(id)data{
    CBMyRideModel *ride = (CBMyRideModel*)data;
    _lblTravelFromTime.text = @"9.12 pm";
    _lblTravelToTime.text = @"9.30 pm";
    //ride.sourceAddress;//ride.destAddress ;  //
    _lblTravelFrom.text =  ride.sourceAddress;//@"Sector 22, Kalash udyan, koperkhairan Navi Mumbai,";
    _lblTravelTo.text = ride.destAddress ;  // @"Sector 12, Kalash udyan,koperkhairan  Navi Mumbai";
}
@end
