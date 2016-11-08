//
//  CBBaseFrontViewController.m
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseFrontViewController.h"


@interface CBBaseFrontViewController ()

@end

@implementation CBBaseFrontViewController
@synthesize overlayView;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMenuButton];
    // Do any additional setup after loading the view.
}
-(void)setMenuButton{
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
    overlayView.backgroundColor = [UIColor blackColor];
    overlayView.alpha = 0.15;
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
-(void)setBackButton{
    SWRevealViewController *revealController = self.revealViewController;
    
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    [self.view removeGestureRecognizer:revealController.panGestureRecognizer];
    [super setBackButton];
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
