//
//  CBOffersCell.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUITableCell.h"
@interface CBOffersCell : CBBaseUITableCell

@property(nonatomic ,strong)UILabel *lblOffer;
@property(nonatomic ,strong)UILabel *lblOfferDetail;
@property(nonatomic ,strong)UILabel *lblOfferCode;
@property(nonatomic ,strong)UILabel *lblOfferExpiryDate;
@end
