//
//  EmployeesViewCell.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/11/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmployeesViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePicView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END
