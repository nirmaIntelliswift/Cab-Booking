//
//  CBDriverDetailView.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBDriverDetailView.h"

@implementation CBDriverDetailView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addPhoto];
        [self addRateImage];
        [self addRateLabel];
        [self addDriverNameLabel];
        [self addDriverCarTypeLabel];
        [self addDriverCarNumberLabel];
        [self addMyWalletButton];
        [self addShareButton];
        [self addCallButton];
    }
    return self;
}
-(void)addPhoto{
    _imgDriverPhoto = [UIImageView new];
    [self addSubview:_imgDriverPhoto];
    [_imgDriverPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_imgDriverPhoto autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_imgDriverPhoto autoSetDimensionsToSize:CGSizeMake(35, 35)];
    _imgDriverPhoto.layer.cornerRadius = 17.5;
}
-(void)addRateImage{
    _imgRate = [UIImageView new];
    [self addSubview:_imgRate];
    [_imgRate autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgDriverPhoto withOffset:8];
    [_imgRate autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_imgRate autoSetDimensionsToSize:CGSizeMake(5, 5)];
}
-(void)addRateLabel{
    _lblRateValue = [UILabel new];
    [self addSubview:_lblRateValue];
    [_lblRateValue autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgRate withOffset:2];
    [_lblRateValue autoAlignAxis:ALAxisBaseline toSameAxisOfView:_imgRate];
    _lblRateValue.font = [UIFont fontWithName:FONT_LIGHT size:8];
    _lblRateValue.text = @"4.3";
}
-(void)addDriverNameLabel{
    _lblDriverName = [UILabel new];
    [self addSubview:_lblDriverName];
    [_lblDriverName autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_imgRate];
    [_lblDriverName autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgRate withOffset:1];
    _lblDriverName.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _lblDriverName.text = @"Ramesh Dharne";

}
-(void)addDriverCarTypeLabel{
    _lblDriverCarType = [UILabel new];
    [self addSubview:_lblDriverCarType];
    [_lblDriverCarType autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_imgRate];
    [_lblDriverCarType autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblDriverName withOffset:1];
    _lblDriverCarType.font = [UIFont fontWithName:FONT_REGULAR size:10];
    _lblDriverCarType.text = @"White Indica";
    _lblDriverCarType.textColor = [UIColor grayColor];
}
-(void)addDriverCarNumberLabel{
    _lblDriverCarNumber = [UILabel new];
    [self addSubview:_lblDriverCarNumber];
    [_lblDriverCarNumber autoPinEdge:ALEdgeLeading toEdge:ALEdgeLeading ofView:_imgRate];
    [_lblDriverCarNumber autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblDriverCarType withOffset:1];
    _lblDriverCarNumber.font = [UIFont fontWithName:FONT_REGULAR size:8];
    _lblDriverCarNumber.text = @"MH02CR3903/CRN3223456";
    _lblDriverCarNumber.textColor = [UIColor grayColor];
}
-(void)addShareButton{
    _btnShareDirection = [CBUtility btnWithTopImage:@"ic_rate_card" btnName:@"Share Direction"];
    [self addSubview:_btnShareDirection];
    [_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    //[_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    [_btnShareDirection autoSetDimension:ALDimensionWidth toSize:65];
    [_btnShareDirection autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnPaymentMyWallet withOffset:-4];
}
-(void)addCallButton{
    _btnCalldriver = [CBUtility btnWithTopImage:@"ic_rate_card" btnName:@"Call Driver"];
    [self addSubview:_btnCalldriver];
    [_btnCalldriver autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnShareDirection withOffset:0.5];
    [_btnCalldriver autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnPaymentMyWallet withOffset:-4];
    [_btnCalldriver autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    [_btnCalldriver autoSetDimension:ALDimensionWidth toSize:65];

    
    
}
-(void)addMyWalletButton{
    _btnPaymentMyWallet = [UIButton new];
    [self addSubview:_btnPaymentMyWallet];
    [_btnPaymentMyWallet autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:1];
    [_btnPaymentMyWallet autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self withMultiplier:0.33];
    [_btnPaymentMyWallet autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnPaymentMyWallet autoSetDimension:ALDimensionHeight toSize:25];
    _btnPaymentMyWallet.layer.borderColor = [UIColor grayColor].CGColor;
    _btnPaymentMyWallet.layer.borderWidth = 0.5;
}
@end
