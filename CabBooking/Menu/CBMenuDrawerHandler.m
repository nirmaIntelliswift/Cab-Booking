//
//  CBMenuDrawerHandler.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMenuDrawerHandler.h"
#import "CBMenuViewController.h"
#import "CBEmergencyViewController.h"
#import "CBOffersViewController.h"
#import "CBMyRideViewController.h"
#import "CBBookMyRideViewController.h"

@implementation CBMenuDrawerHandler

@synthesize mainRootViewController;

-(id)init{
    self = [super init];
    if (self) {
        [self setByRearViewController];
        }
    return self;
}
/*-(void)setBySlideMenu{
    CBMenuViewController *rearViewController = [[CBMenuViewController alloc] init];
    UIViewController *frontViewController = [[UIViewController alloc] init];
    mainRootViewController = [[SlideMenuController alloc] initWithMainViewController:frontViewController leftMenuViewController:rearViewController];
    mainRootViewController.automaticallyAdjustsScrollViewInsets = YES;
}*/
-(void)setByRearViewController{
    CBMenuViewController *rearViewController = [[CBMenuViewController alloc] init];
    UINavigationController *navigationController = [CBMenuDrawerHandler getViewControllerForIndex:1];
    
    mainRootViewController =
    [[SWRevealViewController alloc] initWithRearViewController:rearViewController frontViewController:navigationController];
    
    mainRootViewController.rearViewRevealWidth = 60;
    mainRootViewController.rearViewRevealOverdraw = 200;
    mainRootViewController.bounceBackOnOverdraw = NO;
    mainRootViewController.stableDragOnOverdraw = YES;
    mainRootViewController.frontViewShadowOpacity = 0.7;
    [mainRootViewController setFrontViewPosition:FrontViewPositionLeft];
    
    mainRootViewController.delegate = self;

}
- (NSString*)stringFromFrontViewPosition:(FrontViewPosition)position
{
    NSString *str = nil;
    if ( position == FrontViewPositionLeft ) str = @"FrontViewPositionLeft";
    if ( position == FrontViewPositionRight ) str = @"FrontViewPositionRight";
    if ( position == FrontViewPositionRightMost ) str = @"FrontViewPositionRightMost";
    if ( position == FrontViewPositionRightMostRemoved ) str = @"FrontViewPositionRightMostRemoved";
    return str;
}


- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController willRevealRearViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didRevealRearViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willHideRearViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didHideRearViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willShowFrontViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didShowFrontViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willHideFrontViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didHideFrontViewController:(UIViewController *)viewController
{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}
- (void)revealController:(SWRevealViewController *)revealController animateToPosition:(FrontViewPosition)position{
    DLog( @"%@: %@", NSStringFromSelector(_cmd), revealController);
    //UINavigationController *nav = (UINavigationController*)revealController.frontViewController;
  //  CBBaseFrontViewController *frontView = (CBBaseFrontViewController*)nav.topViewController;
    //frontView.overlayView.alpha = 0;
}
+(UINavigationController *)getViewControllerForIndex:(int)tableIndex{
    CBBaseFrontViewController *frontViewController;
    switch (tableIndex) {
        case 0:
            frontViewController = [[CBBookMyRideViewController alloc] init];
            break;
        case 1:
            frontViewController = [[CBMyRideViewController alloc] init];
            break;
        case 4:
            frontViewController = [[CBOffersViewController alloc] init];
            break;
        case 5:
            frontViewController = [[CBEmergencyViewController alloc] init];
            break;
            
        default:
            frontViewController = [[CBBaseFrontViewController alloc] init];
            frontViewController.title = @"In Progress";
            break;
    }
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:frontViewController];
    return navigationController;
}

@end
