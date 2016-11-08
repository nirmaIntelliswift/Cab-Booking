//
//  CBRateCardModel.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"
#import "CBRateModel.h"

@interface CBRateCardModel : CBBaseModel

@property (nonatomic, assign) int  categoryId;
@property (nonatomic, strong) NSString  *categoryName;
@property (nonatomic, strong) CBRateModel  *rate;


@end
