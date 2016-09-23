//
//  CBBaseFrontViewController.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontViewController.h"
#import "SWRevealViewController.h"

@interface CBBaseFrontViewController ()

@end

@implementation CBBaseFrontViewController
@synthesize overlayView;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationButton];
    // Do any additional setup after loading the view.
}
-(void)addNavigationButton{
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];//
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    [self.navigationItem setLeftBarButtonItem:menuItem];
    menuItem.tintColor = [UIColor blackColor];
    //[self addOverLayView];
}
-(void)addOverLayView{
    overlayView = [UIButton buttonWithType:UIButtonTypeCustom];
    overlayView.frame = self.revealViewController.frontViewController.view.bounds;
    overlayView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
    overlayView.tag = 999;
    [overlayView addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [overlayView addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    //[overlayView addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchDragOutside];
    [self.revealViewController.frontViewController.view addSubview:overlayView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
