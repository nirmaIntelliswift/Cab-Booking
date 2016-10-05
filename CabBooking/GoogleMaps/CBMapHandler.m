//
//  CBMapHandler.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapHandler.h"
#import "Constants.h"

#define kGoogleAPIKey @"AIzaSyAomNwrpfWv-31qU87xhEOYJZCSLoIL6yg"

@implementation CBMapHandler
-(id)init{
    self = [super init];
    if (self) {
        [self setLocationManager];
    }
    return self;
}
+(void)registerGoogleApiKey{
    [GMSServices provideAPIKey:kGoogleAPIKey];
    [GMSPlacesClient provideAPIKey:kGoogleAPIKey];
}
+(BOOL)isLocationManagerEnabled{
    if (![CLLocationManager locationServicesEnabled]) {
        DLog(@"Please enable location services");
        return NO;
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        DLog(@"Please authorize location services");
        return NO;
    }
    return YES;
}
-(void)setLocationManager{
    DLog(@"setLocationManager");
    if([CBMapHandler isLocationManagerEnabled]){
        manager = [[CLLocationManager alloc] init];
        if ([manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [manager requestWhenInUseAuthorization];
        }
        manager.delegate = self;
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        manager.distanceFilter = 1.0f;
    }
   
}
-(void)startUpdatingCurrentLocation{
    [manager startUpdatingLocation];
}
-(void)stopUpdatingCurrentLocation{
    [manager stopUpdatingLocation];
}
-(void)updateCurrentAddress:(CLLocationCoordinate2D)coordinate{
    float currentLatitude = coordinate.latitude;
    float currentLongitude = coordinate.longitude;
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:CLLocationCoordinate2DMake(currentLatitude, currentLongitude) completionHandler:^(GMSReverseGeocodeResponse* response, NSError* error) {
        NSLog(@"Current reverse geocoding results:");
        GMSAddress* addressObj;
        if ([response results] > 0 ) {
            addressObj = [response.results objectAtIndex:0];
            // }
            // for(addressObj in [response results])
            // {
            
            DLog(@"Current  coordinate.latitude=%f", addressObj.coordinate.latitude);
            DLog(@"Current  coordinate.longitude=%f", addressObj.coordinate.longitude);
            DLog(@"Current  thoroughfare=%@", addressObj.thoroughfare);
            DLog(@"Current  locality=%@", addressObj.locality);
            DLog(@"Current  subLocality=%@", addressObj.subLocality);
            DLog(@"Current  administrativeArea=%@", addressObj.administrativeArea);
            DLog(@"Current  postalCode=%@", addressObj.postalCode);
            DLog(@"Current  country=%@", addressObj.country);
            DLog(@"Current  lines=%@", addressObj.lines);
            [self.delegate mapLocationAddress:[addressObj.lines objectAtIndex:0]];
            //footerView.btnCurrentLocation.lblTitle.text = [addressObj.lines objectAtIndex:0];
            
            
        }
    }];
    
    //footerView.btnCurrentLocation.lblTitle.text = currentLocation.description;
    // [_mapView showCurrentLocationAt:location];
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        NSLog(@"Please authorize location services");
        return;
    }
    
    NSLog(@"CLLocationManager error: %@", error.localizedFailureReason);
    return;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    
    [self.delegate mapCurrentLocationAt:location];
   // GMSCameraUpdate *move = [GMSCameraUpdate setTarget:location.coordinate zoom:17];
   
}

@end
