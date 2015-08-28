//
//  DetailViewController.h
//  iZhangChu
//
//  Created by iJeff on 15/8/26.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

/*
 传值:
    正向传值:
    反向传值: 代理, Block, SEL
    其他传值: 通知
 单例: 保存数据, 登录(NSUserDefaults)
 */

//从首页传入的数据
@property (nonatomic, strong)NSMutableArray *datas;

//从首页传入点击的菜的下标
@property (nonatomic, assign)NSInteger myIndex;




@end



