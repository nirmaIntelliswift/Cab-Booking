//
//  ActionSheetViewController.h
//  DemoSearch
//
//  Created by Nirma on 03/11/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PureLayout.h"
@protocol CBActionSheetDelegate <NSObject>
-(void)cbActionController:(UIViewController*)controller buttonClicked:(int)index;


@end
@interface ActionSheetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *tableView;
    NSMutableArray *dataTitles;
    NSMutableArray *dataImages;
    NSLayoutConstraint *constraintBottomY;
    UIButton *backGround;
    int buttonIndex;
}
@property (nonatomic,weak)  id <CBActionSheetDelegate> delegate;
-(id)initWithTitle:(NSString*)title
        leftImages:(NSArray*)leftImages
         btnTitles:(NSArray*)btnsTitles;
@end
