//
//  CBBaseViewController.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseViewController.h"
#import "MBProgressHUD.h"

@interface CBBaseViewController ()

@end

@implementation CBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(COLOR_MAIN_BACKGROUND);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showLoader{
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)hideLoader{
    ASYNC_MAIN(
               [MBProgressHUD hideHUDForView:self.view animated:YES];
               );
}
-(void)callRequestWithParameters:(NSMutableDictionary*)params
                       requestId:(int)requestId{
    [self showLoader];
    NetworkParser *business = [[NetworkParser alloc]init];
    business.delegate = self;
    [business sendRequestWithParams:params requestId:requestId];
}
-(void)callGetRequestWithParameters:(NSMutableDictionary*)params
                       requestId:(int)requestId{
    [self showLoader];
    NetworkParser *business = [[NetworkParser alloc]init];
    business.delegate = self;
    [business sendGetRequestWithParams:params requestId:requestId];
}

-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)nameOfAPI{
    NSError *error;
    [self hideLoader];
  //  BulletinModel* country = [[BulletinModel alloc] initWithString:dataObj error:&error];
   // NSLog(@" response-->%@",country);
    
}
-(void)onBusinessFailure:(id)dataObj withAPIName:(int)nameOfAPI{
     [self hideLoader];
}
-(void)setBackButton{
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backViewController)];
    [self.navigationItem setLeftBarButtonItem:menuItem];
    menuItem.tintColor = [UIColor blackColor];
}
-(void)backViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
