//
//  PlansViewCell.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlansViewCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UIView *bgView;
    @property (weak, nonatomic) IBOutlet UILabel *priceLabel;
    @property (weak, nonatomic) IBOutlet UILabel *planNameLabel;
    @property (weak, nonatomic) IBOutlet UIButton *selectionBtn;
    
@end

NS_ASSUME_NONNULL_END
