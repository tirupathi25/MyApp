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
#import "SWRevealViewController.h"
@interface EmployeesViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation EmployeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
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
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EmployeesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeesViewCell"];
    if (!cell) {
        cell = [[EmployeesViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EmployeesViewCell"];
    }
    cell.profilePicView.layer.cornerRadius = 20;
    cell.profilePicView.image = [UIImage imageNamed:@"mybusiness"];
    cell.nameLabel.text = [NSString stringWithFormat:@"My Name : %ld",(long)indexPath.row];
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
