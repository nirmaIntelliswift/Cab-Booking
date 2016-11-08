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
    [self requestContacts];
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

#pragma mark -requests
-(void)requestContacts{
    NSMutableDictionary *params = [ParameterBundler getEmergencyContacts];
    [self callGetRequestWithParameters:params requestId:API_ID_EMERGENCY_CONTACTS];
}
#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
               dataContacts = [[CBEmergencyContactsModel alloc] initWithString:dataObj error:&error];
               [self.tableview reloadData];
               DLog(@" response-->%@",dataContacts.message);
               );
    
    
}
#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataContacts.contacts count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBEmeregencyContactCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBEmeregencyContactCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    [cell setData:[dataContacts.contacts objectAtIndex:indexPath.row]];
   
    return  cell;
}


@end
