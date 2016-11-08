//
//  CBMyRideViewController.m
//  CabBooking
//
//  Created by Nirma on 20/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMyRideViewController.h"
#import "CBMyRideDetailController.h"


@interface CBMyRideViewController ()

@end

@implementation CBMyRideViewController
static NSString *cellIdentifier = @"MY_RIDE_CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = TITLE_MY_RIDES;
    [self setTableViewDetails];
    [self requestMyRides];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTableViewDetails{
    self.tableview.rowHeight = 105;
    [self.tableview registerClass:[CBMyRideCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.allowsSelection = YES;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}
#pragma mark -requests
-(void)requestMyRides{
    NSMutableDictionary *params = [ParameterBundler getMyRidesStartIndex:0 count:10];
    [self callRequestWithParameters:params requestId:API_ID_MY_RIDES];
}
#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
               dataMyRides = [[CBRidesHistory alloc] initWithString:dataObj error:&error];
               [self.tableview reloadData];
               DLog(@" response-->%@",dataMyRides.message);
               );
    

}
#pragma mark -tableview Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self openMyRideDetailController];
}
#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataMyRides.rides count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBMyRideCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBMyRideCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setData:[dataMyRides.rides objectAtIndex:indexPath.row]];
    
    return  cell;
}
#pragma mark -open otherControllers
-(void)openMyRideDetailController{
    CBMyRideDetailController *detailController = [CBMyRideDetailController new];
    [self.navigationController pushViewController:detailController animated:YES];
}
@end
