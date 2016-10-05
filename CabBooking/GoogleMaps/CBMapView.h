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
    NSMutableArray *carMarkers;
}

-(void)moveMapToLocation:(CLLocation*)location;
-(void)showCabs:(NSArray*)cabs;
@end
