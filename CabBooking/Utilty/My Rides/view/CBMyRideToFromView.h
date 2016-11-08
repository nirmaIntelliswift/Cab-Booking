//
//  CBMyRideToFromView.h
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "CBSepratorLine.h"
@interface CBMyRideToFromView : UIView

@property(nonatomic ,strong)UIImageView *imgLocationIndicator;
@property(nonatomic ,strong)UILabel *lblTravelFromTime;
@property(nonatomic ,strong)UILabel *lblTravelToTime;
@property(nonatomic ,strong)UILabel *lblTravelFrom;
@property(nonatomic ,strong)UILabel *lblTravelTo;
@property(nonatomic ,strong)CBSepratorLine *viewSepratorLine;

-(void)setData:(id)data;
@end
