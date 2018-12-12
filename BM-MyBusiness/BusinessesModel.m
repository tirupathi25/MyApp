//
//  BusinessesModel.m
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import "BusinessesModel.h"
#import "ServicesCategoryModel.h"
@implementation BusinessesModel
-(void)setBusinessID:(NSString *)businessID{
    _businessID = [NSString isNullOrEmpty:businessID] ? @"" : businessID;
}
-(void)setName:(NSString *)name{
    _name = [NSString isNullOrEmpty:name] ? @"" : name;
}
-(void)setBusinessDescription:(NSString *)businessDescription
{
    _businessDescription = [NSString isNullOrEmpty:businessDescription] ? @"" : businessDescription;
}
- (void)setIcon:(NSString *)icon{
    _icon = [NSString isNullOrEmpty:icon] ? @"" : icon;
}
-(void)setStatus:(NSString *)status{
    _status = [NSString isNullOrEmpty:status] ? @"" : status;
}
-(void)setServiceCategory:(NSArray *)serviceCategory{
 
    _serviceCategory = serviceCategory.count != 0 ? serviceCategory : @[];
    
}
@end
