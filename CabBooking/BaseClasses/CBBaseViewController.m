//
//  CBBaseViewController.m
//  CabBooking
//
//  Created by Nirma on 14/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseViewController.h"

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

-(void)callRequestWithParameters:(NSMutableDictionary*)params
                       requestId:(int)requestId{
    NetworkParser *business = [[NetworkParser alloc]init];
    business.delegate = self;
    [business sendRequestWithParams:params requestId:requestId];
}

-(void)onBusinessSuccess:(id)dataObj withAPIName:(int)nameOfAPI{
    NSError *error;
  //  BulletinModel* country = [[BulletinModel alloc] initWithString:dataObj error:&error];
   // NSLog(@" response-->%@",country);
    
}
-(void)onBusinessFailure:(id)dataObj withAPIName:(int)nameOfAPI{
    
}


@end
