//
//  Defines.h
//  TRxADE
//
//  Created by Tirupathi Mandali on 23/05/18.
//  Copyright © 2018 Amzur Technologies. All rights reserved.
//

#ifndef Defines_h
#define Defines_h

typedef enum : NSUInteger {
    my_business,
    add_business,
    appointment,
    services,
    employees,
    breaktime_setup,
    employee_timeoff,
    reports,
    messages,
    update_business,
    settings,
    qr_code,
    billing,
    profile,
    raise_request,
    remove_business ,
    cancel_membership,
    logout,
}MenuItems;

#define DEV_URL @"http://ec2-52-15-130-228.us-east-2.compute.amazonaws.com/"//Test QA

#define  TYPE @"2"
#define  OS_TYPE @"Ios"
#define SUCCESS_CODE 200



//menu list
#define MY_BUSINESS @"My Business"
#define ADD_BUSINESS @"Add Business"
#define APPOINITMENT @"Appointments"
#define SERVICES @"Services"
#define EMPLOYEES @"Employees"
#define BREAKTIME_SETUP @"BreakTime Setup"
#define EMPLOYEE_TIMEOFF @"Employee Timeoff"
#define REPORTS @"Reports"
#define MESSAGES @"Messages"
#define UPDATE_BUSINESS @"Update Business"
#define SETTINGS @"Settings"
#define QR_CODE @"QR Code"
#define BILLING @"Billing"
#define PROFILE @"Profile"
#define RAISE_REQUEST @"Raise Request"
#define REMOVE_BUSINESS @"Remove Businesses"
#define CANCEL_MEMBERSHIP @"Cancel Membership"
#define LOGOUT @"Logout"


#define menuBtnXval -30


//Color codes
#define blue_color [UIColor  colorWithRed:66.0/255.0 green:139.0/255.0 blue:202.0/255.0 alpha:1.0]
//#define green_color [UIColor  colorWithRed:121.0/255.0 green:197.0/255.0 blue:101.0/255.0 alpha:1.0]
#define orange_color [UIColor  colorWithRed:234.0/255.0 green:102.0/255.0 blue:36.0/255.0 alpha:1.0]
#define gray_color [UIColor  colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]

#define confirmOrderColor [UIColor  colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:0.5]
#define Image_Border_Color [UIColor colorWithHue:192/360.0f saturation:2/100.0f brightness:95/100.0f alpha:1.0]

#define dark_gray_color [UIColor grayColor]
#define white_color [UIColor whiteColor]
#define black_color [UIColor blackColor]

#define SUCCESS @"success"
#define MESSAGE @"errors"
#define NOT_PROVIDED @"Not Provided"

#define CUSTOMER_SELECTED_ADDRESS @"customerAddress"
#define PREFERRED_ADDRESS @"preferredAddress"
#define CUSTOMER_SELECTED_DELIVER_ADDRESS @"customerDeliverAddress"

#define UUID @"uuid"
#define DEVICE_TOKEN @"device_token"
#define AUTH_KEY @"id"
#define USER_ID @"user_id"
#define USER_NAME @"username"
#define SELECTED_BUSINESS_ID @"selectedbusinessid"


#define Halvetica @"Helvetica Neue"
#define Halvetica_medium @"HelveticaNeue-Medium"
#define Halvetica_bold @"HelveticaNeue-Bold"
#define Halvetica_Light @"HelveticaNeue-Light"

#define fontWithName(n,s) [UIFont fontWithName:n size:s]


#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define IS_IPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone


#define STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

#define DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//Instance for Utilities class
#define UTILITIES [Utilities sharedInstace]
#define SHAREDDATA [SharedData sharedInstace]


#define REGEX_PHONE @"^[0-9]*$"
#define REGEX_PHONE_LIMIT @"^.{10}$"
#define REGEX_ZIPCODE @"^[0-9]*$"
#define REGEX_ZIPCODE_LIMIT @"^.{2,5}$"
#define REGEX_PASSWORD_LIMIT @"^.{8,}$"

//email Regular expressions
#define EMAIL_REGEX @"^[_A-Za-z0-9-\\+]{1,}+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,4})$"


#define CONNECTION_MESSAGE @"Please check internet connection."

#endif /* Defines_h */
