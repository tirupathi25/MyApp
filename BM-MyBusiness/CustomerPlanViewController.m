//
//  CustomerPlanViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "CustomerPlanViewController.h"
#import "Defines.h"
#import "APICalls.h"
#import "Utilities.h"
#import "MyBusinessAPI.h"
#import "PlansViewCell.h"
#import "PlanModel.h"
@interface CustomerPlanViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CustomerPlanViewController
    {
        NSString *errorMessage;
        NSMutableArray *plansDataList;
        NSInteger selectedIndex;
    }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    selectedIndex = -1;
    
    plansDataList = [NSMutableArray new];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleBack)];
    //method to get plans
    [self getPlansData];
}
-(void)getPlansData{
    // check network connection
    if ([UTILITIES connected]) {
        
        [UTILITIES showHud:self.view withText:@"Loading.."];
        // API call tpo get members
        [[MyBusinessAPI sharedTrxadeAPIClient] getCall:SUBSCRIPTION_PLAN withParameters:nil block:^(id responseObject, NSError *error) {
            
            [UTILITIES hideHUDInView:self.view];
            if (error) {
                [UTILITIES showTostAlert:error.localizedDescription andInView:self.view];
            } else {
                
                if ([[responseObject objectForKey:@"code"] integerValue] == SUCCESS_CODE) {
                    
                    NSArray *result = [responseObject objectForKey:@"result"];
                    
                    for (NSDictionary *dict in result) {
                        PlanModel *plan = [PlanModel new];
                        [plan setBusinessCount:[UTILITIES convertToString:[dict objectForKey:@"businessCount"]]];
                        [plan setDuration:[UTILITIES convertToString:[dict objectForKey:@"duration"]]];
                        [plan setEmployeeManServices:[UTILITIES convertToString:[dict objectForKey:@"employeeManServices"]]];
                        [plan setPlanId:[UTILITIES convertToString:[dict objectForKey:@"id"]]];
                        [plan setNotifications:[UTILITIES convertToString:[dict objectForKey:@"notifications"]]];
                        [plan setPrice:[UTILITIES convertToString:[dict objectForKey:@"price"]]];
                        [plan setReports:[UTILITIES convertToString:[dict objectForKey:@"reports"]]];
                        [plan setServiceAllowed:[UTILITIES convertToString:[dict objectForKey:@"serviceAllowed"]]];
                        [plan setSupportDevices:[UTILITIES convertToString:[dict objectForKey:@"supportDevices"]]];
                        [plan setTrailVersion:[UTILITIES convertToString:[dict objectForKey:@"trailVersion"]]];
                        [plan setType:[UTILITIES convertToString:[dict objectForKey:@"type"]]];
                        [self->plansDataList addObject:plan];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
    -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        
        if (plansDataList.count != 0) {
            
            self.tableview.backgroundView = nil;
            return plansDataList.count;
            
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PlansViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlansViewCell"];
    
    if (!cell) {
        cell = [[PlansViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PlansViewCell"];
    }
    
    PlanModel *model = [plansDataList objectAtIndex:indexPath.row];
    
    cell.planNameLabel.text = [model type];
    cell.priceLabel.text = [model price];
    
    cell.bgView.layer.borderColor = gray_color.CGColor;
    cell.bgView.layer.borderWidth = 1;
    
    cell.selectionBtn.layer.cornerRadius = 10;
    cell.selectionBtn.layer.borderColor = gray_color.CGColor;
    cell.selectionBtn.layer.borderWidth = 1;
    
    cell.bgView.layer.shadowOffset = CGSizeMake(0.0, 3.0);
    cell.bgView.layer.shadowRadius = 2.0;
    cell.bgView.layer.shadowOpacity = 0.3;
    
    cell.selectionBtn.backgroundColor = selectedIndex == indexPath.row ? blue_color : [UIColor clearColor];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        
        return 77;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedIndex = indexPath.row;
    [tableView reloadData];
    
}
-(void)handleBack{
    [self dismissViewControllerAnimated:YES completion:nil];
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
