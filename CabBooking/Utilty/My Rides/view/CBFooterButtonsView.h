//
//  CBFooterButtonsView.h
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBButtonWithLeftImage.h"
#import <PureLayout/PureLayout.h>
#import "CBSepratorLine.h"

@interface CBFooterButtonsView : UIView

@property(nonatomic,strong)CBButtonWithLeftImage *btnComplaint;
@property(nonatomic,strong)CBButtonWithLeftImage *btnInvoice;
@property(nonatomic,strong)CBButtonWithLeftImage *btnSupport;
@end
