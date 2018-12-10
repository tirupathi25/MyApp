//
//  OTPViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol OTPDelegate <NSObject>
-(void)otpSuccess:(NSString *)activation;

@end
@interface OTPVeirfyViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UIButton *closeBtn;
    @property (weak, nonatomic) IBOutlet UITextField *optField;
    @property (weak, nonatomic) IBOutlet UIButton *resendOTPBtn;
    @property (weak, nonatomic) IBOutlet UIButton *otpVerifyBtn;
    @property id<OTPDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
