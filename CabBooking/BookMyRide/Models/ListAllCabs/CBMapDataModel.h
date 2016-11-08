//
//  CBMapDataModel.h
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCarCategoryModel.h"
#import "CBRideCancelReasonModel.h"

@protocol CBCarCategoryModel;
@protocol CBRideCancelReasonModel;

@interface CBMapDataModel : CBBaseModel

@property(nonatomic,strong)NSMutableArray <CBCarCategoryModel> *cabCategory;
@property(nonatomic,strong)NSMutableArray <CBRideCancelReasonModel> *ridecancelReasons;

-(void)mapSelectCabCategoryOfIndex:(int)index;
-(CBCarCategoryModel*)getCabCategoryOfIndex:(int)index;
-(CBCarCategoryModel*)getSelectedCabCategory;
-(void)updateCabDetailsForCab:(CBCarModel*)cab;
-(void)updateLocationForCabs:(NSArray*)cabs;
@end
