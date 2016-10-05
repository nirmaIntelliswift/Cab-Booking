//
//  CBBookMyRideFooterView.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBookMyRideFooterView.h"
#import "Constants.h"
#define kCURRENT_LOCATION_HEIGHT 40
#define kBOTTOM_BUTTON_HEIGHT 60
#define kCAROUSEL_HEIGHT 70
#define kCAROUSEL_HEIGHT_SHORT 40

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
        [self addCollectionViewCarCategory];
        
        [self addCarDetailView];
        [self addDriverDetailView];
    }
    return self;
}
-(void)addBottomButton{
    _btnBottom = [UIButton new];
    [self addSubview:_btnBottom];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_btnBottom autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_btnBottom autoSetDimension:ALDimensionHeight toSize:kBOTTOM_BUTTON_HEIGHT];
    _btnBottom.backgroundColor = UIColorFromRGB(COLOR_PINK);
    [_btnBottom setTitle:@"Ride Now" forState:UIControlStateNormal];
    _btnBottom.titleLabel.font = [UIFont fontWithName:FONT_REGULAR size:22];
    _btnBottom.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}
-(void)addCollectionViewCarCategory{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionCarCategories = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self setCarCategoryWithImageLayout];
    [_collectionCarCategories setShowsHorizontalScrollIndicator:NO];
    [self addSubview:_collectionCarCategories];
    [_collectionCarCategories autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_collectionCarCategories autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    constraintCollectionViewHeight = [_collectionCarCategories autoSetDimension:ALDimensionHeight toSize:kCAROUSEL_HEIGHT];
    //[_collectionCarCategories autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewCarDetail withOffset:0];
    [_collectionCarCategories autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnBottom];
    _collectionCarCategories.backgroundColor = [UIColor whiteColor];//UIColorFromRGB(COLOR_BLUE);
}
-(void)setCarCategoryWithImageLayout{
    constraintCollectionViewHeight.constant = kCAROUSEL_HEIGHT;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(102, kCAROUSEL_HEIGHT);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collectionCarCategories.collectionViewLayout = layout;
}
-(void)setCarCategoryWithoutImageLayout{
    constraintCollectionViewHeight.constant = kCAROUSEL_HEIGHT_SHORT;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(102, kCAROUSEL_HEIGHT_SHORT);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collectionCarCategories.collectionViewLayout = layout;
}
-(void)addCurrentLocationView{
    _viewCurrentLocation = [UIView new];
    [self addSubview:_viewCurrentLocation];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_viewCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_viewCurrentLocation autoSetDimension:ALDimensionHeight toSize:kCURRENT_LOCATION_HEIGHT];
     _viewCurrentLocation.backgroundColor = [UIColor whiteColor];
    
    UIImage *dividerImage = [UIImage imageNamed:@"arrow"];
    UIImageView *dividerLine = [[UIImageView alloc]initWithImage:dividerImage];
    [_viewCurrentLocation addSubview:dividerLine];
    [dividerLine autoCenterInSuperview];
    [dividerLine autoSetDimensionsToSize:dividerImage.size];
    //dividerLine.backgroundColor = [UIColor redColor];
    
    UIFont *font = [UIFont fontWithName:FONT_LIGHT size:12];
    _btnCurrentLocation = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_pickup" title:@"Fetching Current Location"];
    
    [_viewCurrentLocation addSubview:_btnCurrentLocation];
   
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_btnCurrentLocation autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnCurrentLocation autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:dividerLine withOffset:-1];
   // _btnCurrentLocation.backgroundColor = [UIColor redColor];
    _btnDestination = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_flag" title:@"Choose destination"];
    
    [_viewCurrentLocation addSubview:_btnDestination];
    
    [_btnDestination autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_btnDestination autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_btnDestination autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_btnDestination autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:dividerLine withOffset:1];
    
    _btnCurrentLocation.lblTitle.font = _btnDestination.lblTitle.font = font;
    
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
    [_viewDriverDetail autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_btnBottom];
    [_viewDriverDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_viewCurrentLocation withOffset:0];
    _viewDriverDetail.backgroundColor = [UIColor whiteColor];
}

-(void)hideAllViews{
    _viewCurrentLocation.hidden = YES;
    _viewCarDetail.hidden = YES;
    _viewDriverDetail.hidden = YES;
    _btnBottom.hidden = YES;
    _btnCurrentLocation.hidden = YES;
    _btnDestination.hidden = YES;
    _collectionCarCategories.hidden = YES;
}
-(CGFloat)setRideNowView{
    [self hideAllViews];
    _viewCurrentLocation.hidden = NO;
    _btnBottom.hidden = NO;
    _btnCurrentLocation.hidden = NO;
    _btnDestination.hidden = NO;
    _collectionCarCategories.hidden = NO;
    _btnBottom.backgroundColor = UIColorFromRGB(COLOR_PINK);
    [_btnBottom setTitle:@"Ride Now" forState:UIControlStateNormal];
    [self setCarCategoryWithImageLayout];
    return (kCURRENT_LOCATION_HEIGHT+kCAROUSEL_HEIGHT+kBOTTOM_BUTTON_HEIGHT);
    
}
-(CGFloat)setConfirmBookingView{
    [self hideAllViews];
    _viewCurrentLocation.hidden = NO;
    _btnBottom.hidden = NO;
    _btnCurrentLocation.hidden = NO;
    _btnDestination.hidden = NO;
    _collectionCarCategories.hidden = NO;
    _viewCarDetail.hidden = NO;
    _btnBottom.backgroundColor = UIColorFromRGB(COLOR_PINK);
    [self setCarCategoryWithoutImageLayout];
    [_btnBottom setTitle:@"Confirm booking" forState:UIControlStateNormal];
    CGFloat height = kCURRENT_LOCATION_HEIGHT+kCAROUSEL_HEIGHT_SHORT+kBOTTOM_BUTTON_HEIGHT+112;
    return height;
    
}
-(CGFloat)setCancelBookingView{
    [self hideAllViews];
    _btnBottom.hidden = NO;
    _viewCurrentLocation.hidden = NO;
    _btnCurrentLocation.hidden = NO;
    _btnDestination
    
    
    
    
    
    .hidden = NO;
    _viewDriverDetail.hidden = NO;
    _btnBottom.backgroundColor = [UIColor lightGrayColor];
    [_btnBottom setTitle:@"Cancel" forState:UIControlStateNormal];
    return (kCURRENT_LOCATION_HEIGHT+kBOTTOM_BUTTON_HEIGHT+125);
}
@end
