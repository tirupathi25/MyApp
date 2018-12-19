//
//  CreateBusinessViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/5/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "CreateBusinessViewController.h"
#import "ServiceCategoriesViewController.h"
#import "LGAlertView.h"
#import "SharedData.h"
#import "Defines.h"
#import "Utilities.h"
@interface CreateBusinessViewController ()

@end

@implementation CreateBusinessViewController
{
    NSNumber *sundayFromTime,*mondayFromTime,*tuesdayFromTime,*wednesdayFromTime,*fridayFromTime,*thursdayFromTime,*saturdayFromTime,*sundayToTime,*mondayToTime,*tuesdayToTime,*wednesdayToTime,*fridayToTime,*thursdayToTime,*saturdayToTime;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    sundayFromTime=mondayFromTime=tuesdayFromTime=wednesdayFromTime=fridayFromTime=thursdayFromTime=saturdayFromTime=sundayToTime=mondayToTime=tuesdayToTime=wednesdayToTime=fridayToTime=thursdayToTime=saturdayToTime=[NSNumber numberWithInteger:0];
    
  
    self.primaryDetailsView.layer.cornerRadius = self.otherDetailsView.layer.cornerRadius = self.businesshoursView.layer.cornerRadius = 6;
    self.createButton.layer.cornerRadius = 6;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.logoImageview.layer.borderWidth = 2;
    self.logoImageview.layer.borderColor = white_color.CGColor;
    self.logoImageview.clipsToBounds = YES;
    self.logoImageview.layer.cornerRadius = 50;
    self.logoImageview.image = [UIImage imageNamed:@"addbusiness"];
    
    //method for set view
    [self createBusinessFormSetup];
    
}
-(void)createBusinessFormSetup{
    
    UITapGestureRecognizer *countryGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSelectCountry)];
    countryGesture.numberOfTapsRequired = 1;
    self.countryLabel.userInteractionEnabled = YES;
    [self.countryLabel addGestureRecognizer:countryGesture];
    
    
    UITapGestureRecognizer *stateGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSelectState)];
    stateGesture.numberOfTapsRequired = 1;
    self.stateLabel.userInteractionEnabled = YES;
    [self.stateLabel addGestureRecognizer:countryGesture];
    
    //add tags for checkbox
    self.sundayHolidayBox.tag = 1;
    self.mondayHolidayBox.tag = 2;
    self.tuesdayHolidayBox.tag = 3;
    self.wednsdayHolidayBox.tag = 4;
    self.thursdayHolidayBox.tag = 5;
    self.fridayHolidayBox.tag = 6;
    self.saturdayHolidayBox.tag = 7;
    
    //add tags for from time
    self.sundayFromTimeLAbel.tag = 1;
    self.mondayFromTimeLAbel.tag = 2;
    self.tuesdayFromTimeLAbel.tag = 3;
    self.wednsdayFromTimeLAbel.tag = 4;
    self.thursdayFromTimeLAbel.tag = 5;
    self.fridayFromTimeLAbel.tag = 6;
    self.saturdayFromTimeLAbel.tag = 7;
    
    //add tags for to time
    self.sundayToTimeLabel.tag = 1;
    self.mondayToTimeLabel.tag = 2;
    self.tuesdayToTimeLabel.tag = 3;
    self.wednsdayToTimeLabel.tag = 4;
    self.thursdayToTimeLabel.tag = 5;
    self.fridayToTimeLabel.tag = 6;
    self.saturdayToTimeLabel.tag = 7;
    
    
    //default value for check
    self.sundayHolidayBox.selected = NO;
    self.mondayHolidayBox.selected = NO;
    self.tuesdayHolidayBox.selected = NO;
    self.wednsdayHolidayBox.selected = NO;
    self.thursdayHolidayBox.selected = NO;
    self.fridayHolidayBox.selected = NO;
    self.saturdayHolidayBox.selected = NO;
    
    //gestures for from time labels
    
    UITapGestureRecognizer *fromTimeGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture1.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture2.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture3.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture4.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture5.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture6.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *fromTimeGesture7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleFromTime:)];
    fromTimeGesture7.numberOfTapsRequired = 1;
    
    self.sundayFromTimeLAbel.userInteractionEnabled = YES;
    self.mondayFromTimeLAbel.userInteractionEnabled = YES;
    self.tuesdayFromTimeLAbel.userInteractionEnabled = YES;
    self.wednsdayFromTimeLAbel.userInteractionEnabled = YES;
    self.thursdayFromTimeLAbel.userInteractionEnabled = YES;
    self.fridayFromTimeLAbel.userInteractionEnabled = YES;
    self.saturdayFromTimeLAbel.userInteractionEnabled = YES;
    
    [self.sundayFromTimeLAbel addGestureRecognizer:fromTimeGesture1];
    [self.mondayFromTimeLAbel addGestureRecognizer:fromTimeGesture2];
    [self.tuesdayFromTimeLAbel addGestureRecognizer:fromTimeGesture3];
    [self.wednsdayFromTimeLAbel addGestureRecognizer:fromTimeGesture4];
    [self.thursdayFromTimeLAbel addGestureRecognizer:fromTimeGesture5];
    [self.fridayFromTimeLAbel addGestureRecognizer:fromTimeGesture6];
    [self.saturdayFromTimeLAbel addGestureRecognizer:fromTimeGesture7];

    
    //gestures for To time labels
    
    UITapGestureRecognizer *toTimeGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture1.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture2.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture3.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture4.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture5.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture6.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *toTimeGesture7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleToTime:)];
    toTimeGesture7.numberOfTapsRequired = 1;
    
    self.sundayToTimeLabel.userInteractionEnabled = YES;
    self.mondayToTimeLabel.userInteractionEnabled = YES;
    self.tuesdayToTimeLabel.userInteractionEnabled = YES;
    self.wednsdayToTimeLabel.userInteractionEnabled = YES;
    self.thursdayToTimeLabel.userInteractionEnabled = YES;
    self.fridayToTimeLabel.userInteractionEnabled = YES;
    self.saturdayToTimeLabel.userInteractionEnabled = YES;
    
    [self.sundayToTimeLabel addGestureRecognizer:toTimeGesture1];
    [self.mondayToTimeLabel addGestureRecognizer:toTimeGesture2];
    [self.tuesdayToTimeLabel addGestureRecognizer:toTimeGesture3];
    [self.wednsdayToTimeLabel addGestureRecognizer:toTimeGesture4];
    [self.thursdayToTimeLabel addGestureRecognizer:toTimeGesture5];
    [self.fridayToTimeLabel addGestureRecognizer:toTimeGesture6];
    [self.saturdayToTimeLabel addGestureRecognizer:toTimeGesture7];

   //actions for check box
    
    [self.sundayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.sundayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];

    [self.mondayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.mondayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.tuesdayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.tuesdayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.wednsdayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.wednsdayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.thursdayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.thursdayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.fridayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.fridayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    [self.saturdayHolidayBox setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.saturdayHolidayBox setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    
    self.sundayHolidayBox.tintColor = blue_color;
    self.mondayHolidayBox.tintColor = blue_color;
    self.tuesdayHolidayBox.tintColor = blue_color;
    self.wednsdayHolidayBox.tintColor = blue_color;
    self.thursdayHolidayBox.tintColor = blue_color;
    self.fridayHolidayBox.tintColor = blue_color;
    self.saturdayHolidayBox.tintColor = blue_color;
    
    [self.sundayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.mondayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.tuesdayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.wednsdayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.thursdayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.fridayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.saturdayHolidayBox addTarget:self action:@selector(handleHolidayCheckAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //upload image action
    [self.uploadImageBtn addTarget:self action:@selector(handleUploadImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.createButton addTarget:self action:@selector(handleCreateBusiness) forControlEvents:UIControlEventTouchUpInside];
    [self.createButton setTitle:@"Continue" forState:UIControlStateNormal];
}
//create business
-(void)handleCreateBusiness{
    
    
    [[SHAREDDATA createBusiness_data_dictionary] setObject:[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY] forKey:@"publisherId"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.selectedBusinessId  forKey:@"businessId"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.bussinessNameField.text forKey:@"name"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:@"" forKey:@"icon" ];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.address1Field.text forKey:@"address1" ];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.address2Field.text forKey:@"address2" ];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.cityField.text forKey:@"city" ];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.stateLabel.text  forKey:@"state"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.countryLabel.text forKey:@"currencyCode"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.zipCodeField.text forKey:@"zipCode"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.phoneNumberField.text forKey:@"phone"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.emailField.text forKey:@"email"];
    [[SHAREDDATA createBusiness_data_dictionary] setObject:self.numberOfEmployeesField.text forKey:@"noOfEmployees"];
    NSLog(@"%@",[NSNumber numberWithBool:self.sundayHolidayBox.selected]);
    [[SHAREDDATA createBusiness_data_dictionary] setObject:@{
  @"1":@{
          @"open":_sundayHolidayBox.selected ? @0 : sundayFromTime,
          @"close": _sundayHolidayBox.selected ? @0 : sundayToTime,
          @"holiday": [NSNumber numberWithBool:self.sundayHolidayBox.selected]
          },
 @"2": @{
         @"open":_mondayHolidayBox.selected ? @0 : mondayFromTime,
         @"close":_mondayHolidayBox.selected ? @0 : mondayToTime,
         @"holiday": [NSNumber numberWithBool:self.mondayHolidayBox.selected]
         },
 @"3": @{
         @"open": _tuesdayHolidayBox.selected ? @0 : tuesdayFromTime,
         @"close": _tuesdayHolidayBox.selected ? @0 : tuesdayToTime,
         @"holiday": [NSNumber numberWithBool:self.tuesdayHolidayBox.selected]
         },
 @"4": @{
         @"open": _wednsdayHolidayBox.selected ? @0 : wednesdayFromTime,
         @"close": _wednsdayHolidayBox.selected ? @0 : wednesdayToTime,
         @"holiday": [NSNumber numberWithBool:self.wednsdayHolidayBox.selected]
         },
 @"5": @{
         @"open": _thursdayHolidayBox.selected ? @0 : thursdayFromTime,
         @"close": _thursdayHolidayBox.selected ? @0 : thursdayToTime,
         @"holiday": [NSNumber numberWithBool:self.thursdayHolidayBox.selected]
         },
 @"6": @{
         @"open": _fridayHolidayBox.selected ? @0 : fridayFromTime,
         @"close": _fridayHolidayBox.selected ? @0 : fridayToTime,
         @"holiday": [NSNumber numberWithBool:self.fridayHolidayBox.selected]
         },
 @"7": @{
         @"open": _saturdayHolidayBox.selected ? @0 : saturdayFromTime,
         @"close": _saturdayHolidayBox.selected ? @0 : saturdayToTime,
         @"holiday": [NSNumber numberWithBool:self.saturdayHolidayBox.selected]
         }
 } forKey:@"businessHours"];
    

    ServiceCategoriesViewController *serviceView = [STORYBOARD instantiateViewControllerWithIdentifier:@"ServiceCategoriesViewController"];
    serviceView.from_business_creation = YES;
    serviceView.businessId = self.selectedBusinessId;
    [self.navigationController pushViewController:serviceView animated:YES];
    
}
//upload image
-(void)handleUploadImage{
    
}
//holiday
-(void)handleHolidayCheckAction:(UIButton *)sender{
    
    if (sender.selected) {
        sender.selected = NO;
        

        switch (sender.tag) {
            case 1:
                self.sundayFromTimeLAbel.hidden = NO;
                self.sundayToTimeLabel.hidden = NO;
                break;
             case 2:
                self.mondayFromTimeLAbel.hidden = NO;
                self.mondayToTimeLabel.hidden = NO;
                break;
            case 3:
                self.tuesdayFromTimeLAbel.hidden = NO;
                self.tuesdayToTimeLabel.hidden = NO;
                break;
            case 4:
                self.wednsdayFromTimeLAbel.hidden = NO;
                self.wednsdayToTimeLabel.hidden = NO;
                break;
            case 5:
                self.thursdayFromTimeLAbel.hidden = NO;
                self.thursdayToTimeLabel.hidden = NO;
                break;
            case 6:
                self.fridayFromTimeLAbel.hidden = NO;
                self.fridayToTimeLabel.hidden = NO;
                break;
            case 7:
                self.saturdayFromTimeLAbel.hidden = NO;
                self.saturdayToTimeLabel.hidden = NO;
                break;
            default:
                break;
        }
        
    } else {
        sender.selected = YES;
        
        
        switch (sender.tag) {
            case 1:
                self.sundayFromTimeLAbel.hidden = YES;
                self.sundayToTimeLabel.hidden = YES;
                break;
            case 2:
                self.mondayFromTimeLAbel.hidden = YES;
                self.mondayToTimeLabel.hidden = YES;
                break;
            case 3:
                self.tuesdayFromTimeLAbel.hidden = YES;
                self.tuesdayToTimeLabel.hidden = YES;
                break;
            case 4:
                self.wednsdayFromTimeLAbel.hidden = YES;
                self.wednsdayToTimeLabel.hidden = YES;
                break;
            case 5:
                self.thursdayFromTimeLAbel.hidden = YES;
                self.thursdayToTimeLabel.hidden = YES;
                break;
            case 6:
                self.fridayFromTimeLAbel.hidden = YES;
                self.fridayToTimeLabel.hidden = YES;
                break;
            case 7:
                self.saturdayFromTimeLAbel.hidden = YES;
                self.saturdayToTimeLabel.hidden = YES;
                break;
            default:
                break;
        }
    }
    
}
//from time
-(void)handleFromTime:(UITapGestureRecognizer *)sender{
    
    UILabel *label = (UILabel *)sender.view;
  
    [self.view endEditing:YES];
    UIDatePicker *datePicker;
    datePicker = [UIDatePicker new];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.frame = CGRectMake(0.0, 0.0, datePicker.frame.size.width, 160.0);
    
    
    LGAlertView *timeAlertView = [[LGAlertView alloc] initWithViewAndTitle:@"" message:@"" style:LGAlertViewStyleAlert view:datePicker buttonTitles:@[@"Add"] cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil actionHandler:^(LGAlertView * _Nonnull alertView, NSUInteger index, NSString * _Nullable title) {
        
        
        label.text = [UTILITIES convertDateFrom24To12HoursFormat:datePicker.date];
        
        
        switch (label.tag) {
            case 1:
                self->sundayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 2:
                self->mondayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 3:
                self->tuesdayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 4:
                self->wednesdayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 5:
                self->thursdayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 6:
                self->fridayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 7:
                self->saturdayFromTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            default:
                break;
        }
        
    } cancelHandler:nil destructiveHandler:nil];
    
    timeAlertView.buttonsHeight = 44;
    [timeAlertView showAnimated:YES completionHandler:nil];
    
}
//to time
-(void)handleToTime:(UITapGestureRecognizer *)sender{
    
    UILabel *label = (UILabel *)sender.view;
    
    [self.view endEditing:YES];
    UIDatePicker *datePicker;
    datePicker = [UIDatePicker new];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.frame = CGRectMake(0.0, 0.0, datePicker.frame.size.width, 160.0);
    
    
    LGAlertView *timeAlertView = [[LGAlertView alloc] initWithViewAndTitle:@"" message:@"" style:LGAlertViewStyleAlert view:datePicker buttonTitles:@[@"Add"] cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil actionHandler:^(LGAlertView * _Nonnull alertView, NSUInteger index, NSString * _Nullable title) {
        
        label.text = [UTILITIES convertDateFrom24To12HoursFormat:datePicker.date];
        
        switch (label.tag) {
            case 1:
                self->sundayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 2:
                self->mondayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 3:
                self->tuesdayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 4:
                self->wednesdayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 5:
                self->thursdayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 6:
                self->fridayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            case 7:
                self->saturdayToTime = [UTILITIES convertTiemToMinutes:datePicker.date];
                break;
            default:
                break;
        }
        
        
        
    } cancelHandler:nil destructiveHandler:nil];
    
    timeAlertView.buttonsHeight = 44;
    [timeAlertView showAnimated:YES completionHandler:nil];
    
}
//select country
-(void)handleSelectCountry{
    
}
//select state
-(void)handleSelectState{
    
}
@end
