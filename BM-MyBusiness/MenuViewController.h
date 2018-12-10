//
//  MenuViewController.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MenuDelegate <NSObject>

@optional
-(void)handleMyBusiness;
-(void)handleAddBusiness;
-(void)handleAppointment;
-(void)handleServices;
-(void)handleShowEmployees;
-(void)handleShowBreaktimeSetup;
-(void)handleShowEmployeeTimeoff;
-(void)handleShowReports;
-(void)handleShowMessages;
-(void)handleShowUpdateBusiness;
-(void)handleShowSettings;
-(void)handleShowQRCode;
-(void)handleShowBilling;
-(void)handleShowProfile;
-(void)handleShowRaiseRequest;
-(void)handleShowRemoveBusiness;
-(void)handleShowCancelMembership;
-(void)handleLogout;

@end

@interface MenuViewController : UITableViewController
@property id<MenuDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
