//
//  CBFooterButtonsView.m
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBFooterButtonsView.h"

@implementation CBFooterButtonsView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addButtons];
    }
    return self;
}
-(void)addButtons{
    _btnComplaint = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_call" title:@"COMPLAINT"];
    _btnInvoice = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_call" title:@"INVOICE"];
    _btnSupport = [[CBButtonWithLeftImage alloc]initWithImageName:@"ic_call" title:@"SUPPORT"];
    
    NSArray *btns = @[_btnComplaint,_btnInvoice,_btnSupport];
    
    for (int i = 0; i<[btns count]; i++) {
        CBButtonWithLeftImage *btn = [btns objectAtIndex:i];
        [self addSubview:btn];
        [btn autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [btn autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [btn autoConstrainAttribute:ALAttributeWidth toAttribute:ALAttributeWidth ofView:self withMultiplier:.32];
        btn.lblTitle.font = [UIFont fontWithName:FONT_REGULAR size:14];
    }
    //_btnInvoice.backgroundColor = [UIColor blueColor];
    CBSepratorLine *viewSepratorLine = [[CBSepratorLine alloc]init];
    [_btnInvoice addSubview: viewSepratorLine];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [ viewSepratorLine autoSetDimension:ALDimensionWidth toSize:0.5];
    
    CBSepratorLine *viewSepratorLine1 = [[CBSepratorLine alloc]init];
    [_btnInvoice addSubview: viewSepratorLine1];
    [ viewSepratorLine1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [ viewSepratorLine1 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [ viewSepratorLine1 autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [ viewSepratorLine1 autoSetDimension:ALDimensionWidth toSize:0.5];
    
    [_btnInvoice autoAlignAxisToSuperviewAxis:ALAxisVertical];
     [_btnComplaint autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:_btnInvoice withOffset:-5];
   [_btnSupport autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:_btnInvoice withOffset:5];

}
@end
