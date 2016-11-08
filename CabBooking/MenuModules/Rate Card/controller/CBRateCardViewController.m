//
//  CBRateCardViewController.m
//  CabBooking
//
//  Created by Nirma on 31/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBRateCardViewController.h"
#import "CBRateChargeCell.h"

@interface CBRateCardViewController ()

@end
static NSString *cellIdentifier = @"CELL";
@implementation CBRateCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = TITLE_RATE_CARD;
    [self requestRateCard];
     [self addTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addTableView{
    [self addRateCardView];
    tableViewRateCard = [UITableView new];
    [self.view addSubview:tableViewRateCard];
    [tableViewRateCard autoPinEdgesToSuperviewEdges];
    
     [tableViewRateCard registerClass:[CBRateChargeCell class] forCellReuseIdentifier:cellIdentifier];
    tableViewRateCard.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableViewRateCard.allowsSelection = NO;
    tableViewRateCard.rowHeight = 60;
    tableViewRateCard.sectionHeaderHeight = 30;
    tableViewRateCard.tableHeaderView = rateCardView;
    tableViewRateCard.delegate = self;
    tableViewRateCard.dataSource = self;
    
    
}
-(void)addRateCardView{
   rateCardView = [[CBRateCardView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 116)];
    /*[self.view addSubview:rateCardView];
    [rateCardView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(64, 0, 0, 0)];*/
    NSArray *textFields = @[ rateCardView.tfCity, rateCardView.tfCabCategory];
    for(int i = 0 ; i<[textFields count];i++){
        UITextField *textField   =  [textFields objectAtIndex:i];
        UIPickerView *citypicker = [[UIPickerView alloc] init];
        [citypicker setDataSource: self];
        [citypicker setDelegate: self];
        citypicker.showsSelectionIndicator = YES;
        citypicker.tag = i;
        textField.inputView = citypicker;
        textField.inputAccessoryView = [self getToolBar];
    }
   
    
   
    
}
-(UIToolbar*)getToolBar{
    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.frame=CGRectMake(0,0,320,44);
    //toolbar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(doneClicked:)];
    
    
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    return toolbar;
}
-(void)doneClicked:(id)sender{
    [self.view endEditing:YES];
}
#pragma mark -tableview DataSource
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.textLabel.font = [UIFont fontWithName:FONT_BOLD size:16];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [dataChargesDetails count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[dataChargesDetails objectAtIndex:section]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBRateChargeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBRateChargeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
   [cell setData:[[dataChargesDetails objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    return  cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0)
    return @"STANDARD CHARGES";
    else
    return @"EXTRA CHARGES";
}
#pragma mark -picker delegates
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag == 0) {
       return [dataCitiesWithRateCard.city count];
    }
    else{
         CBCityModel *cityData =  [dataCitiesWithRateCard getCityData:rateCardView.tfCity.text];
        return [cityData.rateCard count];
    }
    //return [dataCitiesWithRateCard.city count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
     if (pickerView.tag == 0) {
         CBCityModel *city = [dataCitiesWithRateCard.city objectAtIndex:row];
         return city.name;
     }
     else{
         CBCityModel *cityData =  [dataCitiesWithRateCard getCityData:rateCardView.tfCity.text];
        CBRateCardModel *cabRateCards = [cityData.rateCard objectAtIndex:row];
         return cabRateCards.categoryName;
     }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     if (pickerView.tag == 0) {
         CBCityModel *city = [dataCitiesWithRateCard.city objectAtIndex:row];
         rateCardView.tfCity.text = city.name;
     }
    else{
        CBCityModel *cityData =  [dataCitiesWithRateCard getCityData:rateCardView.tfCity.text];
        CBRateCardModel *cabRateCards = [cityData.rateCard objectAtIndex:row];
        rateCardView.tfCabCategory.text =  cabRateCards.categoryName;
    }
    
    [self setCityCabDataCharges];
    [tableViewRateCard reloadData];
}
#pragma mark -requests
-(void)requestRateCard{
    NSMutableDictionary *params = [ParameterBundler getRateCard];
    [self callGetRequestWithParameters:params requestId:API_ID_RATE_CARD];
}
#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
               dataCitiesWithRateCard = [[CBCitiesWithRateCardModel alloc] initWithString:dataObj error:&error];
                 DLog(@" response-->%@",dataCitiesWithRateCard.message);
               if([dataCitiesWithRateCard.city count]>0){
                   CBCityModel *cityData =  [dataCitiesWithRateCard.city objectAtIndex:0];
                   rateCardView.tfCity.text = cityData.name;
                    if([cityData.rateCard count]>0){
                        CBRateCardModel *cabRateCards = [cityData.rateCard objectAtIndex:0];
                        rateCardView.tfCabCategory.text = cabRateCards.categoryName;
                    }
                   
               }
               [self setCityCabDataCharges];
               [tableViewRateCard reloadData];
               
               );
    
    
}

-(void)setCityCabDataCharges{
    NSString *cityName = rateCardView.tfCity.text;
    NSString *cabCategory = rateCardView.tfCabCategory.text;
   CBCityModel *cityData =  [dataCitiesWithRateCard getCityData:cityName];
   CBRateCardModel *cabRateCards = [cityData getCabRateCard:cabCategory];
    if (cityData  && cabRateCards) {
        dataChargesDetails = @[cabRateCards.rate.standardRate,cabRateCards.rate.extraCharges];
    }
   
}
@end
