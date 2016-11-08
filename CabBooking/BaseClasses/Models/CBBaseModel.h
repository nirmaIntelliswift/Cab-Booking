//
//  CBBaseModel.h
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "Constants.h"
#import <UIKit/UIKit.h>

@interface CBBaseModel : JSONModel

@property(nonatomic,strong)NSString <Optional> *status;
@property(nonatomic,strong)NSString <Optional> *message;
@property(nonatomic,strong)NSString <Optional> *serverTime;

@end
