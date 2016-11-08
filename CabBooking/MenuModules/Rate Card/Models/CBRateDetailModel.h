//
//  CBRateDetailModel.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBRateDetailModel : CBBaseModel

@property (nonatomic, strong) NSString  *rateType;
@property (nonatomic, strong) NSString  *rateName;
@property (nonatomic, strong) NSString  *rate;
@property (nonatomic, strong) NSString  *rateDesc;


@end
