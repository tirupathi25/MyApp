//
//  BusinessTemplatesViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "BusinessTemplatesViewController.h"
#import "CustomNavigationViewController.h"
#import "BusinessCollectionViewCell.h"
#import "SWRevealViewController.h"
#import "CreateBusinessViewController.h"
#import "MyBusinessAPI.h"
#import "BusinessesModel.h"
#import "APICalls.h"
#import "Defines.h"
#import "Utilities.h"
@interface BusinessTemplatesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation BusinessTemplatesViewController
{
    
    NSInteger selectedIndex;
    NSString *errorMessage,*selectedBusinessID;
    NSMutableArray *businessTemplatesList;
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
    self.revealViewController.panGestureRecognizer.enabled = YES;
    
    
    
    businessTemplatesList = [NSMutableArray new];
    
    self.collectuionView.delegate = self;
    self.collectuionView.dataSource = self;
    
    self.addBusinessButton.layer.cornerRadius = 25;
    self.addBusinessButton.backgroundColor = blue_color;
    self.addBusinessButton.titleLabel.font = fontWithName(Halvetica_medium, 18);
    [self.addBusinessButton setTitleColor:white_color forState:UIControlStateNormal];
    [self.addBusinessButton addTarget:self action:@selector(handleAddNewBusiness) forControlEvents:UIControlEventTouchUpInside];
    
    self.addBusinessButton.hidden = YES;
    
    [self getBusinessTemplatesList];
}



-(void)getBusinessTemplatesList{
    // check network connection
    if ([UTILITIES connected]) {
        
        [UTILITIES showHud:self.view withText:@"Loading.."];
        // API call tpo get members
        [[MyBusinessAPI sharedTrxadeAPIClient] getCall:GET_BUSINESS_TEMPLETS withParameters:nil block:^(id responseObject, NSError *error) {
            
            [UTILITIES hideHUDInView:self.view];
            if (error) {
                [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
            } else {
                
                if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                    
                    NSArray *result = [responseObject objectForKey:@"result"];
                    
                    if (result.count != 0) {
                        
                        for (NSDictionary *dict in result) {
                            
                            BusinessesModel *model = [BusinessesModel new];
                            [model setBusinessID:[UTILITIES convertToString:[dict objectForKey:@"id"]]];
                            [model setName:[UTILITIES convertToString:[dict objectForKey:@"name"]]];
                            [model setBusinessDescription:[UTILITIES convertToString:[dict objectForKey:@"description"]]];
                            [model setIcon:[UTILITIES convertToString:[dict objectForKey:@"icon"]]];
                            [model setStatus:[UTILITIES convertToString:[dict objectForKey:@"status"]]];
                            NSArray *ary = [dict objectForKey:@"serviceCategory"];
                            [model setServiceCategory:ary];
                            [self->businessTemplatesList addObject:model];
                        }
                        
                    }
                    
                    [self.collectuionView reloadData];
                    
                } else {
                    
                    [UTILITIES showTostAlert:[responseObject objectForKey:@"message"] andInView:self.view];
                    self->errorMessage = [responseObject objectForKey:@"message"];
                    
                    [self.collectuionView reloadData];
                }
                
                
            }
            
        }];
        
    }
    else
    {
        self->errorMessage = CONNECTION_MESSAGE;
        [UTILITIES showNetworkAlertonView:self];
        [self.collectuionView reloadData];
    }
}

-(void)handleAddNewBusiness{
    
    CreateBusinessViewController *createBview = [STORYBOARD instantiateViewControllerWithIdentifier:@"CreateBusinessViewController"];
    createBview.selectedBusinessId = selectedBusinessID;
    [self.navigationController pushViewController:createBview animated:YES];
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
    
    if (businessTemplatesList.count != 0) {
        
        self.collectuionView.backgroundView = nil;
        return businessTemplatesList.count;
        
    } else {
        
        UILabel *noDataFound_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.collectuionView.frame.size.width, self.collectuionView.frame.size.height)];
        [noDataFound_label setFont:[UIFont fontWithName:Halvetica size:15]];
        [noDataFound_label setTextColor:[UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0]];
        noDataFound_label.numberOfLines=0;
        noDataFound_label.textAlignment=NSTextAlignmentCenter;
        [noDataFound_label sizeToFit];
        noDataFound_label.text=errorMessage;
        self.collectuionView.backgroundView = noDataFound_label;
        return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BusinessTemplatesViewCell" forIndexPath:indexPath];
    
    BusinessesModel *modelObj = [businessTemplatesList objectAtIndex:indexPath.row];
    
    
    
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
    
    BusinessesModel *modelObj = [businessTemplatesList objectAtIndex:indexPath.row];
    selectedBusinessID = [modelObj businessID];
    selectedIndex = indexPath.row;
    [self.collectuionView reloadData];
    self.addBusinessButton.hidden = NO;
    
}
// this method overrides the changes you have made to inc or dec the size of cell using storyboard.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(140, 140);
}



@end
