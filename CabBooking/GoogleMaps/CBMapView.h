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
    GMSPolyline *routeLine;
    GMSMarker *pickUpLocationMarker;
    GMSMarker *destinationLocationMarker;
    
}

-(void)moveMapToLocation:(CLLocation*)location;
-(void)showCabs:(NSArray*)cabs;
-(void)drawRouteFromCoordinate:(CLLocation*)fromCoordinate
                  toCoordinate:(CLLocation*)toCoordinate;
-(void)hideRouteLine;
@end
