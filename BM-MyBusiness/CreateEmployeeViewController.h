//
//  CreateEmployeeViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/11/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"
NS_ASSUME_NONNULL_BEGIN

@interface CreateEmployeeViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *firstNameField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *lastNameField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *mobileField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *priorityField;
@property (weak, nonatomic) IBOutlet UIButton *addServiceButton;
@property (weak, nonatomic) IBOutlet UIView *servicesView;
@property (weak, nonatomic) IBOutlet UILabel *servicesLabel;
@property (weak, nonatomic) IBOutlet UIButton *sameAsBusinessHoursBtn;
//BUsiness hours details
@property (weak, nonatomic) IBOutlet UIView *businesshoursView;
@property (weak, nonatomic) IBOutlet UILabel *businessHoursTitleLabel;
//days
@property (weak, nonatomic) IBOutlet UILabel *sundayLabel;
@property (weak, nonatomic) IBOutlet UIButton *sundayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *sundayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *sundayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *mondayLabel;
@property (weak, nonatomic) IBOutlet UIButton *mondayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *mondayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *mondayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (weak, nonatomic) IBOutlet UIButton *tuesdayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *wednsdayLabel;
@property (weak, nonatomic) IBOutlet UIButton *wednsdayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *wednsdayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *wednsdayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (weak, nonatomic) IBOutlet UIButton *thursdayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *thursdayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *thursdayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fridayLabel;
@property (weak, nonatomic) IBOutlet UIButton *fridayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *fridayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *fridayToTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *saturdayLabel;
@property (weak, nonatomic) IBOutlet UIButton *saturdayHolidayBox;
@property (weak, nonatomic) IBOutlet UILabel *saturdayFromTimeLAbel;
@property (weak, nonatomic) IBOutlet UILabel *saturdayToTimeLabel;
@end

NS_ASSUME_NONNULL_END
