//
//  HTTPRequestManager.m
//  iZhangChu
//
//  Created by iJeff on 15/8/25.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "HTTPRequestManager.h"
#import "AFNetworking.h"

@interface HTTPRequestManager ()
{
    //HTTP请求管理器
    AFHTTPRequestOperationManager *manager;
}
@end

@implementation HTTPRequestManager

//单例
+ (HTTPRequestManager *)sharedManager
{
    static HTTPRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HTTPRequestManager alloc] init];
    });
    return instance;
}

//初始化
- (instancetype)init
{
    if (self = [super init]) {
        
        manager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

//GET请求
-(void)GET:(NSString *)url params:(id)params result:(ResultBlock)resultBlock
{
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //获取到data数组
        NSArray *dataArr = responseObject[@"data"];
        
        //回传数据
        if (resultBlock) {
            resultBlock(dataArr, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //回传错误信息
        if (resultBlock) {
            resultBlock(nil, error);
        }
        
    }];
    
}







@end



