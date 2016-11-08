//
//  CBProfileViewController.h
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontTableController.h"
#import "CBUserDataModel.h"
#import "CBProfileHeaderView.h"
#import "ActionSheetViewController.h"
@interface CBProfileViewController : CBBaseFrontTableController<CBActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    CBUserDataModel *dataUser;
    CBProfileHeaderView *viewProfileHeader ;
    
    NSArray *dataUserHeadings;
    NSArray *dataUserDetails;
    
}

@end
