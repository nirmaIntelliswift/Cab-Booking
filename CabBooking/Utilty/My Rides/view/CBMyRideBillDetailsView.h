//
//  CBMyRideBillDetailsView.h
//  CabBooking
//
//  Created by Nirma on 24/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "CBSepratorLine.h"
#import "CBMyRideModel.h"

@interface CBMyRideBillDetailsView : UIView

@property (nonatomic ,assign)CGFloat heightView;
-(id)initWithFrame:(CGRect)frame
              data:(CBMyRideModel*)ride;

@end
