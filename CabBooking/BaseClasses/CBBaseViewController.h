//
//  CBBaseViewController.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CBColors.h"
#import <PureLayout/PureLayout.h>
#import "Constants.h"
#import "NetworkParser.h"
@interface CBBaseViewController : UIViewController<NetworkParserDelegate>
-(void)callRequestWithParameters:(NSDictionary*)params
                       requestId:(int)requestId;
@end
