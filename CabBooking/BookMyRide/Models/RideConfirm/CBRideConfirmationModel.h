//
//  CBRideConfirmationModel.h
//  CabBooking
//
//  Created by Nirma on 19/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBCarModel.h"
@interface CBRideConfirmationModel : CBBaseModel
@property(nonatomic,strong)CBCarModel  *bookedCab;
@property(nonatomic,strong)NSString *crnNo;
@end
