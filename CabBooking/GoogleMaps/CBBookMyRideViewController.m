//
//  CBBookMyRideViewController.m
//  CabBooking
//
//  Created by Nirma on 21/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBookMyRideViewController.h"
#import "CBCarCategoryCell.h"

@interface CBBookMyRideViewController ()

@end

@implementation CBBookMyRideViewController{
    CBMapView *_mapView;
    BOOL _firstLocationUpdate;
     GMSMarker         *_locationMarker;
    CLLocation *currentLocation;
   
}

static NSString *carCategoryCellIdentifier = @"carCategory";
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = TITLE_BOOK_MY_RIDE;
    [self addFooterView];
    [self addMapView];
    mapHandler = [[CBMapHandler alloc]init];
    mapHandler.delegate = self;
    //self.navigationController.hidesBarsOnSwipe = YES;
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
- (void)mapView:(GMSMapView *)mapView didBeginDraggingMarker:(GMSMarker *)marker{
     [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addMapView {
    _mapView = [[CBMapView alloc]initWithFrame:CGRectZero];
    _mapView.settings.compassButton = NO;
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    [_mapView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [_mapView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_mapView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_mapView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:footerView];
   // [_mapView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:100];
}
-(void)addFooterView{
    //24+80+50
    footerView = [[CBBookMyRideFooterView alloc]init];
    [self.view addSubview:footerView];
    [footerView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [footerView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    constraintFooterBottom = [footerView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    //[footerView autoSetDimension:ALDimensionHeight toSize:154];
    [footerView autoSetDimension:ALDimensionHeight toSize:240];
    [self setFooterData];
}
-(void)setFooterData{
    [footerView.collectionCarCategories registerClass:[CBCarCategoryCell class] forCellWithReuseIdentifier:carCategoryCellIdentifier];
    footerView.collectionCarCategories.dataSource = self;
    
    //footerView.collectionCarCategories.
    //footerView.btnCurrentLocation.lblTitle.text = currentLocation.description;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CBCarCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:carCategoryCellIdentifier forIndexPath:indexPath];
    
    NSLog(@"%@", cell);
    
    return cell;

}
- (BOOL)didTapMyLocationButtonForMapView:(GMSMapView *)mapView{
    [_mapView showCurrentLocationAt:currentLocation];
    return YES;
}
- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture{
    if (gesture) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self hideFooterView];
    }
    
}
- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position{
     [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self showFooterView];
}
-(void)viewWillAppear:(BOOL)animated{
    [mapHandler startUpdatingCurrentLocation];
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [mapHandler stopUpdatingCurrentLocation];
    [super viewWillDisappear:animated];
}
-(void)mapCurrentLocationAt:(CLLocation *)location{;
    DLog(@"My Location Update");
    currentLocation = location;
    /*CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:
     ^(NSArray* placemarks, NSError* error){
         if ([placemarks count] > 0)
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSLog(@"Your country ISO code is %@",placemark.ISOcountryCode);
             footerView.btnCurrentLocation.lblTitle.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                  placemark.subThoroughfare, placemark.thoroughfare,
                                  placemark.postalCode, placemark.locality,
                                  placemark.administrativeArea,
                                  placemark.country];
         }
     }];*/
    //footerView.btnCurrentLocation.lblTitle.text = currentLocation.description;
    [_mapView showCurrentLocationAt:location];
}

-(void)hideFooterView{
    [UIView animateKeyframesWithDuration:0.3 delay:0.3 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        constraintFooterBottom.constant = 300;
        [self.view layoutIfNeeded];
    } completion:nil];
   
}
-(void)showFooterView{
    [UIView animateKeyframesWithDuration:0.3 delay:0.3 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        constraintFooterBottom.constant = 0;
        [self.view layoutIfNeeded];
    } completion:nil];
    
}
@end
