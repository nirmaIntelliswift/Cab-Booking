//
//  CBEmergencyContactsModel.h
//  CabBooking
//
//  Created by Nirma on 25/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBContactModel.h"
@protocol CBContactModel;

@interface CBEmergencyContactsModel : CBBaseModel
@property(nonatomic,strong)NSMutableArray <CBContactModel> *contacts;

@end
