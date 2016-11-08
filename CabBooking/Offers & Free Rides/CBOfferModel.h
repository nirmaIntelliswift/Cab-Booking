//
//  CBOfferModel.h
//  CabBooking
//
//  Created by Nirma on 25/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseModel.h"

@interface CBOfferModel : CBBaseModel

@property(nonatomic,strong)NSString *offerId;
@property(nonatomic,strong)NSString *offerHeading;
@property(nonatomic,strong)NSString *offerSubtext;
@property(nonatomic,strong)NSString *expiresOn;
@property(nonatomic,strong)NSString *promoCode;
@property(nonatomic,assign)int offerStatus;

@end
