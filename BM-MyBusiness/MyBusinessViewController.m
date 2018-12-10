//
//  MyBusinessViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "MyBusinessViewController.h"
#import "SWRevealViewController/SWRevealViewController.h"
#import "MenuViewController.h"
#import "CustomNavigationViewController.h"
#import "LoginController.h"
#import "BusinessCollectionViewCell.h"
#import "Defines.h"
@interface MyBusinessViewController ()<MenuDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MyBusinessViewController
    {
        
        NSInteger selectedIndex;
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    selectedIndex = -1;
    
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
        return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BusinessCollectionViewCell" forIndexPath:indexPath];
    
    cell.title_Label.text = [NSString stringWithFormat:@"Hello %ld",(long)indexPath.row];
    cell.iconView.image = [UIImage imageNamed:@"addbusiness"];
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
        [self.collectionview reloadData];
    }
    // this method overrides the changes you have made to inc or dec the size of cell using storyboard.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(140, 140);
}

#pragma Menu Delegate methods
-(void)handleMyBusiness{
    
}
-(void)handleAddBusiness{
    
}
-(void)handleAppointment{
   
    
}
-(void)handleServices{
    
}
-(void)handleShowEmployees{
    
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
