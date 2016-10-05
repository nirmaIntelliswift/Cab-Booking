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

@implementation CBBookMyRideViewController

static NSString *carCategoryCellIdentifier = @"carCategory";

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = TITLE_BOOK_MY_RIDE;
    [self addMapView];
    [self addCenterMarkerView];
    [self addFooterView];
    selectedLocationType = CBLocationPickUp;
    [self showCurrentLocationMarker];
    mapHandler = [[CBMapHandler alloc]init];
    mapHandler.delegate = self;
   
    //self.navigationController.hidesBarsOnSwipe = YES;
    
    // Do any additional setup after loading the view.
}
-(void)requestAllCabs{
    NSMutableDictionary *params = [ParameterBundler getAllCabsForLatitude:pickUpLocation.coordinate.latitude longitude:pickUpLocation.coordinate.longitude];
    [self callRequestWithParameters:params requestId:API_GET_ALL_CABS];
}
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)nameOfAPI{
   // DLog(@"Name oF API = %@",dataObj);
    NSError *error;
    dataBookMyRide = [[CBMapDataModel alloc] initWithString:dataObj error:&error];
    DLog(@" response-->%@",dataBookMyRide.message);
    [dataBookMyRide mapSelectCabCategoryOfIndex:0];
     [self showCabsForSelectedCategory];
    [self refreshCollectionView];
}
-(void)onBusinessFailure:(id)dataObj withAPIName:(int)nameOfAPI{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [mapHandler startUpdatingCurrentLocation];
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [mapHandler stopUpdatingCurrentLocation];
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Add Views
-(void)addCenterMarkerView{
    imgCurrentLocationMarker = [[CBMapCenterView alloc]initWithCurrent];
    [self.view addSubview:imgCurrentLocationMarker];
    [imgCurrentLocationMarker autoCenterInSuperview];
    //[imgCurrentLocationMarker autoAlignAxis:ALAxisVertical toSameAxisOfView:mapView];
    //[imgCurrentLocationMarker autoAlignAxis:ALAxisHorizontal toSameAxisOfView:mapView];
    
    imgDestinationLocationMarker = [[CBMapCenterView alloc]initWithDestination];
    [self.view addSubview:imgDestinationLocationMarker];
    [imgDestinationLocationMarker autoCenterInSuperview];
    //[imgDestinationLocationMarker autoAlignAxis:ALAxisVertical toSameAxisOfView:mapView];
    //[imgDestinationLocationMarker autoAlignAxis:ALAxisHorizontal toSameAxisOfView:mapView];
}
- (void)addMapView {
    mapView = [[CBMapView alloc]initWithFrame:CGRectZero];
    mapView.settings.compassButton = NO;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
    [mapView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [mapView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [mapView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [mapView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
   // [mapView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:viewfooter];
}
-(void)addFooterView{
    viewfooter = [[CBBookMyRideFooterView alloc]init];
    [self.view addSubview:viewfooter];
    [viewfooter autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [viewfooter autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    constraintFooterBottom = [viewfooter autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    constraintFooterHeight = [viewfooter autoSetDimension:ALDimensionHeight toSize:240];
    constraintFooterHeight.constant = [viewfooter setRideNowView];
    //[viewfooter.btnBottom addTarget:self action:@selector(bottomBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self setFooterData];
    [self addFooterViewTargets];
}
-(void)addFooterViewTargets{
    [viewfooter.btnDestination addTarget:self action:@selector(searchDestination) forControlEvents:UIControlEventTouchUpInside];
    [viewfooter.btnCurrentLocation addTarget:self action:@selector(searchPickUpLocation) forControlEvents:UIControlEventTouchUpInside];
}
-(void)searchDestination{
    if(imgDestinationLocationMarker.hidden){
        selectedLocationType = CBLocationDestination;
        [self showDestinationLocationMarker];
        if (!destinationLocation) {
             [mapView moveMapToLocation:destinationLocation];
        }
    }
    else{
        [self showSearchPlaceController];
    }
}
-(void)searchPickUpLocation{
     if(imgCurrentLocationMarker.hidden){
         selectedLocationType = CBLocationPickUp;
         [self showCurrentLocationMarker];
         [mapView moveMapToLocation:pickUpLocation];
     }
     else{
         [self showSearchPlaceController];
     }
}
#pragma mark Set Views
-(void)setFooterData{
    [viewfooter.collectionCarCategories registerClass:[CBCarCategoryCell class] forCellWithReuseIdentifier:carCategoryCellIdentifier];
    viewfooter.collectionCarCategories.dataSource = self;
    viewfooter.collectionCarCategories.delegate = self;
    //viewfooter.btnCurrentLocation.lblTitle.text = currentLocation.description;
}
-(void)setviewfooter{
    switch (bookMyRideStatus) {
        case CBCarBookingStatusNone:
            constraintFooterHeight.constant = [viewfooter setRideNowView];
            break;
        case CBCarBookingStatusRideNow:
            constraintFooterHeight.constant = [viewfooter setConfirmBookingView];
            break;
        case CBCarBookingStatusConfirmBooking:
            constraintFooterHeight.constant = [viewfooter setCancelBookingView];
            break;
   
        default:
            break;
    }
    [viewfooter.collectionCarCategories reloadData];
}
#pragma mark Button Click Functions
-(void)bottomBtnClicked{
    bookMyRideStatus++;
    if (bookMyRideStatus>2) {
        bookMyRideStatus = 0;
    }
    [UIView animateKeyframesWithDuration:0.3 delay:0.3 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        constraintFooterBottom.constant = 300;
        [self downGoogleSettings];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self setviewfooter];
        [self showfooterView];
    }];

}

#pragma mark Collection View delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [dataBookMyRide.cabCategory count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CBCarCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:carCategoryCellIdentifier forIndexPath:indexPath];
    
    
    if (bookMyRideStatus == CBCarBookingStatusRideNow) {
         cell.imgCar.image = nil;
    }
    CBCarCategoryModel *cabCategory = [dataBookMyRide getCabCategoryOfIndex:(int)indexPath.row];
    [cell setCarSelected:cabCategory.isSelected];
    [cell setData:cabCategory];
    NSLog(@"%@", cell);
    
    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [dataBookMyRide mapSelectCabCategoryOfIndex:(int)indexPath.row];
    [self showCabsForSelectedCategory];
    [self refreshCollectionView];
}
-(void)refreshCollectionView{
    ASYNC_MAIN( [viewfooter.collectionCarCategories reloadData];);
}
-(void)showCabsForSelectedCategory{
    //CBCarCategoryModel *cabCategory = [dataBookMyRide getSelectedCabCategory];
   // [mapView showCabs:cabCategory.cabs];
}
#pragma mark Google Map delegate
- (BOOL)didTapMyLocationButtonForMapView:(GMSMapView *)mapView1{
    [self setMapLocation:currentLocation];
    [mapView moveMapToLocation:currentLocation];
    return YES;
}
- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture{
    if (gesture) {
        DLog(@"mapView willMove");
       [self mapFullView];
    }
    
}
- (void)mapView:(GMSMapView *)mapView1 idleAtCameraPosition:(GMSCameraPosition *)position{
    [self mapHalfView];
    [mapHandler updateCurrentAddress:position.target];
    CLLocation *location = [[CLLocation alloc]initWithLatitude:position.target.latitude longitude:position.target.longitude];
    [self setMapLocation:location];
}
- (void)mapView:(GMSMapView *)mapView didBeginDraggingMarker:(GMSMarker *)marker{
    
}
- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position{
   
}
#pragma mark CBMap Handler delegate
-(void)mapCurrentLocationAt:(CLLocation *)location{;
   if (!_firstLocationUpdate) {
         DLog(@"My Location Update");
        _firstLocationUpdate = YES;
        currentLocation = location;
        [mapView moveMapToLocation:currentLocation];
        [mapHandler updateCurrentAddress:currentLocation.coordinate];
         pickUpLocation = currentLocation;
        [self requestAllCabs];
    }
}
-(void)mapLocationAddress:(NSString *)address{
    if (selectedLocationType == CBLocationPickUp) {
        viewfooter.btnCurrentLocation.lblTitle.text = address;
    }
    else{
        viewfooter.btnDestination.lblTitle.text = address;
    }
    
}
#pragma mark Hide Show Functions
-(void)mapHalfView{
     isMapMoving = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self showfooterView];
}
-(void)mapFullView{
     isMapMoving = YES;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self hidefooterView];
}
-(void)setMapLocation:(CLLocation*)location{
    if (selectedLocationType == CBLocationDestination) {
        destinationLocation = location;
    }
    else{
        pickUpLocation = location;
        [self requestAllCabs];
    }
   
}
-(void)showSearchPlaceController{
    if (!isMapMoving) {
        GMSAutocompleteViewController *autocompleteViewController = [[GMSAutocompleteViewController alloc] init];
        GMSAutocompleteFilter *filter = [[GMSAutocompleteFilter alloc]init];
        filter.country = @"IN";
        filter.type = kGMSPlacesAutocompleteTypeFilterRegion;
        // autocompleteViewController.autocompleteFilter.country = @"IN";
        autocompleteViewController.autocompleteFilter = filter;
        autocompleteViewController.delegate = self;
        [self.navigationController presentViewController:autocompleteViewController animated:YES completion:nil];

    }
}
-(void)hideAllLocationMarkers{
    imgCurrentLocationMarker.hidden = YES;
    imgDestinationLocationMarker.hidden = YES;
}
-(void)showCurrentLocationMarker{
    [self hideAllLocationMarkers];
    imgCurrentLocationMarker.hidden = NO;
}
-(void)showDestinationLocationMarker{
    [self hideAllLocationMarkers];
    imgDestinationLocationMarker.hidden = NO;
}
-(void)downGoogleSettings{
     mapView.padding = UIEdgeInsetsMake(0, 0, 0, 0);
}
-(void)upGoogleSettings{
   mapView.padding = UIEdgeInsetsMake(0, 0, constraintFooterHeight.constant, 0);
}
-(void)hidefooterView{
    
    [UIView animateKeyframesWithDuration:0.3 delay:0.2 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        constraintFooterBottom.constant = 300;
        [self downGoogleSettings];
        [self.view layoutIfNeeded];
    } completion:nil];
   
}
-(void)showfooterView{
    [UIView animateKeyframesWithDuration:0.3 delay:0.3 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        constraintFooterBottom.constant = 0;
        [self upGoogleSettings];
        [self.view layoutIfNeeded];
    } completion:nil];
    
}
#pragma mark - GMSAutocompleteViewControllerDelegate

- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place {
    // Dismiss the view controller and tell our superclass to populate the result view.
    DLog(@"location Address--->%@",place);
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self mapLocationAddress:place.formattedAddress];
     CLLocation *location = [[CLLocation alloc]initWithLatitude:place.coordinate.latitude longitude:place.coordinate.longitude];
    [self setMapLocation:location];
    [mapView moveMapToLocation:location];
    //[self autocompleteDidSelectPlace:place];
}
- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error {
    // Dismiss the view controller and notify our superclass of the failure.
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    // Dismiss the controller and show a message that it was canceled.
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
   

}


- (void)didRequestAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
