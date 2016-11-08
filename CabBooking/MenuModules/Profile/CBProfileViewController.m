//
//  CBProfileViewController.m
//  CabBooking
//
//  Created by Nirma on 02/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBProfileViewController.h"
#import "CBProfileCell.h"
#import "ActionSheetViewController.h"

@interface CBProfileViewController ()

@end
static NSString *cellIdentifier = @"PROFILE_CELL";
@implementation CBProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = TITLE_PROFILE;
    [self setTableViewDetails];
    [self addBottomButton];
    [self requestUserProfile];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTableViewDetails{
   viewProfileHeader = [[CBProfileHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [self.tableview registerClass:[CBProfileCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableview.rowHeight = 60;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableHeaderView = viewProfileHeader;
    [viewProfileHeader.btnCameraIcon addTarget:self action:@selector(cameraIconClicked) forControlEvents:UIControlEventTouchUpInside];
}
-(void)addBottomButton{
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    
    [btn autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [btn autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [btn autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [btn autoSetDimension:ALDimensionHeight toSize:60];
    [btn setTitle:@"UPDATE" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(updateProfile) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = UIColorFromRGB(COLOR_PINK);
    
}
-(void)updateProfile{
    
}
-(void)refershData{
    dataUserHeadings = @[@"Email",@"First Name",@"Last Name",@"Mobile Number"];
    dataUserDetails = @[dataUser.email,dataUser.firstName,dataUser.lastName,[NSString stringWithFormat:@"%d",dataUser.mobile]];
    [self.tableview reloadData];
     viewProfileHeader.lblName.text = [dataUser getUserFullName];
    [viewProfileHeader.imgPhoto setImageFromUrl:dataUser.imageUrl];
}

-(void)cameraIconClicked{
    ActionSheetViewController *actionSheet = [[ActionSheetViewController alloc]initWithTitle:@"Profile Photo" leftImages:@[@"compactEnable",@"compactEnable",@"compactEnable"] btnTitles:@[@"Camera",@"Gallery",@"remove Photo"]];
    actionSheet.view.tag = 0;
    actionSheet.delegate = self;
    [actionSheet setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:actionSheet animated:NO completion:nil];
}
-(void)cbActionController:(UIViewController *)controller buttonClicked:(int)index{
    NSLog(@"button clicked = %d",index);
    switch (index) {
        case 1:
            [self takePhoto];
            break;
        case 2:
            [self selectPhoto];
            break;
        default:
            break;
    }
}
- (void)takePhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
- (void)selectPhoto {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    viewProfileHeader.imgPhoto.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
#pragma mark -requests
-(void)requestUserProfile{
    NSMutableDictionary *params = [ParameterBundler getUserData];
    [self callGetRequestWithParameters:params requestId:API_ID_USER_DATA];
}
#pragma mark -response
-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)idOfAPI{
     [super onBusinessSuccess:dataObj withAPIName:idOfAPI];
    ASYNC_MAIN(
               NSError *error;
                dataUser = [[CBUserDataModel alloc] initWithString:dataObj error:&error];
               [self refershData];
               //DLog(@" response-->%@",dataContacts.message);
               );
    
    
}
#pragma mark -tableview DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataUserHeadings count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CBProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CBProfileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.lblHeading.text = [dataUserHeadings objectAtIndex:indexPath.row];
    cell.lblDetail.text = [dataUserDetails objectAtIndex:indexPath.row];
   // [cell setData:[dataContacts.contacts objectAtIndex:indexPath.row]];
    
    return  cell;
}


@end
