//
//  EmployeesViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/11/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "EmployeesViewController.h"
#import "CreateEmployeeViewController.h"
#import "EmployeesViewCell.h"
#import "MyBusinessAPI.h"
#import "Utilities.h"
#import "APICalls.h"
#import "SWRevealViewController.h"
@interface EmployeesViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation EmployeesViewController
{
    NSString *errorMessage;
    NSMutableArray *employeesList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    employeesList = [NSMutableArray new];
    
    // create custom menu button with image
    UIButton *menu_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    menu_btn.frame = CGRectMake(0, 0,50, 50);
    menu_btn.imageEdgeInsets = UIEdgeInsetsMake(0, menuBtnXval, 0, 0);
    [menu_btn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menu_btn addTarget:self action:@selector(tapMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    NSLayoutConstraint *widthconstraint = [menu_btn.widthAnchor constraintEqualToConstant:45];
    NSLayoutConstraint *heightconstraint = [menu_btn.heightAnchor constraintEqualToConstant:45];
    [widthconstraint setActive:YES];
    [heightconstraint setActive:YES];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menu_btn];
    // set pan gesture enable to reveal view controller
    self.revealViewController.panGestureRecognizer.enabled = YES;
    
    //add cell separator style
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleNewEmployee)];
    
    [self getEmployeesList];
}

-(void)getEmployeesList{
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY]);
    // check network connection
    if ([UTILITIES connected]) {
        
        [UTILITIES showHud:self.view withText:@"Loading.."];
        // API call tpo get members
        [[MyBusinessAPI sharedTrxadeAPIClient] postCall:GET_EMPLOYEES_LIST withParameters:@{@"publisherId":[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY],@"businessId":[[NSUserDefaults standardUserDefaults] objectForKey:SELECTED_BUSINESS_ID]} block:^(id responseObject, NSError *error) {
            
            [UTILITIES hideHUDInView:self.view];
            if (error) {
                [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
                [self.tableview reloadData];
            } else {
                
                if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                    
                    NSArray *result = [responseObject objectForKey:@"result"];
                    
                    if (result.count != 0) {
                        
                        [self->employeesList addObjectsFromArray:result];
                        
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
//menu button action
-(void)tapMenu:(UIButton *)sender
{
    [self.view endEditing:YES];
    
    [self.revealViewController revealToggle:sender];
}
//method to add new new employee
-(void)handleNewEmployee{
    
    CreateEmployeeViewController *empView = [STORYBOARD instantiateViewControllerWithIdentifier:@"CreateEmployeeViewController"];
    [self.navigationController pushViewController:empView animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (employeesList.count != 0) {
        
        self.tableview.backgroundView = nil;
        return employeesList.count;
        
    } else {
        
        UILabel *noDataFound_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableview.frame.size.width, self.tableview.frame.size.height)];
        [noDataFound_label setFont:[UIFont fontWithName:Halvetica size:15]];
        [noDataFound_label setTextColor:[UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0]];
        noDataFound_label.numberOfLines=0;
        noDataFound_label.textAlignment=NSTextAlignmentCenter;
        [noDataFound_label sizeToFit];
        noDataFound_label.text=errorMessage;
        self.tableview.backgroundView = noDataFound_label;
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EmployeesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeesViewCell"];
    if (!cell) {
        cell = [[EmployeesViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EmployeesViewCell"];
    }
    NSDictionary *empDict = [employeesList objectAtIndex:indexPath.row];
    cell.profilePicView.layer.cornerRadius = 20;
    cell.profilePicView.image = [UIImage imageNamed:@"profilepic"];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[empDict objectForKey:@"firstName"]];
    return cell;
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
