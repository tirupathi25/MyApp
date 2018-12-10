
#import "MyBusinessAPI.h"
@implementation MyBusinessAPI
// Trxade singleton
+ (MyBusinessAPI *)sharedTrxadeAPIClient
{
    static MyBusinessAPI *_sharedTrxadeAPIClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        _sharedTrxadeAPIClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:DEV_URL]];
    });
    return _sharedTrxadeAPIClient;
}
// base url method
-(instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    
    if (self) {
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer =  [AFJSONRequestSerializer serializer];
//        [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:UUID] forHTTPHeaderField:@"device_id"];
//        [self.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"device_type"];
        AFHTTPSessionManager *manger = [AFHTTPSessionManager new];
        [manger.reachabilityManager startMonitoring];
    }
    return self;
}
// getcall method with authentication
-(void)getCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block
{
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY] forHTTPHeaderField:AUTH_KEY];
    
    [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block([NSDictionary new],error);
    }];
}
// delete call method with authentication
-(void)deleteCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block
{
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY] forHTTPHeaderField:AUTH_KEY];
    [self DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block([NSDictionary new],error);
    }];
    
    
}
// post call method with authentication
-(void)postCall:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block{
    
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY] forHTTPHeaderField:AUTH_KEY];
    
//    if ([url isEqualToString:USER_SIGNIN]) {

//        [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:DEVICE_TOKEN] forHTTPHeaderField:DEVICE_TOKEN];
//    }
    
    [self POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block([NSDictionary new],error);
        
    }];
}
// get call without authentication
-(void)getCallWithoutAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block
{
    
    [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block([NSDictionary new],error);
    }];
}
// post call without authenctication
-(void)postCallWithoutAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block
{
    
    
    [self POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block([NSDictionary new],error);
        
    }];
    
}
// put call with authentication
-(void)putCallWithAuth:(NSString *)url withParameters:(NSDictionary *)parameters block:(void (^)(id, NSError *))block
{
    [self.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:AUTH_KEY] forHTTPHeaderField:AUTH_KEY];
    [self PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block([NSDictionary new],error);
    }];
}


@end
