//
//  LeftRightStrip.h
//  DemoLayout
//
//  Created by Nirma on 15/06/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"

@interface LeftRightStrip : UIView

@property(nonatomic ,strong)UILabel *lblLeft;
@property(nonatomic ,strong)UILabel *lblRight;


-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString;
-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString
               withFont:(UIFont*)font;
-(id)initWithLeftString:(NSString*)leftString
         andRightString:(NSString*)rightString
               rightFont:(UIFont*)rightFont
               leftFont:(UIFont*)leftFont;

@end
