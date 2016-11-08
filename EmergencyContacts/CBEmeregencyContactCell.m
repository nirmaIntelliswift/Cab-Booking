//
//  CBEmeregencyContactCell.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBEmeregencyContactCell.h"
#import "CBContactModel.h"

#define LEFT_MARGIN 15
#define IMAGE_SIZE 40
#define BTN_SIZE 25

@implementation CBEmeregencyContactCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgContactPhoto = [[CBUIImageView alloc]init];
        _lblContactName = [UILabel new];
        _lblContactPhoneNumber= [UILabel new];
        _btnTrash = [UIButton new];
       
        
        [self.contentView addSubview:_imgContactPhoto];
        [self.contentView addSubview:_lblContactName];
        [self.contentView addSubview:_lblContactPhoneNumber];
        [self.contentView addSubview:_btnTrash];
       
        
        [_imgContactPhoto autoSetDimensionsToSize:CGSizeMake(IMAGE_SIZE, IMAGE_SIZE)];
        [_imgContactPhoto autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_imgContactPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:LEFT_MARGIN];
        
        [_lblContactName autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_imgContactPhoto withOffset:-10];
        [_lblContactName autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgContactPhoto withOffset:10];
        
       [_lblContactPhoneNumber autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_imgContactPhoto withOffset:10];
        [_lblContactPhoneNumber autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgContactPhoto withOffset:10];
        [_lblContactPhoneNumber autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:LEFT_MARGIN];
        
        [_btnTrash autoSetDimensionsToSize:CGSizeMake(BTN_SIZE, BTN_SIZE)];
        [_btnTrash autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_btnTrash autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:LEFT_MARGIN];
        
        [self addHorizonatalSeprator];
        
        _lblContactName.text = @"Jacob Wilson";
         _lblContactPhoneNumber.text = @"+91 1234567890";
        
        [_lblContactName setFont:[UIFont fontWithName:FONT_MEDIUM size:14]];
        [_lblContactPhoneNumber setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        _lblContactName.textColor = UIColorFromRGB(COLOR_PINK);
        _lblContactPhoneNumber.textColor = [UIColor grayColor];
        _imgContactPhoto.image = [UIImage imageNamed:@"ic_rate_card"];
        [_btnTrash setImage:[UIImage imageNamed:@"thrash"] forState:UIControlStateNormal];
    }
    return self;
}
-(void)setData:(id)data{
    CBContactModel *contact = (CBContactModel*)data;
    _lblContactName.text = contact.name;
    _lblContactPhoneNumber.text = contact.number;
}


@end
