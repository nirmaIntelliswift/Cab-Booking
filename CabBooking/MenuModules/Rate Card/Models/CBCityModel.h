//
//  CBCityModel.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBRateCardModel.h"

@protocol CBRateCardModel;

@interface CBCityModel : CBBaseModel

@property (nonatomic, assign) int  id;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong ) NSMutableArray <CBRateCardModel> *rateCard;

-(CBRateCardModel*)getCabRateCard:(NSString*)cabCategory;

@end
