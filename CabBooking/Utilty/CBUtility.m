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
@end
