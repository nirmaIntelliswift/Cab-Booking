//
//  CBContactModel.h
//  CabBooking
//
//  Created by Nirma on 25/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBContactModel : CBBaseModel

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *number;
@property(nonatomic,assign)int id;
@property(nonatomic,assign)BOOL shareFlag;


@end
