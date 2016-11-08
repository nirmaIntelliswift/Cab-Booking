//
//  CBRateCardView.m
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBRateCardView.h"

@implementation CBRateCardView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addCityTextField];
        [self addCityBottomSeprator];
        [self addCabCategoryTextField];
        [self addCabBottomSeprator];
    }
    return self;
}
-(void)addCityTextField{
    _tfCity = [UITextField new];
    [self addSubview:_tfCity];
    
    [_tfCity autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [_tfCity autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [_tfCity autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_tfCity autoSetDimension:ALDimensionHeight toSize:50];
    _tfCity.backgroundColor = [UIColor whiteColor];
    
    _tfCity.placeholder = @"" ;
    [_tfCity setLeftViewMode:UITextFieldViewModeAlways];
    _tfCity.leftView = [self getLeftView:@"CITY :"   withWidth:60];
}

-(void)addCityBottomSeprator{
    CBSepratorLine *viewSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:viewSepratorLine];
    [viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [viewSepratorLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_tfCity];
    [viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addCabBottomSeprator{
    CBSepratorLine *viewSepratorLine = [[CBSepratorLine alloc]init];
    [self addSubview:viewSepratorLine];
    [viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [viewSepratorLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_tfCabCategory];
    [viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
-(void)addCabCategoryTextField{
    _tfCabCategory = [UITextField new];
    [self addSubview:_tfCabCategory];
    
    [_tfCabCategory autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [_tfCabCategory autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [_tfCabCategory autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_tfCity withOffset:5];
    [_tfCabCategory autoSetDimension:ALDimensionHeight toSize:50];
    _tfCabCategory.backgroundColor = [UIColor whiteColor];
    [_tfCabCategory setLeftViewMode:UITextFieldViewModeAlways];
    _tfCabCategory.placeholder = @"" ;
    _tfCabCategory.leftView = [self getLeftView:@"CATEGORY :"  withWidth:100];
}

-(UILabel*)getLeftView:(NSString*)title withWidth:(CGFloat)width{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 50)];
    lable.text = title;
    lable.font = [UIFont fontWithName:FONT_REGULAR size:16];
    lable.textColor = [UIColor lightGrayColor];
    return lable;
}
@end
