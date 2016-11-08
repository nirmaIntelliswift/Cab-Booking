//
//  CBCarDetailView.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBUtility.h"
#import "CBSepratorLine.h"
#import "CBCarCategoryModel.h"
#import "CBRideEstimationModel.h"
IB_DESIGNABLE
@interface CBCarDetailView : UIView

IBInspectable
@property(nonatomic,strong)CBSepratorLine *viewTopSepratorLine;
IBInspectable
@property(nonatomic,strong)CBSepratorLine *viewBottomSepratorLine;
#pragma mark UILabels
IBInspectable
@property(nonatomic,strong)UILabel *lblCarCategory;
IBInspectable
@property(nonatomic,strong)UILabel *lblCarAwayTime;
IBInspectable
@property(nonatomic,strong)UILabel *lblTravelTime;
IBInspectable
@property(nonatomic,strong)UILabel *lblFare;
IBInspectable
@property(nonatomic,strong)UILabel *lblMinSize;

#pragma mark UIButtons
IBInspectable
@property(nonatomic,strong)UIButton *btnFareEstimate;
IBInspectable
@property(nonatomic,strong)UIButton *btnRateCard;
IBInspectable
@property(nonatomic,strong)UIButton *btnApplyCoupon;


-(void)setEstimatedFare:(NSString*)fare;
-(void)fillCarCategoryData:(CBCarCategoryModel*)carCategory;
-(void)fillRideEstimationData:(CBRideEstimationModel*)rideEstimation;
@end
