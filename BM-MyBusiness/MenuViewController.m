//
//  MenuViewController.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/3/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"
#import "MenuCell.h"
#import "Defines.h"

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray *menu_item_array;
@property NSMutableArray *menu_icon_array;
@property NSMutableDictionary *menu_item_dict;
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = blue_color;
    self.tableView.backgroundColor = blue_color;
    _menu_item_dict = [NSMutableDictionary new];
    _menu_item_dict[MY_BUSINESS] = [NSNumber numberWithUnsignedInteger:my_business];
    _menu_item_dict[ADD_BUSINESS] = [NSNumber numberWithUnsignedInteger:add_business];
    _menu_item_dict[APPOINITMENT] = [NSNumber numberWithUnsignedInteger:appointment];
    _menu_item_dict[SERVICES] = [NSNumber numberWithUnsignedInteger:services];
    _menu_item_dict[EMPLOYEES] = [NSNumber numberWithUnsignedInteger:employees];
    _menu_item_dict[BREAKTIME_SETUP] = [NSNumber numberWithUnsignedInteger:breaktime_setup];
    _menu_item_dict[EMPLOYEE_TIMEOFF] = [NSNumber numberWithUnsignedInteger:employee_timeoff];
    _menu_item_dict[REPORTS] = [NSNumber numberWithUnsignedInteger:reports];
    _menu_item_dict[MESSAGES] = [NSNumber numberWithUnsignedInteger:messages];
    
    _menu_item_dict[UPDATE_BUSINESS] = [NSNumber numberWithUnsignedInteger:update_business];
    _menu_item_dict[SETTINGS] = [NSNumber numberWithUnsignedInteger:settings];
    _menu_item_dict[QR_CODE] = [NSNumber numberWithUnsignedInteger:qr_code];
    _menu_item_dict[BILLING] = [NSNumber numberWithUnsignedInteger:billing];
    _menu_item_dict[PROFILE] = [NSNumber numberWithUnsignedInteger:profile];
    _menu_item_dict[RAISE_REQUEST] = [NSNumber numberWithUnsignedInteger:raise_request];
    
    _menu_item_dict[REMOVE_BUSINESS] = [NSNumber numberWithUnsignedInteger:remove_business];
    _menu_item_dict[CANCEL_MEMBERSHIP] = [NSNumber numberWithUnsignedInteger:cancel_membership];
    _menu_item_dict[LOGOUT] = [NSNumber numberWithUnsignedInteger:logout];
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.menu_item_array = [NSMutableArray new];
    self.menu_icon_array = [NSMutableArray new];
    
    self.menu_item_array = [NSMutableArray arrayWithObjects:
                            MY_BUSINESS,
                            ADD_BUSINESS,
                            APPOINITMENT,
                            SERVICES,
                            EMPLOYEES,
                            BREAKTIME_SETUP,
                            EMPLOYEE_TIMEOFF,
                            REPORTS,
                            MESSAGES,
                            UPDATE_BUSINESS,
                            SETTINGS,
                            QR_CODE,
                            BILLING,
                            PROFILE,
                            RAISE_REQUEST,
                            REMOVE_BUSINESS,
                            CANCEL_MEMBERSHIP,
                            LOGOUT, nil];
    self.menu_icon_array = [NSMutableArray arrayWithObjects:
                            @"mybusiness",
                            @"addbusiness",
                            @"appointment",
                            @"services",
                            @"employees",
                            @"breaktimesetup",
                            @"employeetimeoff",
                            @"reports",
                            @"messages",
                            @"updatebusiness",
                            @"settings",
                            @"qrcode",
                            @"billing",
                            @"profile",
                            @"raiserequest",
                            @"removebusiness",
                            @"cancelmembership",
                            @"logout",nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 18;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
    }
    cell.titlelabel.text = [self.menu_item_array objectAtIndex:indexPath.row];
    cell.titlelabel.textColor = white_color;
    cell.icon_imageview.image = [UIImage imageNamed:[self.menu_icon_array objectAtIndex:indexPath.row]];
    cell.sepratorLine.backgroundColor = indexPath.row == 17 ? [UIColor clearColor] : white_color;
    return cell;
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *title = cell.titlelabel.text;
    [self.revealViewController revealToggle:indexPath];
    
    switch ([[_menu_item_dict objectForKey:title] unsignedIntegerValue]) {
        case my_business:
        [self.delegate handleMyBusiness];
        break;
        case add_business:
        [self.delegate handleAddBusiness];
        break;
        case appointment:
        [self.delegate handleAppointment];
        break;
        case services:
        [self.delegate handleServices];
        break;
        case employees:
        [self.delegate handleShowEmployees];
        break;
        case breaktime_setup:
        [self.delegate handleShowBreaktimeSetup];
        break;
        case employee_timeoff:
        [self.delegate handleShowEmployeeTimeoff];
        break;
        case reports:
        [self.delegate handleShowReports];
        break;
        case messages:
        [self.delegate handleShowMessages];
        break;
        case update_business:
        [self.delegate handleShowUpdateBusiness];
        break;
        case settings:
        [self.delegate handleShowSettings];
        break;
        case qr_code:
        [self.delegate handleShowQRCode];
        break;
        case billing:
        [self.delegate handleShowBilling];
        break;
        case profile:
        break;
        case raise_request:
        [self.delegate handleShowProfile];
        break;
        case remove_business:
        [self.delegate handleShowRemoveBusiness];
        break;
        case cancel_membership:
        [self.delegate handleShowCancelMembership];
        break;
        case logout:
        [self.delegate handleLogout];
        break;
        
        default:
        break;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
