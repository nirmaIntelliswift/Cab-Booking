//
//  CBMenuHeader.h
//  CabBooking
//
//  Created by Nirma on 15/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
#import "Constants.h"
#import "CBUIImageView.h"
@interface CBMenuHeader : UIView

@property(nonatomic ,strong)CBUIImageView *imgUserPhoto;
@property(nonatomic ,strong)UILabel *lblUserName;
@property(nonatomic ,strong)UILabel *lblUserEmailId;
- (void)setLayerColors;
@end
