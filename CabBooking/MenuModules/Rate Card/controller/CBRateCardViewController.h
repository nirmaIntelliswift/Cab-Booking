//
//  CBRateCardViewController.h
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontViewController.h"
#import "CBCitiesWithRateCardModel.h"
#import "CBRateCardView.h"
;
@interface CBRateCardViewController : CBBaseFrontViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDataSource,UITableViewDelegate>{
    CBCitiesWithRateCardModel *dataCitiesWithRateCard;
    NSArray *dataChargesDetails;
    CBRateCardView *rateCardView ;
    
    UITableView *tableViewRateCard;
}

@end
