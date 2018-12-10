//
//  ViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextfiled;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property BOOL is_signup;

//sigin up view properties
@property (weak, nonatomic) IBOutlet UIView *signupBgView;
@property (weak, nonatomic) IBOutlet UIButton *phonnumbercheckBtn;
@property (weak, nonatomic) IBOutlet UILabel *phonenumberTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageview;
@property (weak, nonatomic) IBOutlet UILabel *countryCodeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dropDownImageview;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *emailCheckboxbtn;
@property (weak, nonatomic) IBOutlet UILabel *emailTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendOTpBtn;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIView *countySectionView;

@end

