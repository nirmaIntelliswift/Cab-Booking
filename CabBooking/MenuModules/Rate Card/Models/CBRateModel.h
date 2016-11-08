//
//  CBRateModel.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBRateDetailModel.h"

@protocol CBRateDetailModel;

@interface CBRateModel : CBBaseModel

@property (nonatomic, strong ) NSMutableArray <CBRateDetailModel> *standardRate;
@property (nonatomic, strong ) NSMutableArray <CBRateDetailModel> *extraCharges;




@end
