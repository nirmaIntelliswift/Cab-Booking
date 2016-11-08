//
//  CBOffersModel.h
//  CabBooking
//
//  Created by Nirma on 25/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBOfferModel.h"

@protocol CBOfferModel;

@interface CBOffersModel : CBBaseModel

@property(nonatomic,strong)NSMutableArray <CBOfferModel> *offers;

@end
