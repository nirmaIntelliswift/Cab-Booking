//
//  CBMapHandler.h
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>

@protocol CBMapDelegate <NSObject>

@optional
-(void)mapCurrentLocationAt:(CLLocation *)location;

@end
@interface CBMapHandler : NSObject<CLLocationManagerDelegate>{
    CLLocationManager *manager;
}

@property (nonatomic,weak)  id <CBMapDelegate> delegate;

-(void)startUpdatingCurrentLocation;
-(void)stopUpdatingCurrentLocation;
+(void)registerGoogleApiKey;
+(BOOL)isLocationManagerEnabled;
@end
