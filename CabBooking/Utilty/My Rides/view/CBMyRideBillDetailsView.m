//
//  CBMyRideBillDetailsView.m
//  CabBooking
//
//  Created by Nirma on 24/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideBillDetailsView.h"
#import "LeftRightStrip.h"

@implementation CBMyRideBillDetailsView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       // [self addDetailViews];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
              data:(CBMyRideModel*)ride{
    self = [super initWithFrame:frame];
    if (self) {
        [self addDetailViews:ride];
    }
    return self;
}
-(void)addDetailViews:(CBMyRideModel*)ride{
    NSString *totalFare = [NSString stringWithFormat:@"%.2f",ride.totalFare];
    NSString *tax = [NSString stringWithFormat:@"%.2f",ride.invoice.serviceTax];
    NSString *roundedOff = [NSString stringWithFormat:@"%.2f",ride.invoice.roundedOff];
    NSString *offerDiscount = [NSString stringWithFormat:@"%.2f",ride.invoice.discount];
    NSString *totalBill = [NSString stringWithFormat:@"%.2f",ride.invoice.totalAmount];
    
    NSArray *leftTexts = @[@"Payment Mode",@"Bill Details",@"Total Fare",@"Tax",@"Rounded Off" ,@"Offer Discount ",@"Total Bill"];
    NSArray *rightTexts = @[ride.paymentMode,@"",totalFare,tax,roundedOff,offerDiscount,totalBill];
    NSMutableArray *allStripsView = [[NSMutableArray alloc]init];
    _heightView = 0;
    for (int i = 0 ; i<[leftTexts count]; i++) {
        
        UIFont *font = [self getLeftFont:[leftTexts objectAtIndex:i]];
        CGFloat lblHeight = [self getLabeleHeight:[leftTexts objectAtIndex:i]];
        
        LeftRightStrip *leftRightStrip = [[LeftRightStrip alloc]initWithLeftString:[leftTexts objectAtIndex:i] andRightString:[rightTexts objectAtIndex:i] withFont:font];
        if ([[leftTexts objectAtIndex: i] isEqualToString:@"Payment Mode"]) {
            leftRightStrip.lblRight.font = [UIFont fontWithName:FONT_REGULAR size:14];//[UIFont  systemFontOfSize:14];
            leftRightStrip.lblRight.textColor = [UIColor grayColor];
        }
        [self addSubview:leftRightStrip];
        [leftRightStrip autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
        [leftRightStrip autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
        [leftRightStrip autoSetDimension:ALDimensionHeight toSize:lblHeight];
        _heightView += lblHeight;
        if(i == 0){
           [leftRightStrip autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
            _heightView += 10;
        }
        else{
            [leftRightStrip autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:[allStripsView objectAtIndex:i-1] withOffset:7];
            _heightView += 7;
        }
       
        if ([self isSepratorAdded:[leftTexts objectAtIndex:i]]) {
            [self addSepratorLineToView:leftRightStrip];
        }
        [allStripsView addObject:leftRightStrip];
    }
    
    _heightView += 10;
}
-(BOOL)isSepratorAdded:(NSString*)text{
    NSArray *biggerHeightTexts =  @[@"Payment Mode",@"Tax",@"Offer Discount"];
    
    if ([biggerHeightTexts containsObject:text]) {
        return YES;
    }
    return NO;
}
-(UIFont*)getLeftFont:(NSString*)text{
    NSArray *biggerHeightTexts =  @[@"Payment Mode",@"Bill Details",@"Total Bill"];
   
    if ([biggerHeightTexts containsObject:text]) {
        return [UIFont fontWithName:FONT_MEDIUM size:17];//[UIFont systemFontOfSize:18 weight:2];;
    }
    
    return [UIFont fontWithName:FONT_REGULAR size:14];;//[UIFont systemFontOfSize:14];;
}
-(CGFloat)getLabeleHeight:(NSString*)text{
   NSArray *biggerHeightTexts =  @[@"Bill Details",@"Total Bill"];
    NSArray *biggestHeightTexts =  @[@"Payment Mode"];
    if ([biggerHeightTexts containsObject:text]) {
        return 38;
    }
    if ([biggestHeightTexts containsObject:text]) {
        return 55;
    }
    return 30;
}
-(void)addSepratorLineToView:(UIView*)view{
    CBSepratorLine *viewSepratorLine = [[CBSepratorLine alloc]init];
    [view addSubview: viewSepratorLine];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:10];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [ viewSepratorLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [ viewSepratorLine autoSetDimension:ALDimensionHeight toSize:0.5];
}
@end
