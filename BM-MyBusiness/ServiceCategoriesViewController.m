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
#import "ServicesModel.h"
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
    NSInteger selectedIndex;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    serviceCategoriesList = [NSMutableArray new];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
    selectedIndex = -1;
    
    
    
    [self.tableview registerNib:[UINib nibWithNibName:@"ServiceCategoryHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"servicesheader"];
    
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = gray_color;
    
    if (!self.from_business_creation) {
        
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
    }
    
    
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
        [[MyBusinessAPI sharedTrxadeAPIClient] getCall:[NSString stringWithFormat:@"%@/%@",GET_BUSINESS_SERVICE_CATEGORIES,self.businessId] withParameters:nil block:^(id responseObject, NSError *error) {
            
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
                                if (services.count != 0) {
                                    ServicesModel *service = [ServicesModel new];
                                    
                                }
                                
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
        headerView.colorButton.backgroundColor = [model.colorId containsString:@"#"] ? [UTILITIES colorWithHexString:model.colorId] : [UIColor whiteColor];
        headerView.colorButton.tag = section;
        [headerView.colorButton addTarget:self action:@selector(handleSelectColor:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect newFrame=headerView.frame;
        newFrame.size=CGSizeMake(self.view.frame.size.width, 50);
        headerView.frame=newFrame;
        UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        
         head.backgroundColor=gray_color;
        
        headerView.layer.borderColor = gray_color.CGColor;
        headerView.layer.borderWidth = 1;
        headerView.tag = section;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleExpandList:)];
        tapGesture.numberOfTapsRequired = 1;
        headerView.userInteractionEnabled = YES;
        [headerView addGestureRecognizer:tapGesture];
        [head addSubview:headerView];
        return head;
    }
    
}
-(void)handleSelectColor:(UIButton *)sender{
    
    NSLog(@"%ld",(long)sender.tag);
}
-(void)handleExpandList:(UITapGestureRecognizer *)sender{
    
    UIView *view = sender.view;
    
    if (selectedIndex == view.tag) {

        selectedIndex = -1;

    } else {
        
        selectedIndex = view.tag;
    }

    [self.tableview reloadData];
    
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectedIndex == indexPath.section) {
        
        if ([[serviceCategoriesList objectAtIndex:indexPath.section] services].count == indexPath.row) {
            return 62;
        }else{
            return 50;
        }
        
    } else {
        return 0;
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
