//
//  CBMenuCell.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMenuCell.h"
#import "CBMenuModel.h"

#define LEFT_MARGIN 10
#define IMAGE_SIZE 20

@implementation CBMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgItem = [[UIImageView alloc]init];
        _lblItemAmount = [UILabel new];
        _lblItemName= [UILabel new];
        
        [self.contentView addSubview:_imgItem];
        [self.contentView addSubview:_lblItemAmount];
        [self.contentView addSubview:_lblItemName];
        
        [_imgItem autoSetDimensionsToSize:CGSizeMake(IMAGE_SIZE, IMAGE_SIZE)];
        [_imgItem autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_imgItem autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:LEFT_MARGIN];
        
        [_lblItemName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_lblItemName autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgItem withOffset:10];
        
        [_lblItemAmount autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_lblItemAmount autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:LEFT_MARGIN];
        _lblItemName.text = @"Book Your Ride";
       // _lblItemAmount.text = @"500";
        
        [_lblItemName setFont:[UIFont fontWithName:FONT_MEDIUM size:14]];
        [_lblItemAmount setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        _lblItemName.textColor = _lblItemAmount.textColor = [UIColor grayColor];
    }
    return self;
}
-(void)setData:(id)data{
    CBMenuModel *item = (CBMenuModel*)data;
    _lblItemName.text = item.itemName;
    
    //_lblItemAmount.text = [NSString stringWithFormat:@"%d",item.itemAmount];
    _imgItem.image = [UIImage imageNamed:item.itemImageName];
}
@end
