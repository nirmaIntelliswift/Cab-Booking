//
//  CBSettingViewController.m
//  CabBooking
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBSettingViewController.h"
#import "CBSettingModel.h"
#import "CBSettingCell.h"
@interface CBSettingViewController ()

@end

@implementation CBSettingViewController
static NSString *cellIdentifier = @"SETTING_CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setTableViewDetails];
    [self addBottomButton];
     self.title = TITLE_SETTING;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setData{
    NSString *homeLocation = [CBUtility readFromDisk:USER_HOME_ADDRESS];
    if (homeLocation == nil) {
        homeLocation = @"Add Home location";
    }
    NSString *workLocation = [CBUtility readFromDisk:USER_WORK_ADDRESS];
    if (workLocation == nil) {
        workLocation = @"Add work location";
    }
    dataTableHeadings = @[@"Places",@"Profile",@"Password"];
    dataTableRows = [[NSMutableArray alloc]init];
    NSArray *leftImagesName = @[@[@"Home",@"Briefcase"],@[@"Briefcase"],@[@"Key"]];
    NSArray *rightImagesName = @[@[@"Edit",@"Edit"],@[@"ArrowForward"],@[@"ArrowForward"]];
    NSArray *headingName = @[@[@"Home",@"Work"],@[@"SetUp Corporate Profile"],@[@" Change Password"]];
    NSArray *detailNamesName = @[@[homeLocation,workLocation],@[@""],@[@""]];
    
    for (int  i= 0 ; i<[dataTableHeadings count]; i++) {
        NSArray *rowArray = [leftImagesName objectAtIndex:i];
        NSMutableArray *sectionData = [[NSMutableArray alloc]init];
        for (int j = 0; j<[rowArray count]; j++) {
            CBSettingModel *settingModel = [CBSettingModel new];
            settingModel.imageLeft = [[leftImagesName objectAtIndex:i]objectAtIndex:j];
            settingModel.imageRight = [[rightImagesName objectAtIndex:i]objectAtIndex:j];
            settingModel.lblHeading = [[headingName objectAtIndex:i]objectAtIndex:j];
            settingModel.lblDetail = [[detailNamesName objectAtIndex:i]objectAtIndex:j];
            settingModel.lblSectionName = [dataTableHeadings objectAtIndex:i];
            [sectionData addObject:settingModel];
        }
        [dataTableRows addObject:sectionData];
    }
    
}
-(void)setTableViewDetails{
    [self.tableview registerClass:[CBSettingCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.allowsSelection = YES;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.rowHeight = 56;
    self.tableview.sectionHeaderHeight = 42;
}
-(void)addBottomButton{
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    
    [btn autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [btn autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [btn autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [btn autoSetDimension:ALDimensionHeight toSize:60];
    [btn setTitle:@"LOG OUT " forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(updateProfile) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor grayColor];//UIColorFromRGB(COLOR_PINK);
    
}
-(void)updateProfile{
    
}

#pragma mark -tableview DataSource
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.textLabel.font = [UIFont fontWithName:FONT_BOLD size:16];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [dataTableRows count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CBSettingModel *settingModel =[[dataTableRows objectAtIndex:section]objectAtIndex:0];
    return settingModel.lblSectionName;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[dataTableRows objectAtIndex:section]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CBSettingModel *settingModel =[[dataTableRows objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
      //UITableViewCellAccessoryDisclosureIndicator;
    [cell setData:settingModel];
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        selectedSearchPlace = (int)indexPath.row;
        [self showSearchPlaceController];
    }
}
-(void)showSearchPlaceController{
    
        ASYNC_MAIN(
                   GMSAutocompleteViewController *autocompleteViewController = [[GMSAutocompleteViewController alloc] init];
                   GMSAutocompleteFilter *filter = [[GMSAutocompleteFilter alloc]init];
                   filter.country = @"IN";
                   filter.type = kGMSPlacesAutocompleteTypeFilterRegion;
                   // autocompleteViewController.autocompleteFilter.country = @"IN";
                   autocompleteViewController.autocompleteFilter = filter;
                   autocompleteViewController.delegate = self;
                   [self.navigationController presentViewController:autocompleteViewController animated:YES completion:nil];
                   );
        
        
    
}
#pragma mark - GMSAutocompleteViewControllerDelegate

- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place {
    // Dismiss the view controller and tell our superclass to populate the result view.
    DLog(@"location Address--->%@",place);
     [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    NSString *key = USER_HOME_ADDRESS;
    if (selectedSearchPlace == 1) {
        key = USER_WORK_ADDRESS;
    }
    [CBUtility storeToDisk:place.formattedAddress forKey:key];
    
    [self setData];
    [self.tableview reloadData];
    
    //[self autocompleteDidSelectPlace:place];
}
- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error {
    // Dismiss the view controller and notify our superclass of the failure.
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    // Dismiss the controller and show a message that it was canceled.
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (void)didRequestAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
