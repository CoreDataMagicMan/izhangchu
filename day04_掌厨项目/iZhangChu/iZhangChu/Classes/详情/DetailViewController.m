//
//  DetailViewController.m
//  iZhangChu
//
//  Created by iJeff on 15/8/26.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "DetailViewController.h"
#import "MainCell.h"  //cell

#import <MediaPlayer/MediaPlayer.h>

#import "DetailBottomViewController.h" //详情-底部


@interface DetailViewController ()
<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    //collectionView
    __weak IBOutlet UICollectionView *myCollectionView;
    
    __weak IBOutlet UILabel *nameLab; //名称
    
    __weak IBOutlet UILabel *englishNameLab; //英文名称
    
    __weak IBOutlet UILabel *cookDurationLab; //烹饪时间
    
    __weak IBOutlet UILabel *tasteLab; //口味
    
    __weak IBOutlet UILabel *cookMethodLab; //烹饪方法
    
    __weak IBOutlet UILabel *effectLab; //功效
    
    __weak IBOutlet UILabel *fitPersonLab; //适合人群
    
    
    //保存当前显示的菜的下标
    NSInteger currentIndex;
    
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化collectionView
    [self initCollectionView];
    
    //更新菜的信息为首页点击的菜
    [self updateFoodInfoByIndex:_myIndex];
    
    //设置偏移量,显示在首页点击的菜
    myCollectionView.contentOffset = CGPointMake(kScreenWidth * _myIndex, 0);
    
    //初始化currentIndex
    currentIndex = _myIndex;
}

#pragma  mark - 初始化collectionView
-(void)initCollectionView
{
    //注册cell
    [myCollectionView registerClass:[MainCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma  mark -- collectionView 代理方法
//cell的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _datas.count;
}

//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //获取cell的数据
    NSDictionary *dict = _datas[indexPath.row];
    NSString *imagePathLandscape = dict[@"imagePathLandscape"]; //图片
    
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:imagePathLandscape] placeholderImage:[UIImage imageNamed:@"首页-默认底图"]];
    
    return cell;
}

//cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return myCollectionView.bounds.size;
}


#pragma  mark - scrollView 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //页码下标
    NSInteger index = offset.x / kScreenWidth;
    
    //更新菜的信息
    [self updateFoodInfoByIndex:index];
    
    currentIndex = index;
}

#pragma  mark - 更新菜的信息
-(void)updateFoodInfoByIndex:(NSInteger)index
{
    //获取当前显示的菜的数据
    NSDictionary *dict = _datas[index];
    NSString *name = dict[@"name"]; //名称
    NSString *englishName = dict[@"englishName"]; //英文名称
    
    NSString *timeLength = dict[@"timeLength"]; //烹饪时长
    NSString *taste = dict[@"taste"]; //口味
    NSString *cookingMethod = dict[@"cookingMethod"]; //烹饪方法
    NSString *effect = dict[@"effect"]; //功效
    NSString *fittingCrowd = dict[@"fittingCrowd"]; //适合人群
    
    //赋值
    nameLab.text = name;
    englishNameLab.text = englishName;
    
    cookDurationLab.text = timeLength;
    tasteLab.text = taste;
    cookMethodLab.text = cookingMethod;
    effectLab.text = effect;
    fitPersonLab.text = fittingCrowd;
    
}



#pragma  mark -- 材料准备
- (IBAction)materailVideoAction:(id)sender {
    
    //获取当前显示的菜的数据
    NSDictionary *dict = _datas[currentIndex];
    NSString *materialVideoPath = dict[@"materialVideoPath"]; //材料准备的视频路径
    
    //播放视频
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:materialVideoPath]];
    [self presentViewController:player animated:YES completion:nil];
}

#pragma  mark -- 制作过程
- (IBAction)progressVideoAction:(id)sender {
    
    //获取当前显示的菜的数据
    NSDictionary *dict = _datas[currentIndex];
    NSString *productionProcessPath = dict[@"productionProcessPath"]; //制作过程的视频路径
    
    //播放视频
    //AVPlayer : 视频, 音乐, 电台
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:productionProcessPath]];
    [self presentViewController:player animated:YES completion:nil];
}


#pragma  mark -- 底部按钮的点击事件
- (IBAction)bottomButtonAction:(UIButton *)sender {
    
    NSInteger index = sender.tag - 100;
    
    //进入详情-底部页
    DetailBottomViewController *vc = [[DetailBottomViewController alloc] init];
    vc.myIndex = index; //传入下标
    
    [self.navigationController pushViewController:vc animated:YES];
    
}





#pragma  mark -- 返回
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}








@end



