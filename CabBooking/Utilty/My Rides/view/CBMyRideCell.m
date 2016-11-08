//
//  CBMyRideCell.m
//  CabBooking
//
//  Created by Nirma on 20/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideCell.h"
#import "CBMyRideModel.h"

#define SIDE_MARGIN 10
#define SIDE_LEFT_MARGIN 20
#define TOP_MARGIN 15
#define IMG_SIZE 60

@implementation CBMyRideCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         UIImage *locationImage = [UIImage imageNamed:@"locationIndicatorSmall.png"];
        _imgUserPhoto = [[CBUIImageView alloc]init];
        _imgLocationIndicator = [[CBUIImageView alloc]init];
        _lblTravelTime = [UILabel new];
        _lblTravelAmount = [UILabel new];
        _lblTravelFrom = [UILabel new];
        _lblTravelTo = [UILabel new];
         _lblTravelBy = [UILabel new];
        
        [self.contentView addSubview:_imgUserPhoto];
        [self.contentView addSubview:_imgLocationIndicator];
        [self.contentView addSubview:_lblTravelTime];
        [self.contentView addSubview:_lblTravelAmount];
        [self.contentView addSubview:_lblTravelFrom];
        [self.contentView addSubview:_lblTravelTo];
        [self.contentView addSubview:_lblTravelBy];
        
        [_imgUserPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_LEFT_MARGIN];
        [_imgUserPhoto autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:TOP_MARGIN];
        [_imgUserPhoto autoSetDimensionsToSize:CGSizeMake(IMG_SIZE, IMG_SIZE)];
        
        [_lblTravelTime autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:TOP_MARGIN];
        [_lblTravelTime autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgUserPhoto withOffset:SIDE_LEFT_MARGIN];
        
        [_lblTravelBy autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgUserPhoto withOffset:SIDE_LEFT_MARGIN];
        [_lblTravelBy autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblTravelTime withOffset:1];
        
        [_lblTravelAmount autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN];
        [_lblTravelAmount autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblTravelTime];
        
        [_imgLocationIndicator autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgUserPhoto withOffset:SIDE_LEFT_MARGIN];
        [_imgLocationIndicator autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:TOP_MARGIN];
        [_imgLocationIndicator autoSetDimensionsToSize:locationImage.size];
        
        
        [_lblTravelTo autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLocationIndicator withOffset:10];
        [_lblTravelTo autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN*2];
        [_lblTravelTo autoAlignAxis:ALAxisBaseline toSameAxisOfView:_imgLocationIndicator];
        
        [_lblTravelFrom autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLocationIndicator withOffset:10];
        [_lblTravelFrom autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN];
        [_lblTravelFrom autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_lblTravelTo withOffset:-7];
        //[_lblTravelFrom autoAlignAxis:ALAxisFirstBaseline toSameAxisOfView:_imgLocationIndicator];
        
        [self addHorizonatalSeprator];
        _imgUserPhoto.backgroundColor = [UIColor lightGrayColor];
       // _imgLocationIndicator.backgroundColor = [UIColor lightGrayColor];
        _lblTravelTime.text = @"26 Aug 2016 -4:30 pm";
        _lblTravelBy.text = @"Mini - Toyata Etios";
        _lblTravelAmount.text = @"320";
        _lblTravelFrom.text = @"Sector 12, Kalash udyan, koperkhairan Navi Mumbai";
        _imgUserPhoto.layer.cornerRadius = IMG_SIZE/2;
        _imgUserPhoto.clipsToBounds = YES;
         _lblTravelTo.text = @"Sector 12, Kalash udyan,koperkhairan  Navi Mumbai";
        
        [_lblTravelTime setFont:[UIFont fontWithName:FONT_MEDIUM size:16]];
        [_lblTravelAmount setFont:[UIFont fontWithName:FONT_MEDIUM size:16]];
        [_lblTravelBy setFont:[UIFont fontWithName:FONT_REGULAR size:10]];
        [_lblTravelFrom setFont:[UIFont fontWithName:FONT_REGULAR size:12]];
       [_lblTravelTo setFont:[UIFont fontWithName:FONT_REGULAR size:12]];
        
        _lblTravelBy.textColor = [UIColor lightGrayColor];
        _imgLocationIndicator.image = locationImage;
    }
    return self;
}
-(void)setData:(id)data{
    CBMyRideModel *myRide = (CBMyRideModel*)data;
    _lblTravelTime.text = myRide.dateTime;
    _lblTravelBy.text = myRide.bookedCab.cabModel;
    _lblTravelAmount.text = [NSString stringWithFormat:@"%.1f",myRide.totalFare];
    _lblTravelFrom.text = myRide.sourceAddress;
    
    
    _lblTravelTo.text = myRide.destAddress;
    [_imgUserPhoto setImageFromUrl:myRide.bookedCab.driverImage];

}
@end
