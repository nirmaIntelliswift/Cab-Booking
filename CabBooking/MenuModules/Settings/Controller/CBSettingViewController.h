//
//  CBSettingViewController.h
//  CabBooking
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontTableController.h"
#import <GooglePlaces/GooglePlaces.h>

@interface CBSettingViewController : CBBaseFrontTableController<GMSAutocompleteViewControllerDelegate>{
    NSArray *dataTableHeadings;
    NSMutableArray *dataTableRows;
    
    int selectedSearchPlace;
}

@end
