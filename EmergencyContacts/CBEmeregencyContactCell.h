//
//  CBEmeregencyContactCell.h
//  CabBooking
//
//  Created by Nirma on 19/09/16.
//  Copyright © 2016 Nirma. All rights reserved.
//

#import "CBBaseUITableCell.h"
#import "CBUIImageView.h"

@interface CBEmeregencyContactCell : CBBaseUITableCell

@property(nonatomic ,strong)CBUIImageView *imgContactPhoto;
@property(nonatomic ,strong)UILabel *lblContactName;
@property(nonatomic ,strong)UILabel *lblContactPhoneNumber;
@property(nonatomic ,strong)UIButton *btnTrash;


@end
