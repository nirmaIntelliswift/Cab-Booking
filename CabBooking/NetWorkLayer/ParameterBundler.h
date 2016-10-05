//
//  ParameterBundler.h
//  Specimen
//
//  Created by Nirma on 18/05/16.
//  Copyright © 2016 Intelliswift. All rights reserved.
//

//This Class is Project specific
//It builds parameter dictionary for specfic API
//funcation called addCommonParametersInDic is used to add common keys in every request

#import <Foundation/Foundation.h>

@interface ParameterBundler : NSObject

+(NSMutableDictionary*)getAllCabsForLatitude:(double)latitude
                                   longitude:(double)longitude;
@end
