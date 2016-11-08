//
//  ActionSheetViewController.m
//  DemoSearch
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "ActionSheetViewController.h"
#define ROW_HEIGHT 50
@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController
static NSString *cellIdentifier = @"CELL";

-(id)initWithTitle:(NSString*)title
        leftImages:(NSArray*)leftImages
         btnTitles:(NSArray*)btnsTitles{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        dataImages = [[NSMutableArray alloc]initWithArray:leftImages];
        dataTitles = [[NSMutableArray alloc]initWithArray:btnsTitles];
        [dataTitles insertObject:title atIndex:0];
        [self addBlackBackGround];
        [self addTableView:(int)[dataTitles count]];
        self.view.backgroundColor = [UIColor clearColor];
        [self performSelector:@selector(showTableView) withObject:nil afterDelay:0.2];
    }
    return self;
}
-(void)addTableView:(int)numberOfRows{
    tableView = [UITableView new];
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    constraintBottomY =  [tableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:-ROW_HEIGHT*numberOfRows];
    [tableView autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [tableView autoPinEdgeToSuperviewEdge:ALEdgeTrailing];
    [tableView autoSetDimension:ALDimensionHeight toSize:ROW_HEIGHT*numberOfRows];
    tableView.rowHeight = ROW_HEIGHT;
    tableView.delegate = self;
    tableView.dataSource = self;
    
}
-(void)showTableView{
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        constraintBottomY.constant = 0;
        
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
}
-(void)hideTableView{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        constraintBottomY.constant = ROW_HEIGHT*(int)[dataTitles count];
        backGround.alpha = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if (buttonIndex>0) {
                [self.delegate cbActionController:self buttonClicked:buttonIndex];
            }
            
        }];
    }];
}
-(void)addBlackBackGround{
    backGround = [[UIButton alloc]initWithFrame:self.view.frame];
    [self.view addSubview:backGround];
    [backGround setBackgroundColor:[UIColor blackColor]];
    backGround.alpha = 0.4;
    [backGround addTarget:self action:@selector(closeViewController) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)closeViewController{
    [self hideTableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataTitles count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [dataTitles objectAtIndex:indexPath.row];
    
    if (indexPath.row>0) {
        cell.imageView.image = [UIImage imageNamed:[dataImages objectAtIndex:indexPath.row-1]];
    }
    else{
        cell.textLabel.font = [UIFont boldSystemFontOfSize:cell.textLabel.font.pointSize];
    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    buttonIndex = (int)indexPath.row;
    
    [self closeViewController];
}

@end
