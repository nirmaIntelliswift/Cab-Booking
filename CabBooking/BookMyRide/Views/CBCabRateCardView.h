//
//  CBCabRateCardView.h
//  CabBooking
//
//  Created by Nirma on 04/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUIView.h"

@interface CBCabRateCardView : CBBaseUIView

@property(nonatomic, strong)UILabel *lblHeading;
@property(nonatomic, strong)UILabel *lblBaseFare;
@property(nonatomic, strong)UILabel *lblRatePerKm;
@property(nonatomic, strong)UILabel *lblRidePerTime;
@property(nonatomic, strong)UILabel *lblPeakTimeCharge;
@property(nonatomic, strong)UILabel *lblFooterNotice;
@property(nonatomic, strong)UIImageView *imgCab;

@end
