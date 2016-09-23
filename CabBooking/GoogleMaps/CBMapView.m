//
//  CBMapView.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapView.h"

@implementation CBMapView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.settings.myLocationButton = YES;
        [self setDefaultCamera];
    }
    return self;
}
-(void)setDefaultCamera{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.868
                                                            longitude:151.2086
                                                                 zoom:12];
    self.camera = camera;
}
-(void)showCurrentLocationAt:(CLLocation*)location{
    if (_locationMarker == nil) {
        _locationMarker = [[GMSMarker alloc] init];
        _locationMarker.position = location.coordinate;
        
        // Animated walker images derived from an www.angryanimator.com tutorial.
        // See: http://www.angryanimator.com/word/2010/11/26/tutorial-2-walk-cycle/
        
        NSArray *frames = @[[UIImage imageNamed:@"step1"],
                            [UIImage imageNamed:@"step2"],
                            [UIImage imageNamed:@"step3"],
                            [UIImage imageNamed:@"step4"],
                            [UIImage imageNamed:@"step5"],
                            [UIImage imageNamed:@"step6"],
                            [UIImage imageNamed:@"step7"],
                            [UIImage imageNamed:@"step8"]];
        
        _locationMarker.icon = [UIImage animatedImageWithImages:frames duration:0.8];
        _locationMarker.groundAnchor = CGPointMake(0.5f, 0.97f); // Taking into account walker's shadow
        _locationMarker.map = self;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:2.0];
        _locationMarker.position = location.coordinate;
        [CATransaction commit];
    }

    GMSCameraUpdate *move = [GMSCameraUpdate setTarget:location.coordinate zoom:15];
    [self animateWithCameraUpdate:move];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
}
@end
