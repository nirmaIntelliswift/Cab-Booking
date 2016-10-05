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
#import "CBMapCenterView.h"
#import <GooglePlaces/GooglePlaces.h>
#import "CBMapDataModel.h"

typedef enum
{
    CBCarBookingStatusNone,
    CBCarBookingStatusRideNow,
    CBCarBookingStatusConfirmBooking,
    CBCarBookingStatusCancel
    
} CBCarBookingStatus;

typedef enum
{
    CBLocationPickUp,
    CBLocationDestination
   
    
} CBLocationType;

@interface CBBookMyRideViewController : CBBaseFrontViewController<CBMapDelegate,GMSMapViewDelegate,UICollectionViewDataSource,GMSAutocompleteViewControllerDelegate,UICollectionViewDelegate>{
    
    CBBookMyRideFooterView *viewfooter;
    CBMapView *mapView;
    CBMapCenterView *imgCurrentLocationMarker;
    CBMapCenterView *imgDestinationLocationMarker;
    
    CBMapHandler *mapHandler;
    CBCarBookingStatus bookMyRideStatus;
    CBLocationType selectedLocationType;
    
    NSLayoutConstraint *constraintFooterBottom;
    NSLayoutConstraint *constraintFooterHeight;

    
    
    BOOL _firstLocationUpdate;
    BOOL isMapMoving;
    CLLocation *currentLocation;
    CLLocation *pickUpLocation;
    CLLocation *destinationLocation;
    
    
    ///for test;ng
    CBMapDataModel* dataBookMyRide;
    int selectedCarCategory;
}

@end
