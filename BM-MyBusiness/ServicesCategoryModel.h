//
//  ServicesCategoryModel.h
//  BM-MyBusiness
//
//  Created by Tirupathi Mandali on 12/12/18.
//  Copyright © 2018 Tirupathi Mandali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServicesCategoryModel : NSObject
@property (nonatomic,strong) NSString *categoryID,*name,*categoryDescription,*colorId,*type;
@property (nonatomic,strong) NSArray *services;
@end

NS_ASSUME_NONNULL_END
