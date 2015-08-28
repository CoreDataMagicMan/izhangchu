//
//  MainViewController.m
//  iZhangChu
//
//  Created by iJeff on 15/8/25.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h" //cell

//#import "UIImageView+AFNetworking.h" //AFNetworking提供的异步加载图片的方式
#import "UIImageView+WebCache.h" //SDWebImage提供的异步加载图片的方式
/*
    通过NSURLConnection将图片二进制下载, 转换成UIImage, 会缓存(内存缓存, 磁盘缓存), SDWebImage:在App内存即将溢出时自动释放内存缓存.
 */


#import "DetailViewController.h" //详情页


@interface MainViewController ()
<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    //天
    __weak IBOutlet UILabel *dayLab;
    
    //年-月
    __weak IBOutlet UILabel *yearMonthLab;
    
    //农历
    __weak IBOutlet UILabel *nonliLab;
    
    // "宜"or"忌"的图标
    __weak IBOutlet UIImageView *iconImgView;
    
    //今日信息的bgView
    __weak IBOutlet UIView *todayInfoBgView;
    
    //今日信息
    __weak IBOutlet UILabel *todayInfoLab;
    
    //中文名称
    __weak IBOutlet UILabel *nameLab;
    
    //英文名称
    __weak IBOutlet UILabel *englishNameLab;
    
    
    //pageControlBgView
    __weak IBOutlet UIView *pageControlBgView;
    
    //pageControlLab
    __weak IBOutlet UILabel *pageControlLab;
    
    //pageControlBgView的左边的约束
    __weak IBOutlet NSLayoutConstraint *pageControlBgViewLeftConstraint;
    
    //collectionView
    __weak IBOutlet UICollectionView *myCollectionView;
    
    //数据源数组
    NSMutableArray *_datas;
    
    //当前页
    NSInteger currentPage;
    
    //保存 "是否正在显示宜的信息" 的状态
    BOOL isShowFitting;
    
}

@end

@implementation MainViewController

//初始化方法
-(instancetype)init
{
    if (self = [super init]) {
        _datas = [NSMutableArray array];
        currentPage = 1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //让todayInfoBgView的子视图不超出自己的范围
    todayInfoBgView.clipsToBounds = YES;
    
    //获取数据
    [self loadData];
    
    //获取今日信息数据
    [self loadTodayInfoData];
    
    //初始化collectionView
    [self initCollectionView];
    
}

#pragma  mark - 加载数据
-(void)loadData
{
    //url
    NSString *url = [NSString stringWithFormat:MAINMENU_URL, currentPage];
    
    //异步
    //同步
    //请求菜单数据
    [[HTTPRequestManager sharedManager] GET:url params:nil result:^(id responseObj, NSError *error) {
        
        //如果有错误
        if (error) {
            NSLog(@"error:%@", error);
            return;
        }
        
        NSArray *dataArr = responseObj;
        [_datas addObjectsFromArray:dataArr];
        
        //更新菜的信息为第一个菜
        if (currentPage == 1 && _datas.count > 0) {
            [self updateFoodInfoByIndex:0];
        }
        
        //刷新collectionView
        [myCollectionView reloadData];

    }];
    

}

#pragma  mark -- 加载今日信息数据
-(void)loadTodayInfoData
{
    //获取本地日期
    NSDictionary *todayInfoDict = [Helper getTodayDate];
    NSString *year = todayInfoDict[@"year"]; //年
    NSString *month = todayInfoDict[@"month"]; //月
    NSString *day = todayInfoDict[@"day"]; //天
    
    //赋值
    dayLab.text = day;
    yearMonthLab.text = [NSString stringWithFormat:@"%@-%@", year, month];
    
    //获取今日信息数据
    NSString *url = [NSString stringWithFormat:MAINDATE_URL, year, month, day];
    
    [[HTTPRequestManager sharedManager] GET:url params:nil result:^(id responseObj, NSError *error) {
        
        NSArray *dataArr = responseObj;
        
        if (dataArr.count > 0) {
            
            NSDictionary *dict = dataArr[0];
            
            //农历
            NSString *LunarCalendar = dict[@"LunarCalendar"];
            
            //适宜吃的食物信息
            NSString *alertInfoFitting = dict[@"alertInfoFitting"];
            
            //禁忌吃的食物信息
            NSString *alertInfoAvoid = dict[@"alertInfoAvoid"];
            
            //赋值
            nonliLab.text = [NSString stringWithFormat:@"农历%@", LunarCalendar];
            
            //显示今日信息
            [self showTodayInfoWithFitting:alertInfoFitting avoid:alertInfoAvoid];
            
        }
    }];
}

#pragma  mark - "走马灯"效果显示今日信息
-(void)showTodayInfoWithFitting:(NSString *)fitFood avoid:(NSString *)avoidFood
{
    //在显示完"忌"的情况下, 切换到显示"宜"的信息
    if (isShowFitting == NO) {
        
        isShowFitting = YES;

        //初始化
        iconImgView.image = [UIImage imageNamed:@"首页-宜"];
        todayInfoLab.text = fitFood;
        
        CGRect frame = todayInfoLab.frame;
        frame.origin.x = todayInfoBgView.frame.size.width;
        todayInfoLab.frame = frame;
        
        //计算文字的宽度
        CGFloat width = [Helper widthOfString:fitFood font:todayInfoLab.font height:20];
        
        //计算运动时长
        double duration = (width + todayInfoBgView.frame.size.width) * 0.02;
        
        //动画移动位置
        [UIView animateWithDuration:duration animations:^{
            
            //终点位置
            CGRect frame = todayInfoLab.frame;
            frame.origin.x = width * (-1);
            todayInfoLab.frame = frame;
            
        } completion:^(BOOL finished) {
            
            //递归, 继续"走马灯"移动
            [self showTodayInfoWithFitting:fitFood avoid:avoidFood];
        }];
        
    }
    
    //在显示"宜"的情况下, 切换到显示"忌"的信息
    else {
        
        isShowFitting = NO;
        
        //初始化
        iconImgView.image = [UIImage imageNamed:@"首页-忌"];
        todayInfoLab.text = avoidFood;
        
        CGRect frame = todayInfoLab.frame;
        frame.origin.x = todayInfoBgView.frame.size.width;
        todayInfoLab.frame = frame;
        
        //计算文字宽度
        CGFloat width = [Helper widthOfString:avoidFood font:todayInfoLab.font height:20];
        
        //计算运动时间
        double duration = (width + todayInfoBgView.frame.size.width) * 0.02;
        
        //动画移动
        [UIView animateWithDuration:duration animations:^{
            
            //终点位置
            CGRect frame = todayInfoLab.frame;
            frame.origin.x = width * (-1);
            todayInfoLab.frame = frame;
            
        } completion:^(BOOL finished) {
            
            //递归调用, 继续显示"宜"的信息
            [self showTodayInfoWithFitting:fitFood avoid:avoidFood];
        }];
    }
}


#pragma  mark - 初始化collectionView
-(void)initCollectionView
{
    //注册cell
    [myCollectionView registerClass:[MainCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma  mark - collectionView 代理方法
//cell的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _datas.count;
}

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //获取cell对应的数据
    NSDictionary *dict = _datas[indexPath.row];
    NSString *imagePathLandscape = dict[@"imagePathLandscape"]; //图片路径
    
    //异步加载图片
    //AFN的异步加载图片
//    [cell.imgView setImageWithURL:[NSURL URLWithString:imagePathLandscape] placeholderImage:[UIImage imageNamed:@"首页-默认底图"]];
    
    //SDWebImage
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:imagePathLandscape] placeholderImage:[UIImage imageNamed:@"首页-默认底图"]];
    
    
    return cell;
}

//cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return myCollectionView.bounds.size; //CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
}

//选择cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    
    vc.datas = [NSMutableArray arrayWithArray:_datas]; 
    vc.myIndex = indexPath.row;
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma  mark - scrollView 代理方法
//停止拖拽时
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //如果偏移量较大
    if (offset.x > (_datas.count-1) * kScreenWidth) {
        
        //加载下一页数据
        currentPage ++;
        [self loadData];
        
    }
}

//滑动停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //页码下标 (从0开始)
    NSInteger index = offset.x / kScreenWidth;
    
    //更新菜的信息
    [self updateFoodInfoByIndex:index];
    
    //pageControl
    pageControlLab.text = [NSString stringWithFormat:@"%ld", index+1];
    
    //计算出pageControlBgView的x的最新的位置
    CGFloat x = 10 + (240.0 / (_datas.count)) * index;

    pageControlBgViewLeftConstraint.constant = x; //修改约束的值
    
//    CGRect frame = pageControlBgView.frame;
//    frame.origin.x = x; //设置最新的x的值
//    pageControlBgView.frame = frame;
    
}

#pragma  mark - 更新菜的信息
-(void)updateFoodInfoByIndex:(NSInteger)index
{
    //获取当前显示的菜的数据
    NSDictionary *dict = _datas[index];
    NSString *name = dict[@"name"]; //中文名称
    NSString *englishName = dict[@"englishName"]; //英文名称
    
    //赋值
    nameLab.text = name;
    englishNameLab.text = englishName;
}


#pragma  mark - 智能选菜Action
- (IBAction)smartSearchAction:(id)sender {
    
}

#pragma  mark - 搜索Action
- (IBAction)searchAction:(id)sender {
    
}







@end




