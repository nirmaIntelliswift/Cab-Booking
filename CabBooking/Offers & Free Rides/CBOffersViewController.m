//
//  CBOffersViewController.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBOffersViewController.h"

@interface CBOffersViewController ()

@end

@implementation CBOffersViewController
static NSString *cellIdentifier = @"EMERGENCY_CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = TITLE_OFFERS_AND_RIDES;
    [self setTableViewDetails];
    [self requestOffers];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTableViewDetails{
    self.tableview.estimatedRowHeight = 90.0;
    self.tableview.rowHeight = UITableViewAutomaticDimension;// 90;
    [self.tableview registerClass:[CBOffersCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableview setNeedsLayout];
    [self.tableview layoutIfNeeded];
    [self.tableview reloadData];
}
#pragma mark -requests
-(void)requestOffers{
    NSMutableDictionary *params = [ParameterBundler getOffers];
    [self callGetRequestWithParameters:params requestId:API_ID_OFFERS];
}
#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
               dataOffers = [[CBOffersModel alloc] initWithString:dataObj error:&error];
               [self.tableview reloadData];
               DLog(@" response-->%@",dataOffers.message);
               );
    
    
}
#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataOffers.offers count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBOffersCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBOffersCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    if(indexPath.row%2 == 0){
        cell.lblOfferDetail.text = @"Lorem Lpsum is simply dummy text of the printing and type setting industry";
    }
    else{
        cell.lblOfferDetail.text = @"Free trip upto rs 150 for inviting james";
    }
    [cell setData:[dataOffers.offers objectAtIndex:indexPath.row]];
    
    return  cell;
}

@end
