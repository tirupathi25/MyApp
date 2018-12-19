//
//  Utilities.m
//  TRxADE
//
//  Created by Lavanya on 07/06/18.
//  Copyright © 2018 Amzur Technologies. All rights reserved.
//

#import "Utilities.h"
#import "Defines.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "NBPhoneNumberUtil.h"
#import "NBPhoneNumber.h"
#import "MyBusinessAPI.h"
@implementation Utilities
{
    LGAlertView *otpAlertView;
}
// utilites single ton class
+(Utilities *)sharedInstace
{
    static Utilities *_shareinstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _shareinstance = [[self alloc] init];
    });
    
    return _shareinstance;
}


//Network reachablity checking
-(BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

//Show alertview for newtwork error
-(void)showNetworkAlertonView:(UIViewController *)viewController
{
    
  
  LGAlertView *alert = [[LGAlertView alloc] initWithTitle:@"" message:@"" style:LGAlertViewStyleAlert buttonTitles:@[@"Settings"] cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil actionHandler:^(LGAlertView * _Nonnull alertView, NSUInteger index, NSString * _Nullable title) {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    
  } cancelHandler:nil destructiveHandler:nil];
  alert.buttonsHeight = 40;
  [alert setTitleTextColor:orange_color];
  [alert setCancelButtonTitleColor:[UIColor whiteColor]];
  [alert setCancelButtonBackgroundColor:orange_color];
  [alert setButtonsTitleColor:[UIColor whiteColor]];
  [alert setButtonsBackgroundColor:blue_color];
  [alert showAnimated:YES completionHandler:nil];
  
}

//Method to show loader
-(void)showHud:(UIView *)view withText:(NSString *)text
{
    
    self.progressHUD=[MBProgressHUD showHUDAddedTo:view animated:YES];
    self.progressHUD.mode=MBProgressHUDModeIndeterminate;
    self.progressHUD.label.text=text;
    self.progressHUD.bezelView.backgroundColor=gray_color;
    self.progressHUD.contentColor=blue_color;
    
}

//method to hide loader
-(void)hideHUDInView:(UIView *)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.progressHUD removeFromSuperview];
        [MBProgressHUD hideHUDForView:view animated:YES];
        
    });
    
}

//App common Date formate
-(NSString *)commonDateFotmate:(NSDate *)date{
  NSDateFormatter *formater = [NSDateFormatter new];
  [formater setTimeZone:[NSTimeZone localTimeZone]];
  [formater setDateFormat:@"MM/dd/yyyy"];
  return [formater stringFromDate:date];
}

// method for zipcode validation
-(BOOL)validateZipCode:(NSString *)str
{
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:str];
    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    return stringIsValid;
}

// method for accepting alphabetnumarics
-(BOOL)validationForName:(NSString *)str
{
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 "];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:str];
    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    return stringIsValid;
}




//method to remove spaces and new line
-(NSString *)handleRemoveWhiteSpacesAndNewLines:(NSString *)str
{
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [str stringByTrimmingCharactersInSet:charSet];
    return trimmedString;
    
}

//validation for email string

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = EMAIL_REGEX;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//validation for phone number //
-(BOOL)validatePhonewithstring:(NSString *)phone_num
{
  NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
  NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:phone_num];
  BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
  return stringIsValid;

}
// validate phone number in US format

-(BOOL)validatePhoneNumberinUSFormat:(NSString *)phone and:(UITextField *)textField
{
  if (phone.length)
  {
    
    if (textField.text.length == 0)
    {
      textField.text = [NSString stringWithFormat:@"%@(", textField.text];
      [textField becomeFirstResponder];
    }
    
    if (textField.text.length == 4)
    {
      textField.text = [NSString stringWithFormat:@"%@)", textField.text];
      [textField becomeFirstResponder];
    }
    
    if (textField.text.length == 5) {
      textField.text = [NSString stringWithFormat:@"%@ ", textField.text];
      [textField becomeFirstResponder];
    }
    
    if (textField.text.length == 9) {
      textField.text = [NSString stringWithFormat:@"%@ ", textField.text];
      [textField becomeFirstResponder];
    }
    
    if (textField.text.length == 14)
    {
      return  NO;
    }
  }
  
  return YES;
}
//Phone num validation with region
-(BOOL)isValidPhoneNumber:(NSString *)phoneNumber withRegion:(NSString *)region
{
        
  NBPhoneNumberUtil *phoneUtil = [[NBPhoneNumberUtil alloc] init];
  NSError *anError = nil;
  NBPhoneNumber *myNumber = [phoneUtil parse:phoneNumber
                                     defaultRegion:region error:&anError];
        
    return [phoneUtil isValidNumber:myNumber];
  
}
// validation for remove special charcters from string

-(NSString *)handleRemoveSpecialCharcters:(NSString *)str
{
  NSMutableCharacterSet *characterSet =
  [NSMutableCharacterSet characterSetWithCharactersInString:@"() "];
  // Build array of components using specified characters as separtors
  NSArray *arrayOfComponents = [str componentsSeparatedByCharactersInSet:characterSet];
  // Create string from the array components
  NSString *strOutput = [arrayOfComponents componentsJoinedByString:@""];
 
  return strOutput;
}

// set phone number format
-(NSString *)setPhoneNumberFormat:(NSString *)str
{
  NSString *formatString = [NSString stringWithFormat:@"(%c%c%c) %c%c%c %c%c%c%c",[str characterAtIndex:0],[str characterAtIndex:1],[str characterAtIndex:2],[str characterAtIndex:3],[str characterAtIndex:4],[str characterAtIndex:5],[str characterAtIndex:6],[str characterAtIndex:7],[str characterAtIndex:8],[str characterAtIndex:9]];
  return formatString;
}

-(NSString *)phoneAndCountryCodeFormate:(NSString *)phoneNumber{
    NSString *phone = [self setPhoneNumberFormat:[phoneNumber substringFromIndex:[phoneNumber length] - 10]];
    NSString *countyCode = [phoneNumber substringToIndex:[phoneNumber length]-10];
    
    return [NSString stringWithFormat:@"%@ %@",countyCode,phone];
}
  
  // validation for password
-(BOOL)validatePassword:(NSString *)password
{
    NSPredicate *passwordPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",REGEX_PASSWORD_LIMIT];
    
    return [passwordPre evaluateWithObject:password];
}

// validation only numberic values

-(BOOL)validateAcceptOnlyNumbericValues:(NSString *)age
{
  NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
  NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:age];
  BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
  return stringIsValid;
}

// validaation only accept charcters
-(BOOL)validateAcceptOnlyCharacters:(NSString *)str
{
  NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:str];
  BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
  return stringIsValid;
}

// add red border for fields
-(void)addRedBottomborder:(UITextField *)textfield
{
    
    CALayer *layer = [[textfield.layer sublayers] objectAtIndex:0];
    
    layer.borderColor = [UIColor redColor].CGColor;
    
}

// dont accept the emojees
-(BOOL)dontAcceptEmojees:(NSString *)str
{
    NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!~`@#$%^&*-+();:={}[],.<>?\\/\"\' "];
    NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:str];
    BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
    return stringIsValid;
}

// add border to layer
-(void)addBottomborder:(UITextField *)textfield withY:(float)y andwidth:(float)width
{
    CALayer *layer = [CALayer layer];
    layer.borderWidth = 0.5f;
    layer.borderColor = dark_gray_color.CGColor;
    layer.frame = CGRectMake(0, y, width, 0.5f);
    [textfield.layer insertSublayer:layer atIndex:0];
    
}
// add border color to layer
-(void)changebottonbordercolor:(UITextField *)textfield and:(UIColor*)color
{
    CALayer *layer = [[textfield.layer sublayers] objectAtIndex:0];
    
    layer.borderColor = color.CGColor;
}

// convert time from 24 hours to 12 hours

-(NSString *)convertDateFrom24To12HoursFormat:(NSDate *)date
{
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateFormat = @"hh:mm a";
  NSString *convertDate = [dateFormatter stringFromDate:date];
  return convertDate;
}

//Delete images for local
-(void)delete_temporaryimages
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:path error:nil];
    
    for (NSString *existed_file_name in fileArray) {
        
        if([existed_file_name.pathExtension isEqualToString:@"png"] || [existed_file_name.pathExtension isEqualToString:@"jpg"] || [existed_file_name.pathExtension isEqualToString:@"jpeg"])
        {
            [fileMgr removeItemAtPath:[path stringByAppendingPathComponent:existed_file_name] error:nil];
        }
        
    }
}
// remove user defaults
-(void)removeDefaults
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AUTH_KEY];
   
    
}

// method to convert date format from timestamp to date
-(NSString *)convertTimestampToDate:(NSString *)timeitervel{
    
//    NSTimeInterval timeInterval=[timeitervel doubleValue]/1000;
    
    NSDateFormatter *dateformatter1=[[NSDateFormatter alloc]init];
    [dateformatter1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *date = [dateformatter1 dateFromString:timeitervel];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateformatter setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString=[dateformatter stringFromDate:date];
    
    return dateString;
}

// method to convert date format from timestamp to date
-(NSString *)convertDateToDate:(NSString *)dateStr{
    
    //    NSTimeInterval timeInterval=[timeitervel doubleValue]/1000;
    
    NSDateFormatter *dateformatter1=[[NSDateFormatter alloc]init];
    [dateformatter1 setDateFormat:@"yyyy MMM dd"];
    NSDate *date = [dateformatter1 dateFromString:dateStr];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateformatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *dateString=[dateformatter stringFromDate:date];
    
    return dateString;
}

-(NSString *)convertToDate:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
     NSDate *date = [dateFormatter dateFromString:dateString];
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"MM/dd/yyyy"];
    NSString *finalStr=[dateformatter stringFromDate:date];
    
    return finalStr;
}

-(void)ShowAlert:(NSString *)title and:(NSString *)message
{
    
   

   
        LGAlertView *alert=[[LGAlertView alloc] initWithTitle:title message:message style:LGAlertViewStyleAlert buttonTitles:nil cancelButtonTitle:@"Ok" destructiveButtonTitle:nil];
        [alert setTitleTextColor:orange_color];
        [alert setCancelButtonTitleColor:[UIColor whiteColor]];
        [alert setCancelButtonBackgroundColor:blue_color];
        [alert setTintColor:blue_color];
        [alert showAnimated:YES completionHandler:nil];
    
  
}
-(void)showTostAlert:(NSString *)message andInView:(UIView *)view{
    
    // create a new style
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    // this is just one of many style options
    style.messageColor = [UIColor whiteColor];
    // present the toast with the new style
    [view makeToast:message
                duration:2.0
                position:CSToastPositionBottom
                   style:style];
    // toggle "tap to dismiss" functionality
    [CSToastManager setTapToDismissEnabled:YES];
}

//method for phone call
-(void)methodTOGetCall:(NSString *)phNumber{
    
//    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
//    CTCarrier *ct=[info subscriberCellularProvider];
//
//
//    if (phNumber.length !=0 && [ct carrierName] && [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]]) {
//
//        NSString *phoneNumber = [[@"tel://" stringByAppendingString:phNumber] stringByReplacingOccurrencesOfString:@" " withString:@""];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber] options:@{} completionHandler:^(BOOL success) {
//            if (!success) {
//                [UTILITIES ShowAlert:nil and:@"Can't call"];
//
//            }
//        }];
//
//
//    }else{
//
//        [UTILITIES ShowAlert:nil and:@"Can't call"];
//
//    }
}

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

- (UIColor *) colorWithHexString: (NSString *) hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    
    NSLog(@"colorString :%@",colorString);
    CGFloat alpha, red, blue, green;
    
    // #RGB
    alpha = 1.0f;
    red   = [self colorComponentFrom: colorString start: 0 length: 2];
    green = [self colorComponentFrom: colorString start: 2 length: 2];
    blue  = [self colorComponentFrom: colorString start: 4 length: 2];
    
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

- (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}
-(NSNumber *)convertTiemToMinutes:(NSDate *)selecteddate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:selecteddate];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    NSInteger finalMinutes = hour*60 + minute;
    
    return [NSNumber numberWithInteger:finalMinutes];
    
}
//converr to string
-(NSString *)convertToString:(id)convert
{
    return [NSString stringWithFormat:@"%@",convert];
}
@end
