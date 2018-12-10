//
//  ViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "LoginController.h"
#import "MyBusinessViewController.h"
#import "OTPVeirfyViewController.h"
#import "CustomerPlanViewController.h"
#import "CustomNavigationViewController.h"
#import "CreateBusinessViewController.h"
#import "MyBusinessAPI.h"
#import "LGAlertView.h"
#import "Utilities.h"
#import "Defines.h"
#import "APICalls.h"
#define CONTINUE @"Continue"
#define SIGN_IN @"Sign In"
@interface LoginController ()<OTPDelegate,UITextFieldDelegate>

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.userNameTextfiled.layer.cornerRadius = 5;
    self.userNameTextfiled.placeholder = @"Email/Phone Number";
    self.userNameTextfiled.tag = 1;
    self.userNameTextfiled.delegate = self;
    self.userNameTextfiled.backgroundColor = white_color;
    [self.loginBtn setTitleColor:white_color forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = blue_color;
    self.loginBtn.layer.cornerRadius = 5;
    self.view.backgroundColor = gray_color;
    
    self.userNameTextfiled.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTextfiled.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSignup)];
    tapgesture.numberOfTapsRequired = 1;
    self.signUpLabel.userInteractionEnabled = YES;
    [self.signUpLabel addGestureRecognizer:tapgesture];
    
    self.signupBgView.hidden = YES;
    
    if (_is_signup) {
        
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleBack)];
        self.signUpLabel.hidden = YES;
        [self.loginBtn setTitle:@"Continue" forState:UIControlStateNormal];
        self.signupBgView.layer.cornerRadius = 5;
        [self signupViewConfig];
        self.phoneField.delegate = self;
        self.phoneField.tag = 2;
        self.emailField.tag = 3;
        self.emailField.delegate = self;
        self.title = @"Sign Up";
        
    }else{
        
        self.title = @"Sign In";
        
        self.signUpLabel.hidden = NO;
        [self.loginBtn setTitle:@"Sign In" forState:UIControlStateNormal];
        
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.is_signup && textField.tag == 1) {
        self.signupBgView.hidden = YES;
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *str = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    switch (textField.tag) {
        case 1:
            {
                if ([UTILITIES validateZipCode:[UTILITIES handleRemoveSpecialCharcters:str]]) {
                    if ([UTILITIES handleRemoveWhiteSpacesAndNewLines:str].length != 0){
                        
                        return YES;
                    }
                } else {
                    if ([UTILITIES validateEmailWithString:str]) {
                        return YES;
                    }
                }
            }
            break;
        case 2:
            //signup phone field
            
            
            if ([UTILITIES validateZipCode:[UTILITIES handleRemoveSpecialCharcters:str]]) {
                if ([UTILITIES handleRemoveWhiteSpacesAndNewLines:str].length != 0){
                    
                    return YES;
                }
            }else{
                return NO;
            }
            break;
        case 3:
            //signup email field
            
            if ([UTILITIES validateEmailWithString:str]) {
                return YES;
            }
            
            
            break;
        default:
            break;
    }
    return YES;
}
-(void)signupViewConfig{
    
    self.emailField.text = @"";
    self.phoneField.text = @"";
    
    self.emailField.placeholder = @"Email";
    self.phoneField.placeholder = @"Phone NUmber";
    
    self.sendOTpBtn.layer.cornerRadius = 5;
    [self.sendOTpBtn setTitleColor:white_color forState:UIControlStateNormal];
    self.sendOTpBtn.backgroundColor = blue_color;
    
    [self.phonnumbercheckBtn addTarget:self action:@selector(handlePhoneNumberCheckBox:) forControlEvents:UIControlEventTouchUpInside];
    [self.emailCheckboxbtn addTarget:self action:@selector(handleEmailCheckBox:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.phonnumbercheckBtn setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.phonnumbercheckBtn setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.phonnumbercheckBtn.tintColor = blue_color;
    self.emailCheckboxbtn.tintColor = blue_color;
    
    self.dropDownImageview.image = [[UIImage imageNamed:@"dropDown"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.dropDownImageview.tintColor = dark_gray_color;
    
    [self.emailCheckboxbtn setImage:[[UIImage imageNamed:@"checkbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [self.emailCheckboxbtn setImage:[[UIImage imageNamed:@"uncheckbox"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    UITapGestureRecognizer *taponflag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelSelectCountyCode)];
    taponflag.numberOfTapsRequired = 1;
    self.countySectionView.userInteractionEnabled = YES;
    [self.countySectionView addGestureRecognizer:taponflag];
    
    self.flagImageview.userInteractionEnabled = NO;
    self.countryCodeLabel.userInteractionEnabled = NO;
//
}

-(void)handelSelectCountyCode{
    
    
}
-(void)handlePhoneNumberCheckBox:(UIButton *)sender{
    if (sender.selected) {
        [sender setSelected:NO];
    } else {
        [sender setSelected:YES];
    }
}
-(void)handleEmailCheckBox:(UIButton *)sender{
    if (sender.selected) {
        [sender setSelected:NO];
    } else {
        [sender setSelected:YES];
    }
}
-(void)handleBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)login:(UIButton *)sender{

        CreateBusinessViewController *otpview = [STORYBOARD instantiateViewControllerWithIdentifier:@"CreateBusinessViewController"];
    [self.navigationController pushViewController:otpview animated:YES];
    return;
    
    if ([sender.titleLabel.text isEqualToString:SIGN_IN]) {
        
        // check network connection
        if ([UTILITIES connected])
        {
            // call form validation method
            if ([self formValidation])
            {
                [UTILITIES showHud:self.view withText:@"Loading.."];
                NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                
                parameters[@"logInId"] = self.userNameTextfiled.text;
                
                parameters[@"type"] = TYPE;
                parameters[@"usingPhone"] = [NSNumber numberWithBool:NO];
                
               
                [[MyBusinessAPI sharedTrxadeAPIClient] postCallWithoutAuth:USER_LOGIN withParameters:parameters block:^(id responseObject, NSError *error) {
                    
                    [UTILITIES hideHUDInView:self.view];
                    if (error) {
                        [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
                    } else {
                        
                        if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE || [[responseObject objectForKey:@"code"] integerValue] == 209 || [[responseObject objectForKey:@"code"] integerValue] == 204) {
                            
                            NSDictionary *result = [responseObject objectForKey:@"result"];
                            
                            
                            // moves to mapview controller when user login is successfully done
                            [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:AUTH_KEY] forKey:AUTH_KEY];
                            
                            
                            OTPVeirfyViewController *otpview = [STORYBOARD instantiateViewControllerWithIdentifier:@"OTPVeirfyViewController"];
                            otpview.delegate = self;
                            otpview.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
                            [otpview setModalPresentationStyle:UIModalPresentationOverCurrentContext];
                            
                            [otpview setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
                            [self presentViewController:otpview animated:YES completion:nil];
                            
                            
                            
                        } else {
                            
                           [UTILITIES showTostAlert:[responseObject objectForKey:@"message"] andInView:self.view];
                        }
                        
                        
                        
                    }
                    
                }];
            }else{
                
                [UTILITIES showTostAlert:@"Enter correct Email/Phone number" andInView:self.view];
            }
        }
        else
        {
            [UTILITIES showNetworkAlertonView:self];
        }
    } else {
        
        if ([self formValidation]) {
            
            self.signupBgView.hidden = NO;
            
            if ([UTILITIES validateZipCode:[UTILITIES handleRemoveSpecialCharcters:self.userNameTextfiled.text]]) {
                if ([UTILITIES handleRemoveWhiteSpacesAndNewLines:self.userNameTextfiled.text].length != 0){
                    self.phoneField.text = self.userNameTextfiled.text;
                    self.phonnumbercheckBtn.selected = YES;
                    
                }else{
                    self.phonnumbercheckBtn.selected = NO;
                }
                
            } else {
                if ([UTILITIES validateEmailWithString:self.userNameTextfiled.text]) {
                    self.emailField.text = self.userNameTextfiled.text;
                    self.emailCheckboxbtn.selected = YES;
                }else{
                    self.emailCheckboxbtn.selected = NO;
                }
                
                
            }
        }else {
            [UTILITIES showTostAlert:@"Enter correct Email/Phone number" andInView:self.view];
            self.signupBgView.hidden = YES;
        }
}
}
    
-(void)otpSuccess:(NSString *)activation{

    if ([activation isEqualToString:@"2"]) {

        //show dashboard
        MyBusinessViewController *ihvc = [STORYBOARD instantiateViewControllerWithIdentifier:@"dashboard"];

        [[[UIApplication sharedApplication] delegate] window].rootViewController = ihvc;

        [self dismissViewControllerAnimated:YES completion:nil];

    } else if ([activation isEqualToString:@"1"]){
        //show subscription planc
        CustomerPlanViewController *custPlanView = [STORYBOARD instantiateViewControllerWithIdentifier:@"CustomerPlanViewController"];
        CustomNavigationViewController *navi = [[CustomNavigationViewController alloc] initWithRootViewController:custPlanView];
        [self presentViewController:navi animated:YES completion:nil];
    }

}
-(void)handleSignup{
    //show dashboard
    LoginController *loginview = [STORYBOARD instantiateViewControllerWithIdentifier:@"LoginController"];
    loginview.is_signup = YES;
    [self.navigationController pushViewController:loginview animated:YES];
}
-(BOOL)formValidation{
    if ([UTILITIES validateZipCode:[UTILITIES handleRemoveSpecialCharcters:self.userNameTextfiled.text]]) {
        if ([UTILITIES handleRemoveWhiteSpacesAndNewLines:self.userNameTextfiled.text].length != 0){
            
            return YES;
        }else{
            return NO;
        }
        
    } else {
        if ([UTILITIES validateEmailWithString:self.userNameTextfiled.text]) {
            return YES;
        }else{
            return NO;
        }
    }
}
@end
