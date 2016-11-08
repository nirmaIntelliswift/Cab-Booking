//
//  CBCarDetailView.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCarDetailView.h"
#define kGET_FARE_BUTTON_HEIGHT 30
@implementation CBCarDetailView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTopSeprator];
        [self addCarCategory];
        [self addCarAwayTime];
        //[self addTravelTime];
       // [self addFare];
        //[self addSize];
        [self addApplyCouponButton];
        [self addRateButton];
        [self addGetFareButton];
        //[self addBottomSeprator];
        [self addTimeFareAndSize];
        _lblCarCategory.text = @"Compact";
        _lblCarAwayTime.text = @"1 min away";
        _lblTravelTime.text = @"Travel Time:\n --";
         _lblFare.text = @"Min Fare:\n --";
         _lblMinSize.text = @"Max Size:\n --";
        [self setTime:1.2];
        [self setFare:280];
        [self setSize:4];
    }
    return self;
}
-(void)addBottomSeprator{
    _viewBottomSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:_viewBottomSepratorLine];
    [_viewBottomSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewBottomSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewBottomSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_viewBottomSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addTopSeprator{
    _viewTopSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:_viewTopSepratorLine];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_viewTopSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addCarCategory{
    _lblCarCategory = [UILabel new];
    [self addSubview:_lblCarCategory];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    _lblCarCategory.font = [UIFont fontWithName:FONT_MEDIUM size:18];
}
-(void)addCarAwayTime{
    _lblCarAwayTime = [UILabel new];
    [self addSubview:_lblCarAwayTime];
    [_lblCarAwayTime autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_lblCarCategory withOffset:5];
    [_lblCarAwayTime autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblCarCategory];
    _lblCarAwayTime.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _lblCarAwayTime.textColor = [UIColor grayColor];
}
-(void)addTimeFareAndSize{
    UIView *centerStackViewView = [UIView new];
    [self addSubview: centerStackViewView];
    [centerStackViewView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [centerStackViewView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblCarCategory withOffset:8];
    [centerStackViewView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnFareEstimate withOffset:-8];
     [centerStackViewView autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnRateCard withOffset:-15];
    
    
    _lblTravelTime = [UILabel new];
    [centerStackViewView addSubview:_lblTravelTime];
    [_lblTravelTime autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_lblTravelTime autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
   
    
    _lblFare = [UILabel new];
    [centerStackViewView addSubview:_lblFare];
    [_lblFare autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblTravelTime];
    [_lblFare autoAlignAxisToSuperviewAxis:ALAxisVertical];
    //[_lblFare autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_lblTravelTime withOffset:12];
   
    
    _lblMinSize = [UILabel new];
    [centerStackViewView addSubview:_lblMinSize];
    [_lblMinSize autoAlignAxis:ALAxisBaseline toSameAxisOfView:_lblTravelTime];
    [_lblMinSize autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    //[_lblMinSize autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_lblFare withOffset:12];
    
    
    _lblMinSize.font = _lblTravelTime.font = _lblFare.font  =[UIFont fontWithName:FONT_REGULAR size:12];
    _lblMinSize.numberOfLines = _lblFare.numberOfLines = _lblTravelTime.numberOfLines = 2;

}
-(void)addTravelTime{
   }
-(void)addFare{
    
}
-(void)addSize{
    
}
-(void)addGetFareButton{
    _btnFareEstimate = [UIButton new];
    [self addSubview:_btnFareEstimate];
    [_btnFareEstimate autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [_btnFareEstimate autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnRateCard withOffset:-10];
     [_btnFareEstimate autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_btnFareEstimate autoSetDimension:ALDimensionHeight toSize:kGET_FARE_BUTTON_HEIGHT];
    _btnFareEstimate.layer.borderColor = [UIColor grayColor].CGColor;
    _btnFareEstimate.layer.borderWidth = 0.5 ;
    [self setGetEstimateButton];
}
-(void)addRateButton{
    _btnRateCard = [CBUtility btnWithTopImage:@"ic_rate_card" btnName:@"Rate Card"];
    [self addSubview:_btnRateCard];
    [_btnRateCard autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnApplyCoupon withOffset:0.5];
    [_btnRateCard autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_btnRateCard autoSetDimensionsToSize:CGSizeMake(63, 63)];
    
    
}
-(void)addApplyCouponButton{
    _btnApplyCoupon = [CBUtility btnWithTopImage:@"ic_rate_card" btnName:@"Apply Coupon"];
    [self addSubview:_btnApplyCoupon];
    [_btnApplyCoupon autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
     [_btnApplyCoupon autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [_btnApplyCoupon autoSetDimensionsToSize:CGSizeMake(63, 63)];
  
    
}
-(UIButton*)btnWithTopImage:(NSString*)imageName
                    btnName:(NSString*)title{
    UIButton *btn = [UIButton new];
    UIImageView *image = [UIImageView new];
    [btn addSubview:image];
    [image autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    [image autoSetDimensionsToSize:CGSizeMake(20, 20)];
    [image autoAlignAxisToSuperviewAxis:ALAxisVertical];
    image.image = [UIImage imageNamed:imageName];
    
    UILabel *lblTitle = [UILabel new];
    [btn addSubview:lblTitle];
    [lblTitle autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [lblTitle autoAlignAxisToSuperviewAxis:ALAxisVertical];
    lblTitle.text = title;
    lblTitle.font = [UIFont fontWithName:FONT_LIGHT size:8];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    return btn;
}
-(void)setTime:(float)timeVal{
    _lblTravelTime.attributedText = [self getValueString1:@"Travel Time:" String2:[NSString stringWithFormat:@"\n%.2f Min",timeVal]];
    _lblTravelTime.textAlignment = NSTextAlignmentCenter;
}
-(void)setFare:(float)fareVal{
     _lblFare.attributedText = [self getValueString1:@"Min Fare: " String2:[NSString stringWithFormat:@"\n$%.2f",fareVal]];
    _lblFare.textAlignment = NSTextAlignmentCenter;
}
-(void)setSize:(int)sizeVal{
    _lblMinSize.attributedText = [self getValueString1:@"Max Size:" String2:[NSString stringWithFormat:@"\n%d People",sizeVal]];
    _lblMinSize.textAlignment = NSTextAlignmentCenter;
}
-(void)setEstimatedFare:(NSString*)fare{
    NSMutableAttributedString *header = [[NSMutableAttributedString alloc]initWithString:@"Estimated fare\n"];
    NSMutableAttributedString *headerVal = [[NSMutableAttributedString alloc]initWithString:fare];
    
    [header addAttribute:NSFontAttributeName
                   value:[UIFont fontWithName:FONT_REGULAR size:10]//Lato-Bold, Your font name crahes
                   range:NSMakeRange(0,header.length)];
    [header addAttribute:NSForegroundColorAttributeName
                   value:[UIColor grayColor]//Lato-Bold, Your font name crahes
                   range:NSMakeRange(0,header.length)];
    [headerVal addAttribute:NSFontAttributeName
                      value:[UIFont fontWithName:FONT_REGULAR size:14]//Lato-Bold, Your font name crahes
                      range:NSMakeRange(0,headerVal.length)];
    [header appendAttributedString:headerVal];
    _btnFareEstimate.titleLabel.numberOfLines = 2;
    [_btnFareEstimate setAttributedTitle:header forState:UIControlStateDisabled];
    [_btnFareEstimate setEnabled:NO];
    _btnFareEstimate.titleLabel.textAlignment = NSTextAlignmentCenter;
}
-(void)setGetEstimateButton{
    [_btnFareEstimate setTitle:@"GET  FARE  ESTIMATE" forState:UIControlStateNormal];
    [_btnFareEstimate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btnFareEstimate.titleLabel.font = [UIFont fontWithName:FONT_REGULAR size:12];
     [_btnFareEstimate setEnabled:YES];
}
-(NSMutableAttributedString*)getValueString1:(NSString*)str1
                           String2:(NSString*)str2{
    NSMutableAttributedString *header = [[NSMutableAttributedString alloc]initWithString:str1];
    NSMutableAttributedString *headerVal = [[NSMutableAttributedString alloc]initWithString:str2];
    [header addAttribute:NSFontAttributeName
                   value:[UIFont fontWithName:FONT_REGULAR size:10]//Lato-Bold, Your font name crahes
                   range:NSMakeRange(0,header.length)];
    [headerVal addAttribute:NSFontAttributeName
                      value:[UIFont fontWithName:FONT_REGULAR size:11]//Lato-Bold, Your font name crahes
                      range:NSMakeRange(0,headerVal.length)];
    [header appendAttributedString:headerVal];
    return header;
}
-(void)fillCarCategoryData:(CBCarCategoryModel*)carCategory{
    _lblCarCategory.text = carCategory.categoryTitle;
    _lblCarAwayTime.text = carCategory.eta;
    _lblTravelTime.text = @"Travel Time:\n --";
    _lblFare.text = @"Min Fare:\n --";
    _lblMinSize.text = @"Max Size:\n --";
     [self setFare:carCategory.minFare];
     [self setSize:carCategory.maxPerson];
    [self setGetEstimateButton];

}
-(void)fillRideEstimationData:(CBRideEstimationModel*)rideEstimation{
    [self setTime:[rideEstimation.travelTime floatValue]];
   
}
@end
