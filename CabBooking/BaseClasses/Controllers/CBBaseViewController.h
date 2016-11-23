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
#import "NetworkParser.h"
#import "CBAlerts.h"

@interface CBBaseViewController : UIViewController<NetworkParserDelegate>
-(void)callRequestWithParameters:(NSDictionary*)params
                       requestId:(int)requestId;
-(void)callGetRequestWithParameters:(NSMutableDictionary*)params
                          requestId:(int)requestId;
-(void)callRequestWithParameters:(NSMutableDictionary*)params
                       requestId:(int)requestId
                      withLoader:(BOOL)isLoaderShow;
-(void)setBackButton;
@end
