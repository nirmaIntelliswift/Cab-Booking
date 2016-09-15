//
//  CBMenuDrawerHandler.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMenuDrawerHandler.h"
#import "CBMenuViewController.h"

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
    UIViewController *frontViewController = [[UIViewController alloc] init];
    
    mainRootViewController =
    [[SWRevealViewController alloc] initWithRearViewController:rearViewController frontViewController:frontViewController];
    
    mainRootViewController.rearViewRevealWidth = 60;
    mainRootViewController.rearViewRevealOverdraw = 200;
    mainRootViewController.bounceBackOnOverdraw = NO;
    mainRootViewController.stableDragOnOverdraw = YES;
    [mainRootViewController setFrontViewPosition:FrontViewPositionRightMost];
    
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
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), [self stringFromFrontViewPosition:position]);
}

- (void)revealController:(SWRevealViewController *)revealController willRevealRearViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didRevealRearViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willHideRearViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didHideRearViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willShowFrontViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didShowFrontViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController willHideFrontViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}

- (void)revealController:(SWRevealViewController *)revealController didHideFrontViewController:(UIViewController *)viewController
{
    NSLog( @"%@: %@", NSStringFromSelector(_cmd), viewController);
}



@end
