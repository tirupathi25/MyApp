//
//  ServiceCategoriesViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceCategoriesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property BOOL from_business_creation;
@property (strong,nonatomic) NSString *businessId;
@end

NS_ASSUME_NONNULL_END
