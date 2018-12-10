//
//  PlanModel.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/4/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "PlanModel.h"
#import "NSString+Utils.h"
@implementation PlanModel

-(void)setBusinessCount:(NSString *)businessCount
{
    _businessCount = [NSString isNullOrEmpty:businessCount] ? @"0" : businessCount;
}
 -(void)setDuration:(NSString *)duration
{
    _duration = [NSString isNullOrEmpty:duration] ? @"" : duration;
}
-(void)setEmployeeManServices:(NSString *)employeeManServices{
    _employeeManServices = [NSString isNullOrEmpty:employeeManServices] ? @"" : employeeManServices;
}
-(void)setPlanId:(NSString *)planId{
    _planId = [NSString isNullOrEmpty:planId] ? @"" : planId;
}
-(void)setNotifications:(NSString *)notifications{
    _notifications = [NSString isNullOrEmpty:notifications] ? @"" : notifications;
}
-(void)setPrice:(NSString *)price{
    _price = [NSString isNullOrEmpty:price] ? @"0" : price;
}
-(void)setReports:(NSString *)reports{
    _reports = [NSString isNullOrEmpty:reports] ? @"" : reports;
}
-(void)setServiceAllowed:(NSString *)serviceAllowed{
    _serviceAllowed = [NSString isNullOrEmpty:serviceAllowed] ? @"" : serviceAllowed;
}
-(void)setSupportDevices:(NSString *)supportDevices{
    _supportDevices = [NSString isNullOrEmpty:supportDevices] ? @"0" : supportDevices;
}
-(void)setTrailVersion:(NSString *)trailVersion{
    _trailVersion = [NSString isNullOrEmpty:trailVersion] ? @"" : trailVersion;
}
-(void)setType:(NSString *)type{
    _type = [NSString isNullOrEmpty:type] ? @"" : type;
}
@end
