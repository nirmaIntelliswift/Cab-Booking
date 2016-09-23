//
//  CBCarDetailView.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBUtility.h"
IB_DESIGNABLE
@interface CBCarDetailView : UIView

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
IBInspectable
@property(nonatomic,strong)UIButton *btnFareEstimate;
IBInspectable
@property(nonatomic,strong)UIButton *btnRateCard;
IBInspectable
@property(nonatomic,strong)UIButton *btnApplyCoupon;
@end
