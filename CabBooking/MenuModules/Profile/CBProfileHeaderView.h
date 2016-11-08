//
//  CBProfileHeaderView.h
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUIView.h"
#import "CBUIImageView.h"

@interface CBProfileHeaderView : CBBaseUIView

@property(nonatomic, strong)CBUIImageView *imgPhoto;
@property(nonatomic, strong)UILabel *lblName;
@property(nonatomic, strong)UIButton *btnCameraIcon;

@end
