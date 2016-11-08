//
//  CBMapView.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapView.h"
#import "CBCarModel.h"
#define kDirectionsURL @"https://maps.googleapis.com/maps/api/directions/json?"

@implementation CBMapView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.settings.myLocationButton = YES;
        self.myLocationEnabled = YES;
        [self setDefaultCamera];
        [self addRouteLine];
        carMarkers = [[NSMutableArray alloc]init];
        [self addPickUpLocationMarker];
        [self addDestinationLocationMarker];
    }
    return self;
}
-(void)addPickUpLocationMarker{
    pickUpLocationMarker   = [[GMSMarker alloc] init];
    pickUpLocationMarker.icon = [UIImage imageNamed:@"ic_pickup_marker_small"];
    
}
-(void)addDestinationLocationMarker{
    destinationLocationMarker   = [[GMSMarker alloc] init];
    destinationLocationMarker.icon = [UIImage imageNamed:@"ic_drop_marker_small"];
}

-(void)addRouteLine{
    GMSMutablePath *path = [GMSMutablePath path];
    
    
    routeLine = [GMSPolyline polylineWithPath:path];
    routeLine.strokeWidth = 2.f;
    //routeLine.strokeColor = [UIColor greenColor];
    GMSStrokeStyle *greenToRed = [GMSStrokeStyle gradientFromColor:[UIColor greenColor] toColor:[UIColor redColor]];
   routeLine.spans =  @[[GMSStyleSpan spanWithStyle:greenToRed]];
    
   
}
-(void)setDefaultCamera{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:12];
    self.camera = camera;
}
-(void)drawRouteFromCoordinate:(CLLocation*)fromCoordinate
                 toCoordinate:(CLLocation*)toCoordinate{
    
   
    pickUpLocationMarker.map = nil;
    destinationLocationMarker.map = nil;
    pickUpLocationMarker.position = fromCoordinate.coordinate;
    destinationLocationMarker.position = toCoordinate.coordinate;
    
    pickUpLocationMarker.map = self;
    destinationLocationMarker.map = self;
    [self getPolylineWithLocations:@[fromCoordinate,toCoordinate]];
    
  
    
    
}
-(void)hideRouteLine{
    routeLine.map = nil;
    pickUpLocationMarker.map = nil;
    destinationLocationMarker.map = nil;
}
-(void)moveMapToLocation:(CLLocation*)location{
    GMSCameraUpdate *move = [GMSCameraUpdate setTarget:location.coordinate zoom:15];
    [self animateWithCameraUpdate:move];
}
-(void)showCabs:(NSArray*)cabs{
    [self emptyOtherCarMarkers];
    for (int i = 0; i<[cabs count]; i++) {
        CBCarModel *cabModel = [cabs objectAtIndex:i];
        [self showCabMarker:cabModel];
    }
}
-(void)showCabMarker:(CBCarModel*) cabModel{
  CLLocation *location = [[CLLocation alloc]initWithLatitude:cabModel.latitude longitude:cabModel.longitude];
     GMSMarker *carMarker = [self showMarkerAtLocation:location withImageName:@"ic_car"];
        [carMarkers addObject:carMarker];

}
-(GMSMarker*)showMarkerAtLocation:(CLLocation*)location
              withImageName:(NSString*)imageName {
    GMSMarker *marker = [[GMSMarker alloc] init];

    marker.position = location.coordinate;
    marker.icon = [UIImage imageNamed:imageName];
    marker.map = self;
    return marker;
}
-(void)emptyOtherCarMarkers{
    for (int i = 0; i<[carMarkers count]; i++) {
        GMSMarker *carMarker = [carMarkers objectAtIndex:i];
        carMarker.map = nil;
    }
    [carMarkers removeAllObjects];
}
-(void)moveCabTo{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    //marker.position = coordindates;
    [CATransaction commit];
}
-(void)showCurrentLocationAt:(CLLocation*)location{
   /* if (_locationMarker == nil) {
        _locationMarker = [[GMSMarker alloc] init];
        _locationMarker.position = location.coordinate;
        
        // Animated walker images derived from an www.angryanimator.com tutorial.
        // See: http://www.angryanimator.com/word/2010/11/26/tutorial-2-walk-cycle/
        
        NSArray *frames = [self getAnimArray];
        
        _locationMarker.icon = [UIImage animatedImageWithImages:frames duration:0.6];
        _locationMarker.groundAnchor = CGPointMake(0.5f, 0.97f); // Taking into account walker's shadow
        _locationMarker.map = self;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        _locationMarker.position = location.coordinate;
        [CATransaction commit];
    }*/

  
}
-(NSArray*)getAnimArray{
    NSMutableArray *animArray = [NSMutableArray new];
    for (int i = 1; i<9; i++) {
        [animArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"step%d",i]]];
    }
    return animArray;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
}
- (void)getPolylineWithLocations:(NSArray *)locations
{
    NSUInteger locationsCount = [locations count];
    
    if (locationsCount < 2) return;
    
    
    
    NSMutableArray *locationStrings = [NSMutableArray new];
    
    for (CLLocation *location in locations)
    {
        [locationStrings addObject:[[NSString alloc] initWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude]];
    }
    
    NSString *sensor = @"false";
    NSString *origin = [locationStrings objectAtIndex:0];
    NSString *destination = [locationStrings lastObject];
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@origin=%@&destination=%@&sensor=%@", kDirectionsURL, origin, destination, sensor];
    
    if (locationsCount > 2)
    {
        [url appendString:@"&waypoints=optimize:false"];
        for (int i = 1; i < [locationStrings count] - 1; i++)
        {
            [url appendFormat:@"|%@", [locationStrings objectAtIndex:i]];
        }
    }
    
    
    [url appendString:@"&mode=driving"];
    url = [NSMutableString stringWithString:[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    
    NSMutableURLRequest *_request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:url]
                                                                cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                            timeoutInterval: 2];
    
    //_request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url] usingCache:nil andCachePolicy:ASIDoNotReadFromCacheCachePolicy | ASIDoNotWriteToCacheCachePolicy | ASIDontLoadCachePolicy];
    
    //__weak ASIHTTPRequest *weakRequest = _request;
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:_request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (!error)
        {
            NSArray *routesArray = [json objectForKey:@"routes"];
            
            if ([routesArray count] > 0)
            {
                NSDictionary *routeDict = [routesArray objectAtIndex:0];
                NSDictionary *routeOverviewPolyline = [routeDict objectForKey:@"overview_polyline"];
                NSString *points = [routeOverviewPolyline objectForKey:@"points"];
                GMSPath *path = [GMSPath pathFromEncodedPath:points];
                routeLine.path = path;
                 routeLine.map = self;
                GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithPath:path];
                
                GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds];
                
                [self moveCamera:update];
                //GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
               // completitionBlock(polyline, nil);
            }
            else
            {
#if DEBUG
                if (locationsCount > 10)
                    NSLog(@"If you're using Google API's free service you will not get the route. Free service supports up to 8 waypoints + origin + destination.");
#endif
               // completitionBlock(nil, nil);
            }
        }
        else
        {
            //completitionBlock(nil, error);
        }

    }];
    [task resume];
   
}

@end
