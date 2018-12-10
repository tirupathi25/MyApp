//
//  MenuCell.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "MenuCell.h"
#import "Defines.h"
@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = blue_color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
