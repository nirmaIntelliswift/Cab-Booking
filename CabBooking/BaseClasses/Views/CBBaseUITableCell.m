//
//  CBBaseUITableCell.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUITableCell.h"


@implementation CBBaseUITableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)addHorizonatalSeprator{
     _viewSepratorLine = [[CBSepratorLine alloc]init];
     [self.contentView addSubview:_viewSepratorLine];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}

@end
