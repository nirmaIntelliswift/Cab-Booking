//
//  CBBookMyRideFooterView.h
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CBSepratorLine.h"
#import "CBDriverDetailView.h"
#import "CBCarDetailView.h"
#import "CBButtonWithLeftImage.h"

IB_DESIGNABLE
@interface CBBookMyRideFooterView : UIView{
    NSLayoutConstraint *constraintCollectionViewHeight;
}

#pragma mark UIViews
IBInspectable
@property(nonatomic,strong)UIView *viewCurrentLocation;
IBInspectable
@property(nonatomic,strong)CBCarDetailView *viewCarDetail;
IBInspectable
@property(nonatomic,strong)CBDriverDetailView *viewDriverDetail;

#pragma mark UIButtons
IBInspectable
@property(nonatomic,strong)UIButton *btnBottom;
IBInspectable
@property(nonatomic,strong) CBButtonWithLeftImage *btnCurrentLocation;
IBInspectable
@property(nonatomic,strong) CBButtonWithLeftImage *btnDestination;

#pragma mark UICollection
IBInspectable
@property(nonatomic,strong)UICollectionView *collectionCarCategories;


-(CGFloat)setRideNowView;
-(CGFloat)setConfirmBookingView;
-(CGFloat)setCancelBookingView;
@end
