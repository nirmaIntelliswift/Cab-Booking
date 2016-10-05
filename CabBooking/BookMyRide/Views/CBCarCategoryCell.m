//
//  CBCarCategoryCell.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBCarCategoryCell.h"
@implementation CBCarCategoryCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCarAwayTime];
        [self addCarImage];
        [self addCarCategory];
        [self addSideSepratar];
        [self addBottomSeprator];
        [self addTopSeprator];
        //[self addTopUnselectedView];
        
        //self.contentView.layer.borderWidth = 0.5;
        //self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}
-(void)addTopUnselectedView{
    _viewTopFaded = [UIView new];
    [self.contentView addSubview:_viewTopFaded];
    [_viewTopFaded autoPinEdgesToSuperviewEdges];
    _viewTopFaded.backgroundColor = [UIColor whiteColor];
}
-(void)addCarImage{
    UIImage *image = [UIImage imageNamed:@"compact"];
    _imgCar = [UIImageView new];
    [self.contentView addSubview:_imgCar];
    [_imgCar autoSetDimensionsToSize:image.size];
    [_imgCar autoCenterInSuperview];
    _imgCar.image = image;
    _imgCar.tintColor = [UIColor blackColor];
}
-(void)addCarAwayTime{
    _lblCarAwayTime = [UILabel new];
    [self.contentView addSubview:_lblCarAwayTime];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
    [_lblCarAwayTime autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
    _lblCarAwayTime.text = @"1 Min Away";
    _lblCarAwayTime.font = [UIFont fontWithName:FONT_REGULAR size:10];
    _lblCarAwayTime.textAlignment = NSTextAlignmentCenter;
    _lblCarAwayTime.textColor = [UIColor grayColor];
}
-(void)addCarCategory{
    _lblCarCategory = [UILabel new];
    [self.contentView addSubview:_lblCarCategory];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
    [_lblCarCategory autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:5];
     _lblCarCategory.text = @"Compact";
    _lblCarCategory.font = [UIFont fontWithName:FONT_MEDIUM size:10];
    _lblCarCategory.textAlignment = NSTextAlignmentCenter;
}
-(void)addSideSepratar{
    _sideSepratar = [[CBSepratorLine alloc]init];
    [self.contentView addSubview:_sideSepratar];
    [_sideSepratar autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_sideSepratar autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_sideSepratar autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_sideSepratar autoSetDimension:ALDimensionWidth toSize:0.5];

}
-(void)addTopSeprator{
    _viewTopSepratorLine = [[CBSepratorLine alloc]init];
    [self.contentView addSubview:_viewTopSepratorLine];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewTopSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_viewTopSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addBottomSeprator{
    _bottomSepratar = [[CBSepratorLine alloc]init];
    [self.contentView addSubview:_bottomSepratar];
    [_bottomSepratar autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_bottomSepratar autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_bottomSepratar autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_bottomSepratar autoSetDimension:ALDimensionHeight toSize:5];
    _bottomSepratar.backgroundColor = UIColorFromRGB(COLOR_BLUE);
}
-(void)setCarSelected:(BOOL)selected{
    if (selected) {
        [self fadeOut];
    }
    else{
        [self fadeIn];
    }
}
-(void)fadeIn{
    //_viewTopFaded.alpha = 0.5;
    UIImage *image = [UIImage imageNamed:@"compact"];
    _imgCar.image = image;
    _bottomSepratar.backgroundColor = [UIColor clearColor];
    _lblCarCategory.textColor = [UIColor grayColor];
}
-(void)fadeOut{
   // _viewTopFaded.alpha = 0.0;
    UIImage *image = [UIImage imageNamed:@"compactEnable"];
    _imgCar.image = image;
    _bottomSepratar.backgroundColor = UIColorFromRGB(COLOR_BLUE);
     _lblCarCategory.textColor = [UIColor blackColor];
}
-(void)setData:(id)data{
    CBCarCategoryModel *carCategory = (CBCarCategoryModel*)data;
    _lblCarCategory.text = carCategory.categoryTitle;
    _lblCarAwayTime.text = carCategory.eta;
}
@end
