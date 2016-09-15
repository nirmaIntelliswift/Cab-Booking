//
//  CBMenuDrawerHandler.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWRevealViewController.h"
#import "SlideMenuController.h"
@interface CBMenuDrawerHandler : NSObject<SWRevealViewControllerDelegate>

@property(nonatomic,strong)SWRevealViewController *mainRootViewController;
//@property(nonatomic,strong)SlideMenuController *mainRootViewController;

@end
