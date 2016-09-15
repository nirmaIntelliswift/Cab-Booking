//
//  CBMenuCell.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBBaseUITableCell.h"
#import <PureLayout/PureLayout.h>
#import "Constants.h"
@interface CBMenuCell : CBBaseUITableCell

@property(nonatomic ,strong)UIImageView *imgItem;
@property(nonatomic ,strong)UILabel *lblItemName;
@property(nonatomic ,strong)UILabel *lblItemAmount;
@end
