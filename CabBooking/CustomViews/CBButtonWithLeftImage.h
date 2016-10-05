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
-(id)initWithLeftImageName:(NSString*)imageName
            rightImageName:(NSString*)rightImageName
                     title:(NSString*)titleText;
-(id)initWithLeftImageName:(NSString*)imageName
            rightImageName:(NSString *)rightImageName
                     title:(NSString*)titleText
            withSideMargin:(CGFloat)sideMargin;

@property (nonatomic ,strong)UIImageView *imgLeft;
@property (nonatomic ,strong)UIImageView *imgRight;
@property (nonatomic ,strong)UILabel *lblTitle;

@property(nonatomic,assign)CGFloat sideMargin;//by default 5

@end
