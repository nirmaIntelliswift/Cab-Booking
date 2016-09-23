//
//  CBUtility.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "Constants.h"

@interface CBUtility : NSObject
+(UIButton*)btnWithTopImage:(NSString*)imageName
                    btnName:(NSString*)title;
@end
