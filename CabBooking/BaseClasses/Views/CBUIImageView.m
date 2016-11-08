//
//  CBUIImageView.m
//  CabBooking
//
//  Created by Nirma on 19/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBUIImageView.h"

@implementation CBUIImageView

-(void)setImageFromUrl:(NSString*)urlStr{
    
    if (urlStr != nil) {
         [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
    }
   
}

@end
