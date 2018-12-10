//
//  OTPViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "OTPVeirfyViewController.h"
#import "Utilities.h"
#import "Defines.h"
#import "APICalls.h"
#import "MyBusinessAPI.h"
@interface OTPVeirfyViewController ()

@end

@implementation OTPVeirfyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.closeBtn addTarget:self action:@selector(handleCloseView) forControlEvents:UIControlEventTouchUpInside];
    [self.otpVerifyBtn addTarget:self action:@selector(handleVerifyOTP) forControlEvents:UIControlEventTouchUpInside];
    [self.resendOTPBtn addTarget:self action:@selector(handleResdendOTP) forControlEvents:UIControlEventTouchUpInside];
    self.optField.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)handleCloseView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)handleVerifyOTP{
    
    // check network connection
    if ([UTILITIES connected])
    {
        // call form validation method
        if ([UTILITIES handleRemoveWhiteSpacesAndNewLines:self.optField.text].length != 0)
        {
            [UTILITIES showHud:self.view withText:@"Loading.."];
            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
            
            parameters[@"otp"] = self.optField.text;
            parameters[@"id"] = [[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY];
            parameters[@"deviceID"] = [[NSUserDefaults standardUserDefaults] objectForKey:UUID];
            parameters[@"osType"] = OS_TYPE;
            
            [[MyBusinessAPI sharedTrxadeAPIClient] postCallWithoutAuth:OTP_VERIFY withParameters:parameters block:^(id responseObject, NSError *error) {
                
                [UTILITIES hideHUDInView:self.view];
                if (error) {
                    [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
                } else {
                    
                    if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                        
                        NSDictionary *result = [responseObject objectForKey:@"result"];
                        
                        [self dismissViewControllerAnimated:YES completion:nil];
                        [self.delegate otpSuccess:[NSString stringWithFormat:@"%@",[result objectForKey:@"activation"]]];
                        
                    } else {
                        [UTILITIES showTostAlert:[responseObject objectForKey:@"message"] andInView:self.view];
                    }
                    
                    
                }
                
            }];
        }else{
            [UTILITIES showTostAlert:@"Please Enter OTP" andInView:self.view];
        }
    }
    else
    {
        [UTILITIES showNetworkAlertonView:self];
    }
    
}
-(void)handleResdendOTP{
    [self dismissViewControllerAnimated:YES completion:nil];
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
