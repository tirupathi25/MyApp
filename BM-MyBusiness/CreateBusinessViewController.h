//
//  CreateBusinessViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/5/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateBusinessViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *logoImageview;
@property (weak, nonatomic) IBOutlet UIButton *uploadImageBtn;

//Primary details
@property (weak, nonatomic) IBOutlet UIView *primaryDetailsView;
@property (weak, nonatomic) IBOutlet UILabel *primaryDetailsTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *bussinessNameField;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *address1Field;
@property (weak, nonatomic) IBOutlet UITextField *address2Field;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeField;
//Other details
@property (weak, nonatomic) IBOutlet UIView *otherDetailsView;
@property (weak, nonatomic) IBOutlet UILabel *otherDetilasTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryCodeLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *websiteField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfEmployeesField;
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

@property (weak, nonatomic) IBOutlet UIButton *createButton;


//properties
@property (strong,nonatomic) NSString *selectedBusinessId;

@end

NS_ASSUME_NONNULL_END
