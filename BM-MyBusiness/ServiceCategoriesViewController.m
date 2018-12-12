//
//  ServiceCategoriesViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "ServiceCategoriesViewController.h"
#import "SWRevealViewController.h"
#import "ServiceCategoryCell.h"
#import "ServicesCategoryModel.h"
#import "ServiceCategoryView.h"
#import "Defines.h"
#import "Utilities.h"
#import "MyBusinessAPI.h"
#import "APICalls.h"

@interface ServiceCategoriesViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ServiceCategoriesViewController
{
    NSString *errorMessage;
    NSMutableArray *serviceCategoriesList;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    serviceCategoriesList = [NSMutableArray new];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"ServiceCategoryHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"servicesheader"];
    
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = gray_color;
    
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
    
    //method to get service categories
    [self getServiceCategories];
}
// method action to side menu button
-(void)tapMenu:(UIButton *)sender
{
    [self.view endEditing:YES];
    [self.revealViewController revealToggle:sender];
}

-(void)getServiceCategories{
    // check network connection
    if ([UTILITIES connected]) {
        
        [UTILITIES showHud:self.view withText:@"Loading.."];
        // API call tpo get members
        [[MyBusinessAPI sharedTrxadeAPIClient] getCall:[NSString stringWithFormat:@"%@/%@",GET_BUSINESS_SERVICE_CATEGORIES,@"5bd1b73f44a22852c1e4c65f"] withParameters:nil block:^(id responseObject, NSError *error) {
            
            [UTILITIES hideHUDInView:self.view];
            if (error) {
                [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
            } else {
                
                if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                   
                    NSArray *result = [responseObject objectForKey:@"result"];
                    
                    if (result.count != 0) {
                        NSArray *serviceCategory = [[result objectAtIndex:0] objectForKey:@"serviceCategory"];
                        
                        if (serviceCategory.count != 0) {
                            
                            
                            for (NSDictionary *dict in serviceCategory) {
                                
                                ServicesCategoryModel *model = [ServicesCategoryModel new];
                                [model setColorId:[UTILITIES convertToString:[dict objectForKey:@"colour"]]];
                                [model setName:[UTILITIES convertToString:[dict objectForKey:@"name"]]];
                                [model setCategoryDescription:[UTILITIES convertToString:[dict objectForKey:@"description"]]];
                                [model setType:[UTILITIES convertToString:[dict objectForKey:@"type"]]];
                                [model setCategoryID:[UTILITIES convertToString:[dict objectForKey:@"id"]]];
                                NSArray *services = [dict objectForKey:@"service"];
                                [model setServices:services];
                                
                                [self->serviceCategoriesList addObject:model];
                                
                            }
                            
                        }
                        
                    }

                    [self.tableview reloadData];
                    
                } else {
                    
                    [UTILITIES showTostAlert:[responseObject objectForKey:@"message"] andInView:self.view];
                    self->errorMessage = [responseObject objectForKey:@"message"];
                    
                    [self.tableview reloadData];
                }
                
                
            }
            
        }];
        
    }
    else
    {
        self->errorMessage = CONNECTION_MESSAGE;
        [UTILITIES showNetworkAlertonView:self];
        [self.tableview reloadData];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    // UIView *headerView = [self.tableview dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    @autoreleasepool {
        
        ServiceCategoryView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"ServiceCategoryHeader" owner:self options:nil] objectAtIndex:0];
        ServicesCategoryModel *model = [serviceCategoriesList objectAtIndex:section];
        headerView.nameLabel.text = [model name];
        
        CGRect newFrame=headerView.frame;
        newFrame.size=CGSizeMake(self.view.frame.size.width, 50);
        headerView.frame=newFrame;
        UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        
         head.backgroundColor=gray_color;
        
        headerView.layer.borderColor = gray_color.CGColor;
        headerView.layer.borderWidth = 1;
        [head addSubview:headerView];
        return head;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return serviceCategoriesList.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [[serviceCategoriesList objectAtIndex:section] services];
    return array.count+1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if ([[serviceCategoriesList objectAtIndex:indexPath.section] services].count == indexPath.row) {
        
        ServiceCategoryCell *Addcell = [tableView dequeueReusableCellWithIdentifier:@"AddServiceCategoryCell"];
        if (!Addcell) {
            Addcell = [[ServiceCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddServiceCategoryCell"];
        }
        Addcell.addBgView.layer.cornerRadius = 8;
        return Addcell;
        
    } else {
        
        NSDictionary *serviceDict = [[[serviceCategoriesList objectAtIndex:indexPath.section] services] objectAtIndex:indexPath.row];
        ServiceCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCategoryCell"];
        if (!cell) {
            cell = [[ServiceCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceCategoryCell"];
        }
        cell.serviceNameLabel.text = [serviceDict objectForKey:@"name"];
        
        return cell;
    }
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[serviceCategoriesList objectAtIndex:indexPath.section] services].count == indexPath.row) {
        return 62;
    }else{
        return 50;
    }
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
