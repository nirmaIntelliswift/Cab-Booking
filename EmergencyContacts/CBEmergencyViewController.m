//
//  CBEmergencyViewController.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBEmergencyViewController.h"

@interface CBEmergencyViewController ()

@end

@implementation CBEmergencyViewController
static NSString *cellIdentifier = @"EMERGENCY_CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = TITLE_EMERGENCY_CONTACTS;
    [self setTableViewDetails];
    // Do any additional setup after loading the view.
}
-(void)setTableViewDetails{
    [self.tableview registerClass:[CBEmeregencyContactCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}


#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBEmeregencyContactCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBEmeregencyContactCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    //[cell setData:[menuItems objectAtIndex:indexPath.row]];
   
    return  cell;
}


@end
