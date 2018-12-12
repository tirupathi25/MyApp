//
//  ServiceCategoryCell.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "ServiceCategoryCell.h"
#import "Defines.h"
@implementation ServiceCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = gray_color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
