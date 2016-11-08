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
-(id)init{
    self = [super init];
    if (self) {
        _sideMargin = 5;
    }
    return self;
}
-(id)initWithImageName:(NSString*)imageName
                 title:(NSString*)titleText{
    self = [self init];
    if (self) {
        
        [self addLeftImageView:imageName];
        [self addLabel:titleText];
    }
    return self;
}
-(id)initWithLeftImageName:(NSString*)imageName
            rightImageName:(NSString *)rightImageName
                     title:(NSString*)titleText{
    self = [self init];
    if (self) {
        [self addLeftImageView:imageName];
        [self addLabel:titleText];
        [self addRightImageView:rightImageName];
    }
    return self;
}
-(id)initWithLeftImageName:(NSString*)imageName
                rightImageName:(NSString *)rightImageName
                 title:(NSString*)titleText
            withSideMargin:(CGFloat)sideMargin{
    self = [self init];
    if (self) {
        _sideMargin = sideMargin;
        [self addLeftImageView:imageName];
        [self addLabel:titleText];
        [self addRightImageView:rightImageName];
    }
    return self;
}

-(void)addLeftImageView:(NSString*)imageName{
    _imgLeft = [UIImageView new];
    [self addSubview:_imgLeft];
     UIImage *image = [UIImage imageNamed:imageName];
    [_imgLeft autoSetDimensionsToSize:image.size];
    [_imgLeft autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_imgLeft autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:_sideMargin];
    _imgLeft.image = image;
}
-(void)addLabel:(NSString*)titleText{
    _lblTitle = [UILabel new];
    [self addSubview:_lblTitle];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_lblTitle autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [_lblTitle autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_imgLeft withOffset:_sideMargin];
    _lblTitle.text = titleText;
}
-(void)addRightImageView:(NSString*)imageName{
    _imgRight = [UIImageView new];
    [self addSubview:_imgRight];
    UIImage *image = [UIImage imageNamed:imageName];
    [_imgRight autoSetDimensionsToSize:image.size];
    [_imgRight autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_imgRight autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:_sideMargin];
    _imgRight.image = image;
}
-(void)setSelected:(BOOL)selected{
    
}
@end
