//
//  MyBusinessViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "MyBusinessViewController.h"
#import "EmployeesViewController.h"
#import "SWRevealViewController/SWRevealViewController.h"
#import "MenuViewController.h"
#import "CustomNavigationViewController.h"
#import "LoginController.h"
#import "BusinessCollectionViewCell.h"
#import "CreateBusinessViewController.h"
#import "BusinessTemplatesViewController.h"
#import "ServiceCategoriesViewController.h"
#import "Defines.h"
#import "SharedData.h"
#import "Utilities.h"
#import "MyBusinessAPI.h"
#import "APICalls.h"
#import "BusinessesModel.h"
@interface MyBusinessViewController ()<MenuDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MyBusinessViewController
    {
        
        NSInteger selectedIndex;
        NSString *errorMessage;
        NSMutableArray *publisherBusinessList;
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    selectedIndex = 0;
    publisherBusinessList = [NSMutableArray new];
    
        // create custom menu button with image
        UIButton *menu_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        menu_btn.frame = CGRectMake(0, 0,50, 50);
        [menu_btn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [menu_btn addTarget:self action:@selector(tapMenu:) forControlEvents:UIControlEventTouchUpInside];
        menu_btn.imageEdgeInsets = UIEdgeInsetsMake(0, menuBtnXval, 0, 0);
        NSLayoutConstraint *widthconstraint = [menu_btn.widthAnchor constraintEqualToConstant:45];
        NSLayoutConstraint *heightconstraint = [menu_btn.heightAnchor constraintEqualToConstant:45];
        [widthconstraint setActive:YES];
        [heightconstraint setActive:YES];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menu_btn];
        
        CustomNavigationViewController *navi = (CustomNavigationViewController *)self.revealViewController.rearViewController;
        MenuViewController *ivmc = (MenuViewController *)navi.topViewController;
        ivmc.delegate = self;
        self.revealViewController.panGestureRecognizer.enabled = YES;
        
    
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    
    
    [self getPublisherBusinesses];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
-(void)getPublisherBusinesses{
    // check network connection
    if ([UTILITIES connected]) {
        
        [UTILITIES showHud:self.view withText:@"Loading.."];
        // API call tpo get members
        [[MyBusinessAPI sharedTrxadeAPIClient] getCall:[NSString stringWithFormat:@"%@/%@",GET_PUBLISHER_BUSINESSES,[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY]] withParameters:nil block:^(id responseObject, NSError *error) {
            
            [UTILITIES hideHUDInView:self.view];
            if (error) {
                [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
            } else {
                
                if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                    
                    NSArray *result = [responseObject objectForKey:@"result"];
                    
                    if (result.count != 0) {
                        NSDictionary *temmpDict = [result objectAtIndex:0];
                        [[NSUserDefaults standardUserDefaults] setObject:[UTILITIES convertToString:[temmpDict objectForKey:@"id"]] forKey:SELECTED_BUSINESS_ID];
                        [self->publisherBusinessList removeAllObjects];
                        for (NSDictionary *dict in result) {
                            
                            BusinessesModel *model = [BusinessesModel new];
                            [model setBusinessID:[UTILITIES convertToString:[dict objectForKey:@"id"]]];
                            [model setName:[UTILITIES convertToString:[dict objectForKey:@"name"]]];
                            [model setBusinessDescription:[UTILITIES convertToString:[dict objectForKey:@"description"]]];
                            [model setIcon:[UTILITIES convertToString:[dict objectForKey:@"icon"]]];
                            [model setStatus:[UTILITIES convertToString:[dict objectForKey:@"status"]]];
                            NSArray *ary = [dict objectForKey:@"serviceCategory"];
                            [model setServiceCategory:ary];
                            [self->publisherBusinessList addObject:model];
                        }
                        
                    }
                    
                    [self.collectionview reloadData];
                    
                } else {
                    
                    [UTILITIES showTostAlert:[responseObject objectForKey:@"message"] andInView:self.view];
                    self->errorMessage = [responseObject objectForKey:@"message"];
                    
                    [self.collectionview reloadData];
                }
                
                
            }
            
        }];
        
    }
    else
    {
        self->errorMessage = CONNECTION_MESSAGE;
        [UTILITIES showNetworkAlertonView:self];
        [self.collectionview reloadData];
    }
}

// method action to side menu button
-(void)tapMenu:(UIButton *)sender
{
    [self.view endEditing:YES];
    [self.revealViewController revealToggle:sender];
}
    
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (publisherBusinessList.count != 0) {
        
        self.collectionview.backgroundView = nil;
        return publisherBusinessList.count;
        
    } else {
        
        UILabel *noDataFound_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.collectionview.frame.size.width, self.collectionview.frame.size.height)];
        [noDataFound_label setFont:[UIFont fontWithName:Halvetica size:15]];
        [noDataFound_label setTextColor:[UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0]];
        noDataFound_label.numberOfLines=0;
        noDataFound_label.textAlignment=NSTextAlignmentCenter;
        [noDataFound_label sizeToFit];
        noDataFound_label.text=errorMessage;
        self.collectionview.backgroundView = noDataFound_label;
        return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BusinessCollectionViewCell" forIndexPath:indexPath];
    
    BusinessesModel *modelObj = [publisherBusinessList objectAtIndex:indexPath.row];
    
    
    
    cell.title_Label.text = modelObj.name;
    cell.iconView.image = [UIImage imageNamed:@"businessicon"];
    if (selectedIndex == indexPath.row) {
        
        cell.bgView.backgroundColor = gray_color;
        cell.bgView.layer.cornerRadius = 5;
        
    }else{
        
        cell.bgView.backgroundColor = white_color;
        cell.bgView.layer.cornerRadius = 0;
    }
    //
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        selectedIndex = indexPath.row;
    BusinessesModel *modelObj = [publisherBusinessList objectAtIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:modelObj.businessID forKey:SELECTED_BUSINESS_ID];
        [self.collectionview reloadData];
        
//        CreateBusinessViewController *otpview = [STORYBOARD instantiateViewControllerWithIdentifier:@"CreateBusinessViewController"];
//        [self.navigationController pushViewController:otpview animated:YES];
        
    }
    // this method overrides the changes you have made to inc or dec the size of cell using storyboard.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(140, 140);
}

#pragma Menu Delegate methods
-(void)handleMyBusiness{
    [self getPublisherBusinesses];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)handleAddBusiness{
    BusinessTemplatesViewController *templatesView = [STORYBOARD instantiateViewControllerWithIdentifier:@"BusinessTemplatesViewController"];
    [self.navigationController pushViewController:templatesView animated:YES];
}
-(void)handleAppointment{
   
    
}
-(void)handleServices{
    ServiceCategoriesViewController *serviceView = [STORYBOARD instantiateViewControllerWithIdentifier:@"ServiceCategoriesViewController"];
    [self.navigationController pushViewController:serviceView animated:YES];
}
-(void)handleShowEmployees{
    EmployeesViewController *employeesView = [STORYBOARD instantiateViewControllerWithIdentifier:@"EmployeesViewController"];
    [self.navigationController pushViewController:employeesView animated:YES];
}
-(void)handleShowBreaktimeSetup{
    
}
-(void)handleShowEmployeeTimeoff{
   
   
}
-(void)handleShowReports
{
        
}
-(void)handleShowMessages{
    
}
-(void)handleShowUpdateBusiness{
    
}
-(void)handleShowSettings{
    
}
-(void)handleShowQRCode
{
        
}
-(void)handleShowBilling{
    
}
-(void)handleShowProfile{
    
}
-(void)handleShowRaiseRequest{
    
}
-(void)handleShowRemoveBusiness{
    
}
-(void)handleShowCancelMembership{
    
}
-(void)handleLogout{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AUTH_KEY];
    //    [UTILITIES removeDefaults];
    LoginController *ihvc = [STORYBOARD instantiateViewControllerWithIdentifier:@"LoginController"];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = ihvc;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
