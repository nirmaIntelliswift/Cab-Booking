//
//  CBMyRideViewController.m
//  CabBooking
//
//  Created by Nirma on 20/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideViewController.h"

@interface CBMyRideViewController ()

@end

@implementation CBMyRideViewController
static NSString *cellIdentifier = @"MY_RIDE_CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = TITLE_MY_RIDES;
    [self setTableViewDetails];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTableViewDetails{
    self.tableview.rowHeight = 120;
    [self.tableview registerClass:[CBMyRideCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}
#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBMyRideCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBMyRideCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    //[cell setData:[menuItems objectAtIndex:indexPath.row]];
    
    return  cell;
}

@end
