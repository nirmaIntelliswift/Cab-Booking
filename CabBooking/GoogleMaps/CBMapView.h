//
//  CBMapView.h
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>

@interface CBMapView : GMSMapView{
    GMSMarker         *_locationMarker;
}

-(void)showCurrentLocationAt:(CLLocation*)location;

@end
