//
//  CBAllCabsModel.h
//  CabBooking
//
//  Created by Nirma on 05/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCarModel.h"
@protocol CBCarModel;

@interface CBAllCabsModel : CBBaseModel

@property(nonatomic,strong)NSMutableArray <CBCarModel> *cabs;
@end
