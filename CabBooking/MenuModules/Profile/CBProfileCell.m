//
//  CBProfileCell.m
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBProfileCell.h"

@implementation CBProfileCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lblHeading = [UILabel new];
        _lblDetail = [UILabel new];
        _btnEdit = [UIButton new];
        
        [self.contentView addSubview:_lblHeading];
        [self.contentView addSubview:_lblDetail];
        
        [_lblHeading autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_lblHeading autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
        [_lblHeading autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        
        [_lblDetail autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
        [_lblDetail autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
        [_lblDetail autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];
        
        [self addHorizonatalSeprator];
        _lblHeading.font = [UIFont fontWithName:FONT_REGULAR size:14];
         _lblDetail.font = [UIFont fontWithName:FONT_REGULAR size:12];
        
        _lblHeading.text = @"Email ID";
        _lblDetail.text = @"nirma.garg@intelliswift.com";
        _lblDetail.textColor = [UIColor grayColor];
        
        
    }
    return self;
}
@end
