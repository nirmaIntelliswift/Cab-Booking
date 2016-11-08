//
//  CBUserDataModel.h
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBUserDataModel : CBBaseModel

@property(nonatomic,strong)NSString *firstName;
@property(nonatomic,strong)NSString *lastName;
@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,assign)int mobile;
@property(nonatomic,assign)int offersCount;
@property(nonatomic,assign)float walletBalance;
@property(nonatomic,strong)NSString *imageUrl;

-(NSString*)getUserFullName;


@end
