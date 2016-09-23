//
//  CBMapHandler.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapHandler.h"
#import "Constants.h"


@implementation CBMapHandler
-(id)init{
    self = [super init];
    if (self) {
        [self setLocationManager];
    }
    return self;
}
+(void)registerGoogleApiKey{
    [GMSServices provideAPIKey:@"AIzaSyAomNwrpfWv-31qU87xhEOYJZCSLoIL6yg"];
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
