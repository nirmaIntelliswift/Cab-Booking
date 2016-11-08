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

#import "SWRevealViewController.h"
#import "CBMenuDrawerHandler.h"


@interface CBMenuViewController ()

@end

@implementation CBMenuViewController
static NSString *cellIdentifier = @"CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMenuListData];
    [self addHeaderView];
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
                            @"Settings",@"Support",@"Configuration"];
    NSArray *imageNames = @[@"book_ride",@"contacts",
                            @"my_rides",@"my_wallet",
                            @"offers",@"rate_card",
                            @"settings",@"support",@"support"];
    for (int i  = 0 ; i < [imageNames count]; i++) {
        CBMenuModel *model = [CBMenuModel new];
        model.itemName = [itemNames objectAtIndex:i];
        model.itemImageName = [NSString stringWithFormat:@"ic_%@",[imageNames objectAtIndex:i]];
        [menuItems addObject:model];
    }
    
}
#pragma -mark addViews
-(void)addHeaderView{
    self.viewHeaderView = [[CBMenuHeader alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.viewHeaderView];
    [self.viewHeaderView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.viewHeaderView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.viewHeaderView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.viewHeaderView autoSetDimension:ALDimensionHeight toSize:170];
    
    UITapGestureRecognizer *tapGesture  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openProfile)];
    self.viewHeaderView.imgUserPhoto.userInteractionEnabled = YES;
    //[self.viewHeaderView.imgUserPhoto addGestureRecognizer:tapGesture];
    
}
-(void)updateHeader{
    [self.viewHeaderView setLayerColors];
}
-(void)addTableView{
    self.tableview = [[UITableView alloc]init];
    [self.tableview registerClass:[CBMenuCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.rowHeight = 44;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableview];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.tableview autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [self.tableview autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.viewHeaderView];
    [self.tableview layoutIfNeeded];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    //self.tableview.backgroundColor = [UIColor redColor];
   
}

#pragma mark -tableview DataSource
/*- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section{
   
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    [cell setData:[menuItems objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SWRevealViewController *revealController = self.revealViewController;
    UINavigationController *frontController = [CBMenuDrawerHandler getViewControllerForIndex:(int)indexPath.row];
    [revealController setFrontViewController:frontController animated:YES];    //sf
    [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
    [self selectMenuAtIndex:(int)indexPath.row];
    [self refreshTableView];
}
-(void)openProfile{
    SWRevealViewController *revealController = self.revealViewController;
    UINavigationController *frontController = [CBMenuDrawerHandler getViewControllerForIndex:[menuItems count]];
    [revealController setFrontViewController:frontController animated:YES];    //sf
    [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
}
-(void)selectMenuAtIndex:(int)index{
    for (int i = 0; i<[menuItems count]; i++) {
        CBMenuModel *model = [menuItems objectAtIndex:i];
        model.isSelected = NO;
        if (index == i) {
            model.isSelected = YES;
        }
    }
}
-(void)refreshTableView{
    dispatch_async(dispatch_get_main_queue(), ^{
         [self.tableview reloadData];
    });
}
@end
