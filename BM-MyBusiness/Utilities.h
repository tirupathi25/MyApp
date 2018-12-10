//
//  Utilities.h
//  TRxADE
//
//  Created by Lavanya on 07/06/18.
//  Copyright © 2018 Amzur Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "LGAlertView.h"
#import "UIView+Toast.h"

@interface Utilities : NSObject<UIAlertViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic)  MBProgressHUD *progressHUD;
@property (strong, nonatomic) MBProgressHUD *progressview;
+(Utilities *)sharedInstace;
//-(void)showAlertTitle:(NSString *)title withMessage:(NSString *)message onView:(UIViewController *)viewController;

-(void)showHud:(UIView *)view withText:(NSString *)text;
-(void)hideHUDInView:(UIView *)view;
-(BOOL)connected;
-(void)showNetworkAlertonView:(UIViewController *)viewController;
-(NSString *)commonDateFotmate:(NSDate *)date;
- (BOOL)validateEmailWithString:(NSString*)email;
-(BOOL)validateZipCode:(NSString *)str;
-(NSString *)handleRemoveWhiteSpacesAndNewLines:(NSString *)str;
-(BOOL)validatePhonewithstring:(NSString *)phone_num;
-(BOOL)validatePassword:(NSString *)password;
-(BOOL)validatePhoneNumberinUSFormat:(NSString *)phone and:(UITextField *)textField;
-(NSString *)handleRemoveSpecialCharcters:(NSString *)str;
-(NSString *)setPhoneNumberFormat:(NSString *)str;
-(BOOL)validationForName:(NSString *)str;
-(BOOL)validateAcceptOnlyNumbericValues:(NSString *)age;
-(BOOL)validateAcceptOnlyCharacters:(NSString *)str;
-(void)addRedBottomborder:(UITextField *)textfield;
-(BOOL)dontAcceptEmojees:(NSString *)str;
-(void)addBottomborder:(UITextField *)textfield withY:(float)y andwidth:(float)width;
-(void)changebottonbordercolor:(UITextField *)textfield and:(UIColor*)color;
-(NSString *)convertDateFrom24To12HoursFormat:(NSDate *)date;
-(NSString *)convertTimestampToDate:(NSString *)timeitervel;
-(NSString *)convertDateToDate:(NSString *)dateStr;
-(NSString *)convertToDate:(NSString *)dateString;


-(NSString *)phoneAndCountryCodeFormate:(NSString *)phoneNumber;
-(void)ShowAlert:(NSString *)title and:(NSString *)message;
-(void)removeDefaults;


-(NSDate *)convertTimeToDate:(NSString *)string;
-(NSString *)calculateTime:(NSDate *)fromDate and:(NSDate *)toDate;
-(BOOL)isValidPhoneNumber:(NSString *)phoneNumber withRegion:(NSString *)region;
-(void)delete_temporaryimages;

-(void)methodTOGetCall:(NSString *)phNumber;

-(void)showTostAlert:(NSString *)message andInView:(UIView *)view;

-(NSString *)convertToString:(id)convert;
    
@end

