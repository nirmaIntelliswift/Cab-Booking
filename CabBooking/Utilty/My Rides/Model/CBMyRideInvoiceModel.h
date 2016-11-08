//
//  CBMyRideInvoiceModel.h
//  CabBooking
//
//  Created by Nirma on 24/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBMyRideInvoiceModel : CBBaseModel
@property(nonatomic,strong)NSString *invoiceNo;
@property(nonatomic,strong)NSString *couponCode;
@property(nonatomic,assign)float totalAmount;
@property(nonatomic,assign)float serviceTax;
@property(nonatomic,assign)float discount;
@property(nonatomic,assign)float roundedOff;
@property(nonatomic,assign)float netAmount;



@end
