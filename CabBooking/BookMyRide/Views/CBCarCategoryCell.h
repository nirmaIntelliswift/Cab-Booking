//
//  CBCarCategoryCell.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseCollectionCell.h"
#import "CBCarCategoryModel.h"
#import "CBUIImageView.h"

@interface CBCarCategoryCell : CBBaseCollectionCell

#pragma mark UILabels
@property(nonatomic,strong)UILabel *lblCarAwayTime;
@property(nonatomic,strong)UILabel *lblCarCategory;

#pragma mark UIImageViews
@property(nonatomic,strong)CBUIImageView *imgCar;

@property(nonatomic,strong)CBSepratorLine *sideSepratar;
@property(nonatomic,strong)CBSepratorLine *bottomSepratar;

@property(nonatomic,strong)UIView *viewTopFaded;
IBInspectable
@property(nonatomic,strong)CBSepratorLine *viewTopSepratorLine;
-(void)setCarSelected:(BOOL)selected;
@end
