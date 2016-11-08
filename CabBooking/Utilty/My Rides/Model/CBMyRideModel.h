//
//  CBMyRideModel.h
//  CabBooking
//
//  Created by Nirma on 20/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCarModel.h"
#import "CBMyRideInvoiceModel.h"

@interface CBMyRideModel : CBBaseModel

@property(nonatomic,strong)NSString *crnNo;
@property(nonatomic,strong)NSString *dateTime;
@property(nonatomic,strong)NSString *sourceAddress;
@property(nonatomic,strong)NSString *destAddress;
@property(nonatomic,strong)CBCarModel *bookedCab;
@property(nonatomic,assign)int rideStatus;
@property(nonatomic,assign)float totalFare;

//detail
@property(nonatomic,strong)NSString <Optional> *pickUpTime;
@property(nonatomic,strong)NSString <Optional> *dropTime;
@property(nonatomic,strong)NSString <Optional> *totalDistance;
@property(nonatomic,strong)NSString <Optional> *travelTime;
@property(nonatomic,assign)float rateByYou;
@property(nonatomic,assign)double sourceLatitude;
@property(nonatomic,assign)double sourceLongitude;
@property(nonatomic,assign)double destLatitude;
@property(nonatomic,assign)double destLongitude;
@property(nonatomic,strong)NSString <Optional> *mapImage;
@property(nonatomic,strong)NSString <Optional> *paymentMode;
@property(nonatomic,strong)CBMyRideInvoiceModel <Optional> *invoice;

@end
