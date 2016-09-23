//
//  CBButtonWithLeftImage.m
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBButtonWithLeftImage.h"

@implementation CBButtonWithLeftImage

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(id)initWithImageName:(NSString*)imageName
                 title:(NSString*)titleText{
    self = [super init];
    if (self) {
        [self addLeftImageView:imageName];
        [self addLabel:titleText];
    }
    return self;
}

-(void)addLeftImageView:(NSString*)imageName{
    _imgLeft = [UIImageView new];
    [self addSubview:_imgLeft];
     UIImage *image = [UIImage imageNamed:imageName];
    [_imgLeft autoSetDimensionsToSize:image.size];
    [_imgLeft autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_imgLeft autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:5];
    _imgLeft.image = image;
}
-(void)addLabel:(NSString*)titleText{
    _lblTitle = [UILabel new];
    [self addSubview:_lblTitle];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_lblTitle autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLeft withOffset:5];
    _lblTitle.text = titleText;
}
@end
