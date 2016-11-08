//
//  CBCabRateCardView.m
//  CabBooking
//
//  Created by Nirma on 04/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCabRateCardView.h"

@implementation CBCabRateCardView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor whiteColor];
        [self addCabImage];
        [self addHeading];
        [self addfares];
        [self addPeakTimeCharges];
        [self addLblNotice];
        [self setData];
    }
    return self;
}
-(void)addCabImage{
    _imgCab = [UIImageView new];
    [self addSubview:_imgCab];
    
    [_imgCab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [_imgCab autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [_imgCab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-50];
    
}

-(void)addHeading{
    _lblHeading = [UILabel new];
    _lblHeading.numberOfLines = 2;
    [self addSubview:_lblHeading];
    
    [_lblHeading autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_lblHeading autoAlignAxisToSuperviewAxis:ALAxisVertical];
    _lblHeading.textAlignment = NSTextAlignmentCenter;
}
-(void)addfares{
    _lblBaseFare = [UILabel new];
   _lblRatePerKm = [UILabel new];
    _lblRidePerTime = [UILabel new];
    
     [self addSubview:_lblBaseFare];
     [self addSubview:_lblRatePerKm];
     [self addSubview:_lblRidePerTime];
    
    [_lblBaseFare autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_lblBaseFare autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblHeading withOffset:20];
    
    [_lblRatePerKm autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_lblRatePerKm autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblBaseFare];
    
    [_lblRidePerTime autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    [_lblRidePerTime autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblBaseFare];
    
     _lblBaseFare.numberOfLines = _lblRatePerKm.numberOfLines = _lblRidePerTime.numberOfLines = 2;
    _lblBaseFare.textAlignment =  _lblRatePerKm.textAlignment =  _lblRidePerTime.textAlignment = NSTextAlignmentCenter;
}
-(void)addPeakTimeCharges{
     _lblPeakTimeCharge = [UILabel new];
    [self addSubview:_lblPeakTimeCharge];
    
    [_lblPeakTimeCharge autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblBaseFare withOffset:20];
     [_lblPeakTimeCharge autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    _lblPeakTimeCharge.numberOfLines  = 2;
    _lblPeakTimeCharge.textAlignment  = NSTextAlignmentCenter;
}
-(void)addLblNotice{
    _lblFooterNotice = [UILabel new];
    [self addSubview:_lblFooterNotice];
    
    [_lblFooterNotice autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_lblFooterNotice autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
}
-(void)setData{
    _lblHeading.attributedText = [CBUtility getAttributedStringFromStrings:@[@"Compact\n",@"Hyndia EON Datson, Martuti Alto"] fonts:@[[UIFont boldSystemFontOfSize:15],[UIFont systemFontOfSize:10]]];
    
    _lblBaseFare.attributedText = [CBUtility getAttributedStringFromStrings:@[@"60.0\n",@"Base fare"] fonts:@[[UIFont boldSystemFontOfSize:12],[UIFont systemFontOfSize:12]]];
     _lblRatePerKm.attributedText = [CBUtility getAttributedStringFromStrings:@[@"60.0\n",@"Base fare"] fonts:@[[UIFont boldSystemFontOfSize:12],[UIFont systemFontOfSize:12]]];
     _lblRidePerTime.attributedText = [CBUtility getAttributedStringFromStrings:@[@"60.0\n",@"Base fare"] fonts:@[[UIFont boldSystemFontOfSize:12],[UIFont systemFontOfSize:12]]];
    
    _lblPeakTimeCharge.text = @"Peak Time charges may be applicable during high demand hours";
    _lblPeakTimeCharge.font = [UIFont systemFontOfSize:10];
    
    _lblFooterNotice.text = @"service Text Extra";
    _lblFooterNotice.font = [UIFont systemFontOfSize:8];
}


@end
