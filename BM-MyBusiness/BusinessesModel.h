//
//  BusinessesModel.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Utils.h"
NS_ASSUME_NONNULL_BEGIN

@interface BusinessesModel : NSObject
@property (nonatomic,strong) NSString *businessID,*name,*businessDescription,*icon,*status;
@property (nonatomic,strong) NSArray *serviceCategory;
@end

NS_ASSUME_NONNULL_END
