//
//  CBBookMyRideViewControllerTests.m
//  CabBooking
//
//  Created by Nirma on 06/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CBBookMyRideViewController.h"
@interface CBBookMyRideViewController (Tests)
-(int)testingAdditionWithValue1:(int)val1
                           val2:(int)val2;
-(void)showCabsForCategory: (CBCarCategoryModel *)cabCategory;
@end
@interface CBBookMyRideViewControllerTests : XCTestCase
@property (nonatomic)CBBookMyRideViewController *bookMyRide;
@end
/*
 - http request get my all cabs and got success
 - check view footer height in setViewFooter funcation by mock object
 - number of cab category in listing according to mock object
 - mapMovement providing destinationLocation  and current location as mock object
 - opening search controller 
 - map location address
*/
/*
 what this viewController do?
 - shows current location
 - on dragging change pickup/destination location
 - choose destination place from search and update map accordingly
 - move map to  pick up and destination location on tapping
 -
 - cab category listing
 - cab category selection update cabs on map
 
 - cab placement update after 5 sec
*/

@implementation CBBookMyRideViewControllerTests

- (void)setUp {
    [super setUp];
    _bookMyRide = [CBBookMyRideViewController new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int sum = [_bookMyRide testingAdditionWithValue1:2 val2:2];
    XCTAssertEqual(sum, 4);
}

- (void)testCabCategoryCabList {
    CBCarCategoryModel *cabCategory = [CBCarCategoryModel new];
    NSMutableArray  *array  = [[NSMutableArray alloc]init];
    for (int i = 0; i<5; i++) {
        CBCarModel *cabModel = [CBCarModel new];
        cabModel.longitude = 72.3232545454;
        cabModel.latitude = 19.45478787878;
        [array addObject:cabModel];
    }
    cabCategory.cabs = array;
    [_bookMyRide showCabsForCategory:cabCategory];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
