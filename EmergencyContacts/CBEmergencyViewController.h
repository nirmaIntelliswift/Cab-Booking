//
//  CBEmergencyViewController.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontTableController.h"
#import "CBEmeregencyContactCell.h"
#import "CBEmergencyContactsModel.h"

@interface CBEmergencyViewController : CBBaseFrontTableController{
    CBEmergencyContactsModel *dataContacts;
}

@end
