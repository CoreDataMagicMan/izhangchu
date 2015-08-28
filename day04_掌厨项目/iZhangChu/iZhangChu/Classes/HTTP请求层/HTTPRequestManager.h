//
//  HTTPRequestManager.h
//  iZhangChu
//
//  Created by iJeff on 15/8/25.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求数据后返回的Block类型
typedef void(^ResultBlock)(id responseObj, NSError *error);


@interface HTTPRequestManager : NSObject

//单例
+ (HTTPRequestManager *)sharedManager;

//GET请求
//参数可以方在url中,也可以放在params(字典)中
- (void)GET:(NSString *)url params:(id)params result:(ResultBlock)resultBlock;




@end








