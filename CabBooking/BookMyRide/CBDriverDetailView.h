//
//  CBDriverDetailView.h
//  CabBooking
//
//  Created by Nirma on 23/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBUtility.h"
#import "CBButtonWithLeftImage.h"
#import "CBSepratorLine.h"
IB_DESIGNABLE
@interface CBDriverDetailView : UIView

IBInspectable
@property(nonatomic,strong)CBSepratorLine *viewSepratorLine;
#pragma mark UIImageViews
IBInspectable
@property(nonatomic,strong)UIImageView *imgDriverPhoto;
IBInspectable
@property(nonatomic,strong)UIImageView *imgRate;

#pragma mark UILabels
IBInspectable
@property(nonatomic,strong)UILabel *lblRateValue;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverName;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverCarType;
IBInspectable
@property(nonatomic,strong)UILabel *lblDriverCarNumber;
IBInspectable
@property(nonatomic,strong)UILabel *lblSelectPayment;

#pragma mark UIButtons
IBInspectable
@property(nonatomic,strong)CBButtonWithLeftImage *btnPaymentCash;
IBInspectable
@property(nonatomic,strong)CBButtonWithLeftImage *btnPaymentMyWallet;
IBInspectable
@property(nonatomic,strong)UIButton *btnCalldriver;
IBInspectable
@property(nonatomic,strong)UIButton *btnShareDirection;


@end
