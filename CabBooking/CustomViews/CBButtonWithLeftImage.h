//
//  CBButtonWithLeftImage.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "Constants.h"
@interface CBButtonWithLeftImage : UIButton


-(id)initWithImageName:(NSString*)imageName
                 title:(NSString*)titleText;

@property (nonatomic ,strong)UIImageView *imgLeft;
@property (nonatomic ,strong)UILabel *lblTitle;

@end
