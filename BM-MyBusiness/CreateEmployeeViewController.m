//
//  CreateEmployeeViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/11/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "Defines.h"
#import "Utilities.h"
#import "LGAlertView.h"
@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //add cell separator style
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    //add left bar button on navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handelCreateAndUpdateEmployee)];
    
    //form setup
    [self employeesFormSetup];
}

//method to create and update employess
-(void)handelCreateAndUpdateEmployee{
    
}
//setup method
-(void)employeesFormSetup{
    
    //text fields
    
    [UTILITIES addBottomborder:self.firstNameField withY:46 andwidth:self.view.frame.size.width-163];
    [UTILITIES addBottomborder:self.lastNameField withY:46 andwidth:self.view.frame.size.width-163];
    [UTILITIES addBottomborder:self.mobileField withY:46 andwidth:self.view.frame.size.width-163];
    [UTILITIES addBottomborder:self.priorityField withY:46 andwidth:self.view.frame.size.width-163];
    
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
    
    //default value for check
    self.sundayHolidayBox.selected = NO;
    self.mondayHolidayBox.selected = NO;
    self.tuesdayHolidayBox.selected = NO;
    self.wednsdayHolidayBox.selected = NO;
    self.thursdayHolidayBox.selected = NO;
    self.fridayHolidayBox.selected = NO;
    self.saturdayHolidayBox.selected = NO;
    
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
    
    //Same as Business hours check
    [self.sameAsBusinessHoursBtn addTarget:self
                                    action:@selector(handleSameasBusinessHoursCheck:) forControlEvents:UIControlEventTouchUpInside];
    
    self.sameAsBusinessHoursBtn.selected = NO;
    [self.sameAsBusinessHoursBtn setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.sameAsBusinessHoursBtn setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.sameAsBusinessHoursBtn.tintColor = blue_color;
    
    self.profileImageView.image = [UIImage imageNamed:@"profilepic"];
    self.profileImageView.layer.cornerRadius = 60;
    self.profileImageView.layer.borderColor = gray_color.CGColor;
    self.profileImageView.layer.borderWidth = 2;
    
    
    //service view border
    
}
//Same as Business hours check
-(void)handleSameasBusinessHoursCheck:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
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
        ;
        label.text = [UTILITIES convertDateFrom24To12HoursFormat:datePicker.date];
        
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
        ;
        label.text = [UTILITIES convertDateFrom24To12HoursFormat:datePicker.date];
        
    } cancelHandler:nil destructiveHandler:nil];
    
    timeAlertView.buttonsHeight = 44;
    [timeAlertView showAnimated:YES completionHandler:nil];
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
