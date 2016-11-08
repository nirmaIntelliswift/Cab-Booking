//
//  CBRideEstimation.h
//  CabBooking
//
//  Created by Nirma on 14/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@protocol CBRideFareModel;

@interface CBRideEstimationModel : CBBaseModel

@property(nonatomic,strong)NSString *travelTime;
@property(nonatomic,strong)NSString *distance;
@property(nonatomic,strong)NSMutableArray <CBRideFareModel> *estimateFare;

@end
