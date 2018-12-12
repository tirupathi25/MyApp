//
//  ServiceCategoryCell.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceCategoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *serviceNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIView *serviceBgView;
@property (weak, nonatomic) IBOutlet UIView *addBgView;
@property (weak, nonatomic) IBOutlet UILabel *addTitleLabel;

@end

NS_ASSUME_NONNULL_END
