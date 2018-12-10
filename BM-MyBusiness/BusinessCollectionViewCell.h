//
//  BusinessCollectionViewCell.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BusinessCollectionViewCell : UICollectionViewCell
    @property (weak, nonatomic) IBOutlet UIImageView *iconView;
    @property (weak, nonatomic) IBOutlet UILabel *title_Label;
    @property (weak, nonatomic) IBOutlet UIView *bgView;
    
@end

NS_ASSUME_NONNULL_END
