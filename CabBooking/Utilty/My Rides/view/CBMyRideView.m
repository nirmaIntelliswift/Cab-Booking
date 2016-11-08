//
//  CBMyRideView.m
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideView.h"


@implementation CBMyRideView
#define HEIGHT_MAP_VIEW 200
#define HEIGHT_DRIVER_VIEW 120
#define HEIGHT_TOFROM_DEATIL_VIEW 110
#define HEIGHT_PRICE_KM 60


-(id)initWithFrame:(CGRect)frame
              data:(CBMyRideModel*)data{
    self = [self initWithFrame:frame];
    if (self) {
        [self addPaymentDetail:data];
        [self setData:data];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
          self.backgroundColor = [UIColor whiteColor];
        [self addMapView];
        [self addDriverDetails];
        [self addToFromDetailView];
        [self addPriceKmTimeView];
        
        
        //[self addViewFooterButtons];
    }
    return self;
}
-(void)setMapRide:(CBMyRideModel*)data{
    CLLocation *sourceLocation = [[CLLocation alloc]initWithLatitude:data.sourceLatitude longitude:data.sourceLongitude];
    CLLocation *destinaionLocation = [[CLLocation alloc]initWithLatitude:data.destLatitude longitude:data.destLongitude];
    [_mapView drawRouteFromCoordinate:sourceLocation toCoordinate:destinaionLocation];
}
-(void)setData:(CBMyRideModel*)data{
      [_viewDriverDetail setData:data];
      [_viewDestinationDetail setData:data];
    _lblPriceDistanceTime.text = [NSString stringWithFormat:@"%.2f   %@   %@",data.totalFare,data.totalDistance,data.travelTime];//@"357  57km  34min";
}
- (void)addMapView {
    _mapView = [[CBMapView alloc]initWithFrame:CGRectZero];
    //_mapView.settings.compassButton = NO;
    _mapView.settings.myLocationButton = NO;
    _mapView.myLocationEnabled = NO;

    [self addSubview:_mapView];
   _mapView.userInteractionEnabled = NO;
    [self addView:_mapView OfHeight:HEIGHT_MAP_VIEW];
    [_mapView autoPinEdgeToSuperviewEdge:ALEdgeTop];

    
    // [_mapView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:viewfooter];
}
-(void)addDriverDetails{
    _viewDriverDetail = [[CBMyRideDriverView alloc]initWithFrame:CGRectZero];
    [self addView:_viewDriverDetail OfHeight:HEIGHT_DRIVER_VIEW];
     [_viewDriverDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_mapView];
   
   // [_viewDriverDetail autoPinEdgeToSuperviewEdge:ALEdgeTop];
}

-(void)addToFromDetailView{
    _viewDestinationDetail = [[CBMyRideToFromView alloc]initWithFrame:CGRectZero];
     [self addView:_viewDestinationDetail OfHeight:HEIGHT_TOFROM_DEATIL_VIEW];
    [_viewDestinationDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewDriverDetail];
  
    
}
-(void)addPriceKmTimeView{
    _lblPriceDistanceTime = [UILabel new];
    [self addView:_lblPriceDistanceTime OfHeight:HEIGHT_PRICE_KM];
    [_lblPriceDistanceTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewDestinationDetail];
    CBSepratorLine *viewSepratorLine = [[CBSepratorLine alloc]init];
    [_lblPriceDistanceTime addSubview: viewSepratorLine];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [ viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
    
    [_lblPriceDistanceTime setFont:[UIFont fontWithName:FONT_MEDIUM size:19]];
    _lblPriceDistanceTime.text = @"357  57km  34min";
    _lblPriceDistanceTime.textAlignment  = NSTextAlignmentCenter;
}

-(void)addPaymentDetail:(CBMyRideModel*)data{
    _viewPaymentMode = [[CBMyRideBillDetailsView alloc]initWithFrame:CGRectZero data:data];
    [self addView:_viewPaymentMode OfHeight:_viewPaymentMode.heightView];
    [_viewPaymentMode autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblPriceDistanceTime];
    
}

-(void)addViewFooterButtons{
    _viewFooterButtons = [[CBFooterButtonsView alloc]initWithFrame:CGRectZero];
    [self addView:_viewFooterButtons OfHeight:60];
    [_viewFooterButtons autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblPriceDistanceTime];
    
}
-(void)addView:(UIView*)view OfHeight:(CGFloat)height{
    [self addSubview:view];
    [view autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [view autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [view autoSetDimension:ALDimensionHeight toSize:height];
}

-(CGFloat)viewHeight{

    return (HEIGHT_MAP_VIEW+HEIGHT_DRIVER_VIEW+HEIGHT_TOFROM_DEATIL_VIEW+HEIGHT_PRICE_KM + _viewPaymentMode.heightView);
}
@end
