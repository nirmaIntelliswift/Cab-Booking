//
//  CBMapView.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapView.h"
#import "CBCarModel.h"

@implementation CBMapView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.settings.myLocationButton = YES;
        self.myLocationEnabled = YES;
        [self setDefaultCamera];
        carMarkers = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)setDefaultCamera{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:12];
    self.camera = camera;
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
   GMSMarker *carMarker = [[GMSMarker alloc] init];
      CLLocation *location = [[CLLocation alloc]initWithLatitude:cabModel.latitude longitude:cabModel.longitude];
    carMarker.position = location.coordinate;
    carMarker.icon = [UIImage imageNamed:@"ic_car"];
    carMarker.map = self;
    [carMarkers addObject:carMarker];

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
@end
