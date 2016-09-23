//
//  CBOffersCell.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBOffersCell.h"
#define SIDE_MARGIN 15
@implementation CBOffersCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lblOffer = [UILabel new];
        _lblOfferDetail = [UILabel new];
        _lblOfferCode = [UILabel new];
        _lblOfferExpiryDate = [UILabel new];
       
        
        [self.contentView addSubview:_lblOffer];
        [self.contentView addSubview:_lblOfferDetail];
        [self.contentView addSubview:_lblOfferCode];
        [self.contentView addSubview:_lblOfferExpiryDate];
       
        
        _lblOfferExpiryDate.numberOfLines = 2;
        _lblOfferDetail.numberOfLines = 2;
        [_lblOffer autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [_lblOffer autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_MARGIN];
        
       // [_lblOffer autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_lblOfferDetail withOffset:-2];
        
        [_lblOfferDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblOffer withOffset:2];
        [_lblOfferDetail autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_MARGIN];
        
        [_lblOfferDetail autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self.contentView withMultiplier:0.75];
        [_lblOfferExpiryDate autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:SIDE_MARGIN];
        [_lblOfferExpiryDate autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [_lblOfferDetail autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_lblOfferCode withOffset:-5];
        
        [_lblOfferCode autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:SIDE_MARGIN];
        [_lblOfferCode autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
       
        
        
        
        [self addHorizonatalSeprator];
        _lblOffer.text = @"20% off";
        _lblOfferDetail.text = @"Free trip upto rs 150 for inviting james";
        //_lblOfferDetail.text = @"Lorem Lpsum is simply dummy text of the printing and type setting industry";
        _lblOfferExpiryDate.text = @"Expires:\n10 Aug 2016";
        _lblOfferCode.text = @"Apply promo Code";
        [_lblOffer setFont:[UIFont fontWithName:FONT_MEDIUM size:20]];
        [_lblOfferDetail setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        [_lblOfferCode setFont:[UIFont fontWithName:FONT_MEDIUM size:10]];
        [_lblOfferExpiryDate setFont:[UIFont fontWithName:FONT_MEDIUM size:10]];
        _lblOffer.textColor = UIColorFromRGB(COLOR_PINK);
        _lblOfferDetail.textColor = [UIColor grayColor];
        _lblOfferCode.textColor = [UIColor lightGrayColor];
        _lblOfferCode.numberOfLines = 0;
        _lblOfferDetail.numberOfLines = 0;
        _lblOffer.numberOfLines = 0;
        
    }
    return self;
}

@end
