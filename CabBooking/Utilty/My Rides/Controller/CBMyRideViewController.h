//
//  CBMyRideViewController.h
//  CabBooking
//
//  Created by Nirma on 20/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontTableController.h"
#import "CBMyRideCell.h"
#import "CBRidesHistory.h"

@interface CBMyRideViewController : CBBaseFrontTableController{
    CBRidesHistory *dataMyRides;
}

@end
