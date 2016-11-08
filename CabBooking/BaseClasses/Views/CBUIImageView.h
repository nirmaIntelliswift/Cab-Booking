//
//  CBUIImageView.h
//  CabBooking
//
//  Created by Nirma on 19/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface CBUIImageView : UIImageView
-(void)setImageFromUrl:(NSString*)urlStr;

@end
