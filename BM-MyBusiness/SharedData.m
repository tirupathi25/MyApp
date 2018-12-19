//
//  SharedData.m
//  TRxADE
//
//  Created by Lavanya on 07/06/18.
//  Copyright © 2018 Amzur Technologies. All rights reserved.
//

#import "SharedData.h"

@implementation SharedData
// single ton of shared data class
+(SharedData *)sharedInstace
{
    static SharedData *_shareinstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _shareinstance = [[self alloc] init];
    });
    
    return _shareinstance;
}

// init method
-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.createBusiness_data_dictionary = [NSMutableDictionary new];
    }
    return self;
}



@end
