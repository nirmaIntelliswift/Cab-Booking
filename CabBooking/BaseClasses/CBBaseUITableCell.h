//
//  CBBaseUITableCell.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "Constants.h"
#import "CBSepratorLine.h"
@interface CBBaseUITableCell : UITableViewCell
@property(nonatomic ,strong)CBSepratorLine *viewSepratorLine;
-(void)setData:(id)data;
-(void)addHorizonatalSeprator;
@end
