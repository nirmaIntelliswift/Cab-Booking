//
//  CBErrorModel.h
//  CabBooking
//
//  Created by Nirma on 05/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CBErrorModel : JSONModel

@property(nonatomic,strong)NSString  *errorCode;
@property(nonatomic,strong)NSString  *message;

@end
