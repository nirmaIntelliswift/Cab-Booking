//
//  CBMyRideDriverView.m
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideDriverView.h"
#define kPHOTO_SIZE 60
@implementation CBMyRideDriverView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
      
       
    }
    return self;
}
-(void)addAllViews{
    [self addPhoto];
    [self addDriverNameLabel];
    [self addDriverCarTypeLabel];
    [self addRateLabel];
    [self addRideStatus];
    [self addHorizonatalSeprator];
}
-(void)addPhoto{
    self.imgDriverPhoto = [CBUIImageView new];
    [self addSubview:self.imgDriverPhoto];
    [self.imgDriverPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [self.imgDriverPhoto autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self ];
    [self.imgDriverPhoto autoSetDimensionsToSize:CGSizeMake(kPHOTO_SIZE, kPHOTO_SIZE)];
    self.imgDriverPhoto.layer.cornerRadius = kPHOTO_SIZE/2;
    self.imgDriverPhoto.backgroundColor = [UIColor grayColor];
    self.imgDriverPhoto.clipsToBounds = YES;
}
-(void)addDriverNameLabel{
    self.lblDriverName = [UILabel new];
    [self addSubview: self.lblDriverName];
    [ self.lblDriverName autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.imgDriverPhoto withOffset:15];
    [ self.lblDriverName autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.imgDriverPhoto];
    //[ self.lblDriverName autoPinEdgeToSuperviewEdge:ALEdgeTop  withInset:15];
     self.lblDriverName.font = [UIFont fontWithName:FONT_REGULAR size:20];
     self.lblDriverName.text = @"Ramesh Dharne";
    
}
-(void)addDriverCarTypeLabel{
    self.lblDriverCarType = [UILabel new];
    [self addSubview:self.lblDriverCarType];
    [self.lblDriverCarType autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self.lblDriverName];
    [self.lblDriverCarType autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lblDriverName withOffset:1];
    self.lblDriverCarType.font = [UIFont fontWithName:FONT_REGULAR size:12];
    self.lblDriverCarType.text = @"White Indica";
    self.lblDriverCarType.textColor = [UIColor grayColor];
}
-(void)addRateLabel{
    self.lblRateValue = [UILabel new];
    [self addSubview:self.lblRateValue];
    [self.lblRateValue autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:self.lblDriverName];
    [self.lblRateValue autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lblDriverCarType withOffset:1];
    self.lblRateValue.font = [UIFont fontWithName:FONT_LIGHT size:12];
    [self setYourRate:@""];
    }
-(void)setYourRate:(NSString*)rate{
    NSMutableAttributedString *yourRate = [[NSMutableAttributedString alloc]initWithString:@"Your Rating : "];
    NSMutableAttributedString *stars = [[NSMutableAttributedString alloc]initWithString:@"\u2605 \u2605 \u2605 \u2605"];
    
    [yourRate addAttribute:NSFontAttributeName
                   value:[UIFont fontWithName:FONT_REGULAR size:12]                   range:NSMakeRange(0,yourRate.length)];
    [yourRate addAttribute:NSForegroundColorAttributeName
                   value:[UIColor blackColor]
                   range:NSMakeRange(0,yourRate.length)];
    [stars addAttribute:NSFontAttributeName
                      value:[UIFont fontWithName:FONT_REGULAR size:14]//Lato-Bold, Your font name crahes
                      range:NSMakeRange(0,stars.length)];
    [stars addAttribute:NSForegroundColorAttributeName
                     value:[UIColor orangeColor]
                     range:NSMakeRange(0,stars.length)];

    [yourRate appendAttributedString:stars];
    self.lblRateValue.attributedText = yourRate;
}
-(void)addRideStatus{
    self.lblRideStatus = [UILabel new];
    [self addSubview: self.lblRideStatus];
    [ self.lblRideStatus autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [ self.lblRideStatus autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.imgDriverPhoto];
   self.lblRideStatus.text = @"SCHEDULED";
     self.lblRideStatus.font = [UIFont fontWithName:FONT_REGULAR size:12];
}
-(void)addHorizonatalSeprator{
    self.viewSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview: self.viewSepratorLine];
    [ self.viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [ self.viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [ self.viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [ self.viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)setData:(id)data{
    CBMyRideModel *ride =  (CBMyRideModel*) data;
    [super setData:ride.bookedCab];
    self.lblRideStatus.text = [CBUtility getRideStatusString:ride.rideStatus];
    self.lblRideStatus.textColor = [CBUtility getRideStatusColor:ride.rideStatus];
    [self setYourRate:@""];
   // self.lblDriverCarNumber.text = cabDetail.cabRegNo;
     //self.lblDriverName.text = cabDetail.driverName;
     //self.lblDriverCarType.text = cabDetail.cabModel;
    
     //self.lblRateValue.text = [NSString stringWithFormat:@"%.1f",cabDetail.cabRating];
    
    //[ self.imgDriverPhoto setImageFromUrl:cabDetail.driverImage];
}
@end
