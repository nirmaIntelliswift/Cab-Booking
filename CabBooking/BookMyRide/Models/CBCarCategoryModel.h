//
//  CBCarCategoryModel.h
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCarModel.h"
@protocol CBCarModel;
@interface CBCarCategoryModel : CBBaseModel

@property(nonatomic,assign)unsigned int categoryId;
@property(nonatomic,strong)NSMutableArray <CBCarModel> *cabs;
@property(nonatomic,strong)NSString *categoryTitle;
@property(nonatomic,assign)unsigned int maxPerson;
@property(nonatomic,assign)unsigned int minFare;
//@property(nonatomic,assign)unsigned int baseDistance;
@property(nonatomic,assign)unsigned int timeRate;
@property(nonatomic,strong)NSString *eta;
@property(nonatomic,strong)NSString *kmFare;
@property(nonatomic,assign)BOOL isSelected;


@end
