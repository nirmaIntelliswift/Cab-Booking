//
//  CBBaseFrontViewController.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseViewController.h"
#import "SWRevealViewController.h"
@interface CBBaseFrontViewController : CBBaseViewController

@property(nonatomic,strong)UIButton *overlayView;
-(void)setMenuButton;

-(void)backViewController;
@end
