//
//  TrxadeAPI.h
//  TRxADE
//


//

#import "AFHTTPSessionManager.h"
#import "Defines.h"


@interface MyBusinessAPI : AFHTTPSessionManager
// single ton of Trxade
+(MyBusinessAPI *)sharedTrxadeAPIClient;
-(void)getCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;
-(void)postCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;
-(void)deleteCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;
-(void)getCallWithoutAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;
-(void)postCallWithoutAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;
-(void)putCallWithAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id responseObject,NSError *error))block;


@end
