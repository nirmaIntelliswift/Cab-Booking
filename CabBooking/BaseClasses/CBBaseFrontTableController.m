//
//  CBBaseFrontTableController.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontTableController.h"

@interface CBBaseFrontTableController ()

@end

@implementation CBBaseFrontTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTableView{
    self.tableview = [[UITableView alloc]init];
    self.tableview.rowHeight = 80;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.allowsSelection = NO;
    [self.view addSubview:self.tableview];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.tableview layoutIfNeeded];
    self.tableview.backgroundColor = [UIColor clearColor];
    
}
-(void)refreshTableView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableview reloadData];
    });
}

@end
