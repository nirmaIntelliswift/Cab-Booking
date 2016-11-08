//
//  CBMyRideView.h
//  CabBooking
//
//  Created by Nirma on 21/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBMyRideDriverView.h"
#import "CBMyRideToFromView.h"
#import "CBSepratorLine.h"
#import "CBButtonWithLeftImage.h"
#import "CBFooterButtonsView.h"
#import "CBMyRideBillDetailsView.h"
#import "CBMapView.h"
#import "CBMyRideModel.h"

@interface CBMyRideView : UIView{
    
}
@property(nonatomic,strong)CBMapView *mapView;
@property(nonatomic,strong)CBMyRideDriverView *viewDriverDetail;
@property(nonatomic,strong)CBMyRideToFromView *viewDestinationDetail;
@property(nonatomic,strong)UILabel *lblPriceDistanceTime;
@property(nonatomic,strong)CBMyRideBillDetailsView *viewPaymentMode;
@property(nonatomic,strong)CBFooterButtonsView *viewFooterButtons;
@property(nonatomic,strong)CBButtonWithLeftImage *btnComplaint;
@property(nonatomic,strong)CBButtonWithLeftImage *btnInvoice;
@property(nonatomic,strong)CBButtonWithLeftImage *btnSupport;

-(CGFloat)viewHeight;
-(id)initWithFrame:(CGRect)frame
              data:(CBMyRideModel*)data;
-(void)setMapRide:(CBMyRideModel*)data;
@end
