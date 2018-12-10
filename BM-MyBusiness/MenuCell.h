//
//  MenuCell.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon_imageview;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *sepratorLine;

@end

NS_ASSUME_NONNULL_END
