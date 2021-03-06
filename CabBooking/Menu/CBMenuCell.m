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
        _imgItem = [[CBUIImageView alloc]init];
        _lblItemAmount = [UILabel new];
        _lblItemName= [UILabel new];
        
        [self.contentView addSubview:_imgItem];
        [self.contentView addSubview:_lblItemAmount];
        [self.contentView addSubview:_lblItemName];
        
        [_imgItem autoSetDimensionsToSize:CGSizeMake(IMAGE_SIZE, IMAGE_SIZE)];
        [_imgItem autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_imgItem autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:LEFT_MARGIN];
        
        [_lblItemName autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_lblItemName autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgItem withOffset:13];
        
        [_lblItemAmount autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_lblItemAmount autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:LEFT_MARGIN];
        _lblItemName.text = @"Book Your Ride";
       // _lblItemAmount.text = @"500";
        
        [_lblItemName setFont:[UIFont fontWithName:SANFRANSISCO_REGULAR size:16]];
        [_lblItemAmount setFont:[UIFont fontWithName:FONT_MEDIUM size:12]];
        _lblItemName.textColor = [UIColor blackColor];;
        _lblItemAmount.textColor = [UIColor grayColor];
    }
    return self;
}
-(void)setData:(id)data{
    CBMenuModel *item = (CBMenuModel*)data;
    _lblItemName.text = item.itemName;
    
    //_lblItemAmount.text = [NSString stringWithFormat:@"%d",item.itemAmount];
    _imgItem.image = [UIImage imageNamed:item.itemImageName];
    //_imgItem.layer.borderColor = [UIColor clearColor].CGColor;
    //_imgItem.layer.borderWidth = 0.0;
     _imgItem.image = [_imgItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _imgItem.tintColor =   _lblItemName.textColor = [UIColor blackColor];
    if (item.isSelected) {
        //_imgItem.layer.borderColor = UIColorFromRGB(COLOR_PINK).CGColor;
        //_imgItem.layer.borderWidth = 1;
         _imgItem.tintColor = _lblItemName.textColor =  UIColorFromRGB(COLOR_PINK);
    }
}
@end
