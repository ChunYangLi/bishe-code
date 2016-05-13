//
//  PictureViewController.h
//  TTNews
//
//  Created by 李春阳 on 15/5/3.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "PictureViewController.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import <UIImageView+WebCache.h>
#import "PictureTableViewCell.h"
#import "TTPicture.h"
#import "PictureCommentViewController.h"
#import "TTDataTool.h"
#import "TTPictureFetchDataParameter.h"
#import "TTConst.h"
#import "TTJudgeNetworking.h"

@interface PictureViewController ()<PictureTableViewCellDelegate>

//参数
@property (nonatomic, strong) NSMutableArray *pictureArray;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSString *maxtime;

//保存参数数组
@property (nonatomic, strong) NSDictionary *parameters;
//皮肤
@property (nonatomic, copy) NSString *currentSkinModel;

@end
static NSString * const PictureCell = @"PictureCell";

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBasic];
    [self setupTableView];
    [self setupMJRefreshHeader];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkinModel) name:SkinModelDidChangedNotification object:nil];
    [self updateSkinModel];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.navigationController.navigationBar.alpha = 1;
    
}

// 更新皮肤模式 接到模式切换的通知后会调用此方法
-(void)updateSkinModel {
    self.currentSkinModel = [[NSUserDefaults standardUserDefaults] stringForKey:CurrentSkinModelKey];
    if ([self.currentSkinModel isEqualToString:NightSkinModelValue]) {
        self.tableView.backgroundColor = [UIColor blackColor];
    } else {//日间模式
        self.tableView.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
    }
    [self.tableView reloadData];
}

- (void)setupBasic {
    self.currentPage = 0;
}


//TableView
- (void)setupTableView {
    
    //    适配，防止下拉刷新时navigation随着下拉位置变化
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController.navigationBar.frame) + 10, 0, 0, 0);
    
    self.view.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PictureTableViewCell class]) bundle:nil] forCellReuseIdentifier:PictureCell];
}

- (void)setupMJRefreshHeader {
    
    //    下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    //    显示菊花
    [self.tableView.mj_header beginRefreshing];
    //    下拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(LoadMoreData)];
}

//请求数据
- (void)LoadNewData {
    TTPictureFetchDataParameter *params = [[TTPictureFetchDataParameter alloc] init];
    TTPicture *firstPicture= self.pictureArray.firstObject;
    params.recentTime = firstPicture.created_at;
    params.page = 0;
    params.maxtime = nil;
    [TTDataTool pictureWithParameters:params success:^(NSArray *array, NSString *maxtime){
        self.maxtime = maxtime;
        self.pictureArray = [array mutableCopy];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        NSLog(@"%@%@",self,error);
    }];
    
}

//加载数据库中的数据
- (void)LoadMoreData {
    TTPictureFetchDataParameter *params= [[TTPictureFetchDataParameter alloc] init];
    TTPicture *lastPicture = self.pictureArray.lastObject;
    self.currentPage = self.currentPage+1;
    params.page = self.currentPage;
    params.remoteTime = lastPicture.created_at;
    params.maxtime = self.maxtime;
    [TTDataTool pictureWithParameters:params success:^(NSArray *array, NSString *maxtime){
        self.maxtime = maxtime;
        [self.pictureArray addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        self.currentPage = self.currentPage-1;
        NSLog(@"%@%@",self,error);
    }];
}

#pragma mark - Table view data source

//UITableViewDataSource 返回tableView有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//UITableViewDataSource 返回tableView每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pictureArray.count;
}


//UITableViewDataSource 返回indexPath对应的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PictureCell];
    if ([self.currentSkinModel isEqualToString:DaySkinModelValue]) {//日间模式
        [cell updateToDaySkinMode];
    } else {
        [cell updateToNightSkinMode];
    }
    cell.picture = self.pictureArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TTPicture *picture = self.pictureArray[indexPath.row];
    return picture.cellHeight;
}

//UITableViewDelegate 点击了某个cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushToVideoCommentViewControllerWithIndexPath:indexPath];
}

-(void)pushToVideoCommentViewControllerWithIndexPath:(NSIndexPath *)indexPath {
    PictureCommentViewController *viewController = [[PictureCommentViewController alloc] init];
    viewController.picture = self.pictureArray[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

//PictureTableViewCell代理 点击更多按钮
-(void)clickMoreButton:(TTPicture *)picture {
    UIAlertController *controller =  [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:nil]];
    [controller addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:nil]];
    [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

// PictureTableViewCell代理 点击评论按钮
-(void)clickCommentButton:(NSIndexPath *)indexPath {
    [self pushToVideoCommentViewControllerWithIndexPath:indexPath];
}

-(NSMutableArray *)pictureArray {
    if (!_pictureArray) {
        _pictureArray = [NSMutableArray array];
    }
    return _pictureArray;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.tableView.contentOffset.y>0) {
        self.navigationController.navigationBar.alpha = 0;
    } else {
        CGFloat yValue = - self.tableView.contentOffset.y;//纵向的差距
        CGFloat alphValue = yValue/self.tableView.contentInset.top;
        self.navigationController.navigationBar.alpha =alphValue;
    }
}

@end
