//
//  CBDriverDetailView.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBUtility.h"

IB_DESIGNABLE
@interface CBDriverDetailView : UIView

IBInspectable
@property(nonatomic,strong)UIImageView *imgDriverPhoto;
IBInspectable
@property(nonatomic,strong)UIImageView *imgRate;
IBInspectable
@property(nonatomic,strong)UILabel *lblRateValue;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverName;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverCarType;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverCarNumber;
IBInspectable
@property(nonatomic,strong)UIButton *btnPaymentCash;
IBInspectable
@property(nonatomic,strong)UIButton *btnPaymentMyWallet;
IBInspectable
@property(nonatomic,strong)UIButton *btnCalldriver;
IBInspectable
@property(nonatomic,strong)UIButton *btnShareDirection;

@end
