//
//  CBRideFare.h
//  CabBooking
//
//  Created by Nirma on 14/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBRideFareModel : CBBaseModel

@property(nonatomic,assign)unsigned int categoryId;
@property(nonatomic,strong)NSString *fare;

@end
