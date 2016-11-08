//
//  CBMyRideDetailController.m
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideDetailController.h"

@interface CBMyRideDetailController ()

@end

@implementation CBMyRideDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackButton];
    
    [self addTabBar];
    [self requestMYRideDetails];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -requests
-(void)requestMYRideDetails{
    NSMutableDictionary *params = [ParameterBundler getRideDetails:@"CRN12453245"];
    [self callRequestWithParameters:params requestId:API_ID_RIDE_DETAIL];
}


#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
               dataMyRide = [[CBMyRideDetailModel alloc] initWithString:dataObj error:&error];
                self.title = dataMyRide.ride.dateTime;
               [self addMyRideView];
               DLog(@" response-->%@",dataMyRide.message);
               );
    
    
}
-(void)addMyRideView{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:scrollView];
    [scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [scrollView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [scrollView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:61];//
    [scrollView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    scrollView.showsVerticalScrollIndicator = NO;
//scrollView
    
    myRideView = [[CBMyRideView alloc]initWithFrame:CGRectZero data:dataMyRide.ride];
    myRideView.mapView.delegate = self;
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, [myRideView viewHeight]);
    myRideView.frame  = frame;
    [scrollView addSubview:myRideView];
    scrollView.contentSize = CGSizeMake(0, [myRideView viewHeight]);
}
-(void)addTabBar{
    UITabBar *toolbar = [CBUtility getTabBarOfTitles:@[@"COMPLAINT",@"INVOICE",@"SUPPORT"] imagesNames:@[@"ic_call.png",@"ic_call.png",@"ic_call.png"]];
    [self.view addSubview:toolbar];
   
    [toolbar autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [toolbar autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [toolbar autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [toolbar autoSetDimension:ALDimensionHeight toSize:60];
    
    
}
- (void)mapViewDidFinishTileRendering:(GMSMapView *)mapView{
    [myRideView setMapRide:dataMyRide.ride];
}
@end
