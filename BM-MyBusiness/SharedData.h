//
//  SharedData.h
//  TRxADE
//
//  Created by Lavanya on 07/06/18.
//  Copyright © 2018 Amzur Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedData : NSObject

+(SharedData *)sharedInstace;

@property NSMutableDictionary *createBusiness_data_dictionary;

@end
