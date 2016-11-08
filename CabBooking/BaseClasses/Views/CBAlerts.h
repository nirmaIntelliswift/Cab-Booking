//
//  CBAlerts.h
//  CabBooking
//
//  Created by Nirma on 20/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBAlerts : NSObject

+(void)showTitle:(NSString*)title withMessage:(NSString*)message controller:(UIViewController*)con;

+(void)showMessage:(NSString*)message controller:(UIViewController*)con;


@end
