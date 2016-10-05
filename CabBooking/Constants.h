//
//  Constants.h
//  FlamencoRhythm
//
//  Created by Nirma on 09/03/16.
//  Copyright © 2016 Intelliswift Software Pvt. Ltd. All rights reserved.
//
#import "CBColors.h"

#ifndef Constants_h
#define Constants_h

#define SANFRANSISCO_REGULAR @"SFUIText-Regular"
#define SANFRANSISCO_LIGHT @"SFUIText-Light"
#define SANFRANSISCO_MEDIUM @"SFUIText-Medium"
#define SANFRANSISCO_ULTRALIGHT @"SFUIDisplay-Ultralight"

#define FONT_REGULAR SANFRANSISCO_REGULAR
#define FONT_LIGHT SANFRANSISCO_LIGHT
#define FONT_MEDIUM SANFRANSISCO_MEDIUM
#define FONT_ULTRALIGHT SANFRANSISCO_ULTRALIGHT

#define TITLE_OFFERS_AND_RIDES @"Offers & Free Rides"
#define TITLE_EMERGENCY_CONTACTS @"Emergency Contacts"
#define TITLE_MY_RIDES @"My Rides"
#define TITLE_BOOK_MY_RIDE @"Book My Ride"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#ifndef DLog
#   ifdef DEBUG
#       define DLog(...) NSLog(__VA_ARGS__)
#   else
#       define DLog( ...)
#   endif // NDEBUG
#endif // DLog

#define ASYNC(...) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ __VA_ARGS__ })
#define ASYNC_MAIN(...) dispatch_async(dispatch_get_main_queue(), ^{ __VA_ARGS__ })

#endif /* Constants_h */
