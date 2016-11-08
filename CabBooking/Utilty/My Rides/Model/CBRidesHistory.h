//
//  CBRidesHistory.h
//  CabBooking
//
//  Created by Nirma on 20/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBMyRideModel.h"
@protocol CBMyRideModel;

@interface CBRidesHistory : CBBaseModel

@property(nonatomic,strong)NSMutableArray <CBMyRideModel> *rides;

@end
