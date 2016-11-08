//
//  CBUtility.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBUtility.h"

@implementation CBUtility

+(UIButton*)btnWithTopImage:(NSString*)imageName
                    btnName:(NSString*)title{
    UIButton *btn = [UIButton new];
    UIImageView *image = [UIImageView new];
    [btn addSubview:image];
    [image autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:8];
    [image autoSetDimensionsToSize:CGSizeMake(20, 20)];
    [image autoAlignAxisToSuperviewAxis:ALAxisVertical];
    image.image = [UIImage imageNamed:imageName];
    
    UILabel *lblTitle = [UILabel new];
    [btn addSubview:lblTitle];
    [lblTitle autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:8];
    [lblTitle autoAlignAxisToSuperviewAxis:ALAxisVertical];
    lblTitle.text = title;
    lblTitle.font = [UIFont fontWithName:FONT_LIGHT size:8];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 0.5 ;
    return btn;
}
+(UITabBar*)getTabBarOfTitles:(NSArray*)titles
                  imagesNames:(NSArray*)imagesNames{
    UITabBar *toolbar = [[UITabBar alloc] init];

    toolbar.tintColor = [UIColor blackColor];
   
    
    
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] init];
    
    for (int i = 0 ; i<[titles count]; i++) {
         UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:[titles objectAtIndex:i] image:[UIImage imageNamed:[imagesNames objectAtIndex:i]] tag:i];
         [tabBarItems addObject:tabBarItem1];
        [tabBarItem1 setTitlePositionAdjustment:UIOffsetMake(0, -7)];
    }
    
    toolbar.items = tabBarItems;
    toolbar.selectedItem = [tabBarItems objectAtIndex:0];
    
    return toolbar;
}
+(NSString*)getRideStatusString:(int)rideStatus{
    switch (rideStatus) {
        case CBRideCompleted:
            return @"COMPLETED";
        case CBRideScheduled:
            return @"SCHEDULED";
        case CBRideCancelled:
            return @"CANCELLED";
        case CBRideOngoing:
            return @"ONGOING";
            
            
            
        default:
            return @"";
    }
}

+(UIColor *)getRideStatusColor:(int)rideStatus{
    switch (rideStatus) {
        case CBRideCompleted:
            return [UIColor greenColor];
        case CBRideScheduled:
            return [UIColor greenColor];
        case CBRideCancelled:
            return [UIColor redColor];
        case CBRideOngoing:
            return [UIColor orangeColor];
        default:
            return [UIColor clearColor];
    }
}
+(NSMutableAttributedString*)getAttributedStringFromStrings:(NSArray*)strings
                                                      fonts:(NSArray*)allFonts{
   
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@""];
    for (int i = 0; i<[strings count]; i++) {
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:[strings objectAtIndex:i]];
        [attriString addAttribute:NSFontAttributeName
                       value:[allFonts objectAtIndex:i]//Lato-Bold, Your font name crahes
                            range:NSMakeRange(0,attriString.length)];
         [attributedString appendAttributedString:attriString];
        
    }

    
    return attributedString;
}
+(NSMutableAttributedString*)getAttributedStringFromStrings:(NSArray*)strings
                                                      fonts:(NSArray*)allFonts
                                                    colors:(NSArray*)allColors{
    NSMutableAttributedString *attributedString =  [[NSMutableAttributedString alloc]initWithString:@""];
    for (int i = 0; i<[strings count]; i++) {
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:[strings objectAtIndex:i]];
        [attriString addAttribute:NSFontAttributeName
                            value:[allFonts objectAtIndex:i]//Lato-Bold, Your font name crahes
                            range:NSMakeRange(0,attriString.length)];
        [attriString addAttribute:NSForegroundColorAttributeName
                       value:[allColors objectAtIndex:i]
                       range:NSMakeRange(0,attriString.length)];

        [attributedString appendAttributedString:attriString];
        
    }
       return attributedString;
}
+(int)getThemeColor1{
    NSString *coclor1 = [self readFromDisk:USER_COLOR_THEME1];
    
    if (coclor1) {
        return [self getHexValueFromString:coclor1];
    }
    return 0xFF2D55;
}
+(int)getThemeColor2{
    NSString *coclor1 = [self readFromDisk:USER_COLOR_THEME2];
    
    if (coclor1) {
        return [self getHexValueFromString:coclor1];
    }
    return 0xFF2D55;
}
+(int)getHexValueFromString:(NSString*)strHex{
    NSScanner* scanner = [NSScanner scannerWithString:strHex];
    int hex;
    if ([scanner scanHexInt:&hex]) {
        // Parsing successful. We have a big int representing the 0xBD8F60 value
        //int r = (hex >> 16) & 0xFF; // get the first byte
       // int g = (hex >>  8) & 0xFF; // get the middle byte
        //int b = (hex      ) & 0xFF; // get the last byte
    } else {
        NSLog(@"Parsing error: no hex value found in string");
    }
    return hex;
}
+(void)storeToDisk:(id)object forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(id)readFromDisk:(NSString*)key{
   id savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:key];
    return savedValue;
}
@end
