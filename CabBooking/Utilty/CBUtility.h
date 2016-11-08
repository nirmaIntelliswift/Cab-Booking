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
+(UITabBar*)getTabBarOfTitles:(NSArray*)titles
                  imagesNames:(NSArray*)imagesNames;

+(NSString*)getRideStatusString:(int)rideStatus;
+(UIColor *)getRideStatusColor:(int)rideStatus;
+(NSMutableAttributedString*)getAttributedStringFromStrings:(NSArray*)strings
                                                      fonts:(NSArray*)allFonts;
+(NSMutableAttributedString*)getAttributedStringFromStrings:(NSArray*)strings
                                                      fonts:(NSArray*)allFonts
                                                     colors:(NSArray*)allColors;

+(void)storeToDisk:(id)object forKey:(NSString *)key;
+(id)readFromDisk:(NSString*)key;
+(int)getThemeColor1;
+(int)getThemeColor2;
@end
