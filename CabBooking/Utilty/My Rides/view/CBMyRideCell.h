//
//  CBMyRideCell.h
//  CabBooking
//
//  Created by Nirma on 20/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUITableCell.h"
#import "CBUIImageView.h"
@interface CBMyRideCell : CBBaseUITableCell

@property(nonatomic ,strong)CBUIImageView *imgUserPhoto;
@property(nonatomic ,strong)CBUIImageView *imgLocationIndicator;
@property(nonatomic ,strong)UILabel *lblTravelTime;
@property(nonatomic ,strong)UILabel *lblTravelBy;
@property(nonatomic ,strong)UILabel *lblTravelFrom;
@property(nonatomic ,strong)UILabel *lblTravelTo;
@property(nonatomic ,strong)UILabel *lblTravelAmount;

@end
