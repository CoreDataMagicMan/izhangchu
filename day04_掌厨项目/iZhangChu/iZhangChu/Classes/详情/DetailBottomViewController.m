//
//  DetailBottomViewController.m
//  iZhangChu
//
//  Created by iJeff on 15/8/27.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "DetailBottomViewController.h"

#import "MaterialView.h" //材料View
#import "MethodView.h" //做法View
#import "CommonSenceView.h" //相关常识View
#import "NoticeView.h" //相宜相克View

@interface DetailBottomViewController ()
<UIScrollViewDelegate>
{
    //导航条上的小图标
    __weak IBOutlet UIImageView *navIconImgView;
    
    //导航条上的标题
    __weak IBOutlet UILabel *navTitleLab;
    
    //scrollView
    __weak IBOutlet UIScrollView *myScrollView;
    
    
    MaterialView *view0; //材料View
    MethodView *view1; //做法View
    CommonSenceView *view2; //相关常识View
    NoticeView *view3; //相宜相克View
    
}
@end

@implementation DetailBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化scrollView
    myScrollView.contentSize = CGSizeMake(kScreenWidth * 4, 0);
    myScrollView.pagingEnabled = YES;
    myScrollView.delegate = self;
    
    //创建相应的第myIndex个View
    [self createViewByIndex:_myIndex];
    
    //设置偏移量,移动到第myIndex个View的位置
    myScrollView.contentOffset = CGPointMake(kScreenWidth * _myIndex, 0);
}

#pragma  mark - 创建View
- (void)createViewByIndex:(NSInteger)index
{
    //index: 0 1 2 3
    switch (index) {
        case 0:
        {
            //如果已经创建了, 则不重复创建
            if (view0) {
                return;
            }
            
            NSLog(@"view0");
            
            //材料
            view0 = [[MaterialView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
            
            [myScrollView addSubview:view0];
            
        } break;
            
        case 1:
        {
            //如果已经创建了, 则不重复创建
            if (view1) {
                return;
            }

            NSLog(@"view1");

            //做法
            view1 = [[MethodView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight-64)];
            
            [myScrollView addSubview:view1];
            
        } break;
            
        case 2:
        {
            //如果已经创建了, 则不重复创建
            if (view2) {
                return;
            }

            NSLog(@"view2");

            //相关常识
            view2 = [[CommonSenceView alloc] initWithFrame:CGRectMake(kScreenWidth * 2, 0, kScreenWidth, kScreenHeight-64)];
            
            [myScrollView addSubview:view2];

        } break;
            
        case 3:
        {
            //如果已经创建了, 则不重复创建
            if (view3) {
                return;
            }

            NSLog(@"view3");
            
            //相宜相克
            view3 = [[NoticeView alloc] initWithFrame:CGRectMake(kScreenWidth * 3, 0, kScreenWidth, kScreenHeight-64)];
            
            [myScrollView addSubview:view3];

        } break;

        default:
            break;
    }
}


#pragma  mark - scrollView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //页码下标
    NSInteger index = offset.x / kScreenWidth;
    
    //创建第index个View
    [self createViewByIndex:index];
    
}



//返回
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//返回首页
- (IBAction)backHomeAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}




@end






