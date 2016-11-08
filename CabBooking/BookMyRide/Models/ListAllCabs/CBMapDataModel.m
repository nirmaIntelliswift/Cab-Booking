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
-(void)updateLocationForCabs:(NSArray*)cabs{
    for(int i = 0 ; i<[cabs count] ; i++){
        CBCarModel *cabModel = [cabs objectAtIndex:i];
        [self updateCabDetailsForCab:cabModel];
    }
}
-(void)updateCabDetailsForCab:(CBCarModel*)cab{
    for(int j = 0 ; j<[_cabCategory count] ; j++){
        CBCarCategoryModel  *cabCategory = [_cabCategory objectAtIndex:j];
        for(int k = 0 ; k<[cabCategory.cabs count] ; k++){
            CBCarModel *oldCab = [cabCategory.cabs objectAtIndex:k];
            if (oldCab.cabId == cab.cabId) {
                oldCab.latitude = cab.latitude;
                oldCab.longitude = cab.longitude;
            }
        }
    }

}
@end
