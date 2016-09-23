//
//  CBBaseFrontTableController.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontViewController.h"

@interface CBBaseFrontTableController : CBBaseFrontViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)  UITableView *tableview;
@end
