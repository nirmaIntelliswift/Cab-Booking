//
//  CBMenuCell.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBBaseUITableCell.h"
#import "CBUIImageView.h"

@interface CBMenuCell : CBBaseUITableCell

@property(nonatomic ,strong)CBUIImageView *imgItem;
@property(nonatomic ,strong)UILabel *lblItemName;
@property(nonatomic ,strong)UILabel *lblItemAmount;
@end
