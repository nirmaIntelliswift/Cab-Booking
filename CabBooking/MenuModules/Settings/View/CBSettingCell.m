//
//  CBSettingCell.m
//  CabBooking
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBSettingCell.h"
#import "CBSettingModel.h"

@implementation CBSettingCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lblTitle = [UILabel new];
        _imageLeft = [UIImageView new];
        _imageRight = [UIImageView new];
        
        [self.contentView addSubview:_lblTitle];
        [self.contentView addSubview:_imageLeft];
        [self.contentView addSubview:_imageRight];
        
        [_imageLeft autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
        [_imageLeft autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [_imageRight autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:15];
        [_imageRight autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self addHorizonatalSeprator];
        
        [_lblTitle autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imageLeft withOffset:10];
        [_lblTitle autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        _lblTitle.font = [UIFont fontWithName:FONT_REGULAR size:14];
        
    }
    return self;
}
-(void)setData:(id)data{
    CBSettingModel *dataModel = (CBSettingModel*)data;
    _imageLeft.image = [UIImage imageNamed:dataModel.imageLeft];
    _imageRight.image = [UIImage imageNamed:dataModel.imageRight];
    if (![dataModel.lblDetail isEqualToString:@""]) {
        _lblTitle.numberOfLines = 2;
        _lblTitle.attributedText = [CBUtility getAttributedStringFromStrings:@[[NSString stringWithFormat:@"%@\n",dataModel.lblHeading],dataModel.lblDetail] fonts:@[[UIFont fontWithName:FONT_BOLD size:14],[UIFont fontWithName:FONT_REGULAR size:11]] colors:@[[UIColor blackColor],[UIColor lightGrayColor]]];
    }
    else{
        _lblTitle.numberOfLines = 1;
        _lblTitle.text = dataModel.lblHeading;
    }
    
}
@end
