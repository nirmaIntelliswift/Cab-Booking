//
//  CBRateChargeCell.m
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBRateChargeCell.h"
#import "CBRateDetailModel.h"

@implementation CBRateChargeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lblRateChargeType = [UILabel new];
        _lblRateChargeAmount = [UILabel new];
        
        [self.contentView addSubview:_lblRateChargeType];
        [self.contentView addSubview:_lblRateChargeAmount];
        
        [_lblRateChargeType autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_lblRateChargeAmount autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
        
        [_lblRateChargeType autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_lblRateChargeAmount autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [_lblRateChargeType setFont:[UIFont fontWithName:FONT_REGULAR size:15]];
        [_lblRateChargeAmount setFont:[UIFont fontWithName:FONT_BOLD size:14]];
        
        _lblRateChargeType.text = @"Base Fare";
        _lblRateChargeAmount.text = @"rs 200";
        _lblRateChargeType.textColor = [UIColor grayColor];
        [self addHorizonatalSeprator];
        
    }
    return self;
}
-(void)setData:(id)data{
    CBRateDetailModel *rateDetail = (CBRateDetailModel*)data;
    if([rateDetail.rateType isEqualToString:@"RIDE_TIME"]){
        _lblRateChargeType.numberOfLines = 2;
        _lblRateChargeType.attributedText = [CBUtility getAttributedStringFromStrings:@[[NSString stringWithFormat:@"%@\n",rateDetail.rateName],rateDetail.rateDesc] fonts:@[[UIFont fontWithName:FONT_REGULAR size:15],[UIFont fontWithName:FONT_REGULAR size:10]] colors:@[[UIColor grayColor],[UIColor lightGrayColor]]];
    }
    else{
         _lblRateChargeType.numberOfLines = 1;
        _lblRateChargeType.text = rateDetail.rateName;
    }
    _lblRateChargeAmount.text = rateDetail.rate;
}
@end
