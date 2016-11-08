//
//  CBConfigrationViewController.m
//  CabBooking
//
//  Created by Nirma on 07/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBConfigrationViewController.h"

@interface CBConfigrationViewController ()

@end

@implementation CBConfigrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLabel];
    [self addTextFieldThemeColor1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addLabel{
    _lblHeading = [UILabel new];
    [self.view addSubview:_lblHeading];
    [_lblHeading autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:84];
    [_lblHeading autoAlignAxisToSuperviewAxis:ALAxisVertical];
    _lblHeading.textAlignment = NSTextAlignmentCenter;
    _lblHeading.text = @"Fill hex color value  eg:- ff0000";
    _lblHeading.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _lblHeading.textColor = [UIColor grayColor];
    
    
}
-(void)addTextFieldThemeColor1{
    _tfColorTheme1 = [UITextField new];
    _tfColorTheme2 = [UITextField new];
    
    [self.view addSubview:_tfColorTheme1];
    [self.view addSubview:_tfColorTheme2];
    
    [_tfColorTheme1 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [_tfColorTheme1 autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    //[_tfColorTheme1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:84];
     [_tfColorTheme1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lblHeading withOffset:10];
    [_tfColorTheme1 autoSetDimension:ALDimensionHeight toSize:40];
    
    [_tfColorTheme2 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [_tfColorTheme2 autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [_tfColorTheme2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_tfColorTheme1 withOffset:10];
    [_tfColorTheme2 autoSetDimension:ALDimensionHeight toSize:40];
    _tfColorTheme1.placeholder = @" Choose Color 1";
    _tfColorTheme2.placeholder = @" Choose Color 2";
    _tfColorTheme1.layer.borderColor = _tfColorTheme2.layer.borderColor = [UIColor blackColor].CGColor;
    _tfColorTheme1.layer.borderWidth  = _tfColorTheme2.layer.borderWidth = 0.5;
    
    
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    
    [btn autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [btn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_tfColorTheme2 withOffset:10];
    
    [btn setTitle:@"  Store Config  " forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(storeConfig) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    
    UIButton *theme1Button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    theme1Button.backgroundColor = UIColorFromRGB(COLOR_PINK);
    _tfColorTheme1.rightView = theme1Button;
    _tfColorTheme1.rightViewMode = UITextFieldViewModeAlways;
    //[theme1Button addTarget:self action:@selector(selectFromPallet) forControlEvents:UIControlEventTouchUpInside];
    
}
/*-(void)selectFromPallet{
    HRSampleColorPickerViewController2 *pallet = [[HRSampleColorPickerViewController2 alloc]initWithColor:[UIColor redColor] fullColor:YES];
    [self.navigationController pushViewController:pallet animated:YES];
}*/
-(void)storeConfig{
    if (_tfColorTheme1.text) {
        [CBUtility storeToDisk:_tfColorTheme1.text forKey:USER_COLOR_THEME1];
    }
    if (_tfColorTheme2.text) {
        [CBUtility storeToDisk:_tfColorTheme2.text forKey:USER_COLOR_THEME2];
    }
    SWRevealViewController *revealController = self.revealViewController;
    [revealController revealToggle:self.view];
  
}
@end
