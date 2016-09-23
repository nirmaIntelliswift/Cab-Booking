//
//  CBBookMyRideViewController.h
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontViewController.h"
#import "CBMapHandler.h"
#import "CBMapView.h"
#import "CBBookMyRideFooterView.h"
@interface CBBookMyRideViewController : CBBaseFrontViewController<CBMapDelegate,GMSMapViewDelegate,UICollectionViewDataSource>{
    CBMapHandler *mapHandler;
    CBBookMyRideFooterView *footerView;
    NSLayoutConstraint *constraintFooterBottom;
}

@end
