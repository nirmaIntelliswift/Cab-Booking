//
//  CBMapDataModel.m
//  CabBooking
//
//  Created by Nirma on 29/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBMapDataModel.h"

@implementation CBMapDataModel


-(void)mapSelectCabCategoryOfIndex:(int)index{
    for (int i = 0; i<[_cabCategory count]; i++) {
        CBCarCategoryModel *cabCat = [_cabCategory objectAtIndex:i];
        if (i == index) {
            cabCat.isSelected = YES;
        }
        else{
            cabCat.isSelected = NO;
        }
    }
}
-(CBCarCategoryModel*)getCabCategoryOfIndex:(int)index{
    
    return ([_cabCategory objectAtIndex:index]);
}
-(CBCarCategoryModel*)getSelectedCabCategory{
    CBCarCategoryModel *cabCat;
    for (int i = 0; i<[_cabCategory count]; i++) {
        CBCarCategoryModel *cabCat = [_cabCategory objectAtIndex:i];
        if (cabCat.isSelected) {
            return  cabCat;
        }
    }
    
    return  cabCat;
    
    
}
@end
