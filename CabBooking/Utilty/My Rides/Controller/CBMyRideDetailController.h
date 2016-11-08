//
//  CBMyRideDetailController.h
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseViewController.h"
#import "CBMyRideView.h"
#import "CBMyRideDetailModel.h"

@interface CBMyRideDetailController : CBBaseViewController<GMSMapViewDelegate>{
    CBMyRideDetailModel  *dataMyRide;
    CBMyRideView *myRideView;
}

@end
