//
//  CBMenuModel.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBMenuModel : NSObject

@property(nonatomic,strong)NSString *itemImageName;
@property(nonatomic,strong)NSString *itemName;
@property(nonatomic,assign)int itemAmount;
@end
