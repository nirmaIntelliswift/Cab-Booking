//
//  CBDriverDetailView.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBDriverDetailView.h"

#define kPAYMENT_BUTTON_HEIGHT 40
#define kPHOTO_SIZE 50
@implementation CBDriverDetailView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTopSeprator];
        [self addPhoto];
        [self addRateImage];
        [self addRateLabel];
        [self addDriverNameLabel];
        [self addDriverCarTypeLabel];
        [self addDriverCarNumberLabel];
        [self addMyWalletButton];
        [self addCashButton];
        [self addSelectPayment];
        [self addShareButton];
        [self addCallButton];
    }
    return self;
}
-(void)addTopSeprator{
    _viewSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:_viewSepratorLine];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addPhoto{
    _imgDriverPhoto = [UIImageView new];
    [self addSubview:_imgDriverPhoto];
    [_imgDriverPhoto autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_imgDriverPhoto autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:-kPAYMENT_BUTTON_HEIGHT/2];;
    [_imgDriverPhoto autoSetDimensionsToSize:CGSizeMake(kPHOTO_SIZE, kPHOTO_SIZE)];
    _imgDriverPhoto.layer.cornerRadius = kPHOTO_SIZE/2;
    _imgDriverPhoto.backgroundColor = [UIColor grayColor];
}
-(void)addRateImage{
    UIImage *rateImage = [UIImage imageNamed:@"ic_favorite"];
    _imgRate = [UIImageView new];
    [self addSubview:_imgRate];
    [_imgRate autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgDriverPhoto withOffset:8];
    [_imgRate autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_imgRate autoSetDimensionsToSize:rateImage.size];
    _imgRate.image = rateImage;
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
    _btnShareDirection = [CBUtility btnWithTopImage:@"ic_share_direction" btnName:@"Share Direction"];
    [self addSubview:_btnShareDirection];
    [_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    //[_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_btnShareDirection autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_btnShareDirection autoSetDimension:ALDimensionWidth toSize:70];
    [_btnShareDirection autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnPaymentMyWallet withOffset:-10];
}
-(void)addCallButton{
    _btnCalldriver = [CBUtility btnWithTopImage:@"ic_call" btnName:@"Call Driver"];
    [self addSubview:_btnCalldriver];
    [_btnCalldriver autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnShareDirection withOffset:0.5];
    [_btnCalldriver autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnPaymentMyWallet withOffset:-10];
    [_btnCalldriver autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_btnCalldriver autoSetDimension:ALDimensionWidth toSize:70];

    
    
}
-(void)addMyWalletButton{
    _btnPaymentMyWallet = [[CBButtonWithLeftImage alloc]initWithLeftImageName:@"ic_my_wallet" rightImageName:@"unselect-checkbox" title:@"My Wallet" withSideMargin:12];
    [self addSubview:_btnPaymentMyWallet];
    [_btnPaymentMyWallet autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:-0.5];
    [_btnPaymentMyWallet autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self withMultiplier:0.34];
    [_btnPaymentMyWallet autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnPaymentMyWallet autoSetDimension:ALDimensionHeight toSize:kPAYMENT_BUTTON_HEIGHT];
    _btnPaymentMyWallet.lblTitle.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _btnPaymentMyWallet.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnPaymentMyWallet.layer.borderWidth = 0.5;
}
-(void)addCashButton{
    _btnPaymentCash = [[CBButtonWithLeftImage alloc]initWithLeftImageName:@"ic_cash" rightImageName:@"select-checkbox" title:@"Cash" withSideMargin:12];
    [self addSubview:_btnPaymentCash];
    [_btnPaymentCash autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnPaymentMyWallet withOffset:0.5];
    [_btnPaymentCash autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self withMultiplier:0.33];
    [_btnPaymentCash autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnPaymentCash autoSetDimension:ALDimensionHeight toSize:kPAYMENT_BUTTON_HEIGHT];
     _btnPaymentCash.lblTitle.font = _btnPaymentMyWallet.lblTitle.font;
    _btnPaymentCash.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _btnPaymentCash.layer.borderWidth = 0.5;
}
-(void)addSelectPayment{
    _lblSelectPayment = [UILabel new];;
    _lblSelectPayment.textAlignment = NSTextAlignmentJustified;
    [self addSubview:_lblSelectPayment];
    [_lblSelectPayment autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnPaymentCash withOffset:0.5];
    [_lblSelectPayment autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:-0.5];
    [_lblSelectPayment autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_lblSelectPayment autoSetDimension:ALDimensionHeight toSize:kPAYMENT_BUTTON_HEIGHT];
   _lblSelectPayment.font = _btnPaymentMyWallet.lblTitle.font;
    _lblSelectPayment.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lblSelectPayment.layer.borderWidth = 0.5;
    _lblSelectPayment.text = @"  Select Payment";
}
@end
