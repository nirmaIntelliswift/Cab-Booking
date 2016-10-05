//
//  CBCarModel.h
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBCarModel : CBBaseModel

@property(nonatomic,strong)NSString *cabId;
@property(nonatomic,assign) double latitude;
@property(nonatomic,assign) double  longitude;
//{"cab_id":"100","latitude":19.454577878887,"longitude":72.56565658223},{"cab_id":"101","latitude":19.454898331132,"longitude":72.54321789531}

@end
