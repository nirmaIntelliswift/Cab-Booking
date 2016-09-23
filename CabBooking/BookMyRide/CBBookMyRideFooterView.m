//
//  CBBookMyRideFooterView.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBookMyRideFooterView.h"
#import "Constants.h"
@implementation CBBookMyRideFooterView

-(id)init{
    self = [super init];
    if (self) {
       
        [self addBottomButton];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         self.backgroundColor = [UIColor clearColor];
        [self addBottomButton];
        [self addCurrentLocationView];
        //[self addCarDetailView];
        [self addCollectionViewCarCategory];
        
        [self addCarDetailView];
       // [self addDriverDetailView];
    }
    return self;
}
-(void)addBottomButton{
    _btnBottom = [UIButton new];
    [self addSubview:_btnBottom];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_btnBottom autoSetDimension:ALDimensionHeight toSize:50];
    _btnBottom.backgroundColor = UIColorFromRGB(COLOR_PINK);
    [_btnBottom setTitle:@"Ride Now" forState:UIControlStateNormal];
    
    
}
-(void)addCollectionViewCarCategory{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionCarCategories = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self setCarCategoryWithImageLayout];
    [_collectionCarCategories setShowsHorizontalScrollIndicator:NO];
    [self addSubview:_collectionCarCategories];
    [_collectionCarCategories autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_collectionCarCategories autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_collectionCarCategories autoSetDimension:ALDimensionHeight toSize:70];
    //[_collectionCarCategories autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewCarDetail withOffset:0];
    [_collectionCarCategories autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnBottom withOffset:1];
    _collectionCarCategories.backgroundColor = [UIColor whiteColor];//UIColorFromRGB(COLOR_BLUE);
}
-(void)setCarCategoryWithImageLayout{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(102, 70);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collectionCarCategories.collectionViewLayout = layout;
}
-(void)addCurrentLocationView{
    _viewCurrentLocation = [UIView new];
    [self addSubview:_viewCurrentLocation];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewCurrentLocation autoSetDimension:ALDimensionHeight toSize:24];
     _viewCurrentLocation.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *dividerLine = [UIImageView new];
    [_viewCurrentLocation addSubview:dividerLine];
    [dividerLine autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [dividerLine autoSetDimensionsToSize:CGSizeMake(5,5)];
    
    UIFont *font = [UIFont fontWithName:FONT_REGULAR size:12];
    _btnCurrentLocation = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_pickup" title:@"Passport Seva Kendar Andheri"];
    
    [_viewCurrentLocation addSubview:_btnCurrentLocation];
   
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnCurrentLocation autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:dividerLine withOffset:-1];
   // _btnCurrentLocation.backgroundColor = [UIColor redColor];
    _btnDesinationLocation = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_flag" title:@"Choose desination"];
    
    [_viewCurrentLocation addSubview:_btnDesinationLocation];
    
    [_btnDesinationLocation autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_btnDesinationLocation autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_btnDesinationLocation autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnDesinationLocation autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:dividerLine withOffset:-1];
    
    _btnCurrentLocation.lblTitle.font = _btnDesinationLocation.lblTitle.font = font;
    
}
-(void)addCarDetailView{
    _viewCarDetail= [CBCarDetailView new];
    [self addSubview:_viewCarDetail];
    [_viewCarDetail autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewCarDetail autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewCarDetail autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_collectionCarCategories];
    [_viewCarDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewCurrentLocation withOffset:0];
    _viewCarDetail.backgroundColor = [UIColor whiteColor];
}
-(void)addDriverDetailView{
    _viewDriverDetail = [CBDriverDetailView new];
    [self addSubview:_viewDriverDetail];
    [_viewDriverDetail autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewDriverDetail autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewDriverDetail autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_collectionCarCategories];
    [_viewDriverDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewCurrentLocation withOffset:0];
    _viewDriverDetail.backgroundColor = [UIColor whiteColor];
}
@end
