//
//  CBMenuViewController.h
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *menuItems;
}

@property (strong, nonatomic)  UITableView *tableview;
@property (strong, nonatomic)  UIView *viewHeaderView;

@end
