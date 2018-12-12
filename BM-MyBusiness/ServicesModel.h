//
//  ServicesModel.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServicesModel : NSObject
@property (nonatomic,strong) NSString *serviceID,*name,*serviceDescription,*typecreatedBy,*duration,*price,*unit,*renewalTime;
@end

NS_ASSUME_NONNULL_END
