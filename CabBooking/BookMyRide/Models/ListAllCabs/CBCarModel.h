//
//  CBCarModel.h
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBCarModel : CBBaseModel

@property(nonatomic,strong)NSString <Optional> *cabId;
@property(nonatomic,assign) double latitude;
@property(nonatomic,assign) double  longitude;
@property(nonatomic,strong) NSString <Optional> *cabRegNo;
@property(nonatomic,strong) NSString <Optional> *cabColor;
@property(nonatomic,strong) NSString <Optional> *cabModel;
@property(nonatomic,strong) NSString <Optional> *driverName;
@property(nonatomic,strong) NSString <Optional> *eta;
@property(nonatomic,strong) NSString <Optional> *driverImage;
@property(nonatomic,assign) float cabRating;


@end
