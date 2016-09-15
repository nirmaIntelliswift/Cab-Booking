//
//  CBMenuViewController.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMenuViewController.h"
#import "CBMenuCell.h"
#import "CBMenuModel.h"

@interface CBMenuViewController ()

@end

@implementation CBMenuViewController
static NSString *cellIdentifier = @"CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMenuListData];
    [self addTableView];
    //self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setMenuListData{
    menuItems = [[NSMutableArray alloc]init];
    NSArray *itemNames = @[@"Book Your Ride",@"My Rides",
                            @"Rate Card",@"My Wallet",
                            @"Offers & Free Rides",@"Emeregency Contacts",
                            @"Settings",@"Support"];
    NSArray *imageNames = @[@"book_ride",@"contacts",
                            @"my_rides",@"my_wallet",
                            @"offers",@"rate_card",
                            @"settings",@"support"];
    for (int i  = 0 ; i < [imageNames count]; i++) {
        CBMenuModel *model = [CBMenuModel new];
        model.itemName = [itemNames objectAtIndex:i];
        model.itemImageName = [NSString stringWithFormat:@"ic_%@",[imageNames objectAtIndex:i]];
        [menuItems addObject:model];
    }
    
}
#pragma -mark addViews
-(void)addTableView{
    self.tableview = [[UITableView alloc]init];
    [self.tableview registerClass:[CBMenuCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.rowHeight = 44;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.allowsSelection = NO;
    [self.view addSubview:self.tableview];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.tableview layoutIfNeeded];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    //self.tableview.backgroundColor = [UIColor redColor];
   
}

#pragma mark -tableview DataSource
/*- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section{
   
}*/
-(int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    [cell setData:[menuItems objectAtIndex:indexPath.row]];
    
    return  cell;
}

@end
