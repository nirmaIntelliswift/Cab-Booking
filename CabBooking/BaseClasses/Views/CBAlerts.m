//
//  CBAlerts.m
//  CabBooking
//
//  Created by Nirma on 20/10/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBAlerts.h"
#import "Constants.h"

@implementation CBAlerts

+(void)showTitle:(NSString*)title withMessage:(NSString*)message controller:(UIViewController*)con{
    ASYNC_MAIN(
               UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
               [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
               }]];
               [con presentViewController:alertController animated:YES completion:nil];
    );
   
}
+(void)showMessage:(NSString*)message controller:(UIViewController*)con{
    [CBAlerts showTitle:@"" withMessage:message controller:con];
}
+(void)showActionSheetWithTitles:(NSArray*)titles selectors:(NSArray*)selectors controller:(UIViewController*)con{
    
    ASYNC_MAIN(
               UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
               [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
               [con presentViewController:alertController animated:YES completion:nil];
               );
    
}
@end
