//
//  ClassicalCollectionViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/28.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ClassicalCollectionViewController.h"
#import "ClassicalCollectionViewCell.h"
#import "MJRefresh.h"
#import "HonourVcManager.h"
#import "ClassicalModel.h"
#import "UIImageView+WebCache.h"
#import "WebViewController.h"

@interface ClassicalCollectionViewController ()
{
    int page;
    int totalPage;
}
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ClassicalCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.minimumLineSpacing = 1;
//    flowLayout.minimumInteritemSpacing = 0;
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    // Register cell classes
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.frame = self.view.bounds;
    [self.collectionView registerClass:[ClassicalCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self setupHeaderRefresh];
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)setupHeaderRefresh{
    [self.collectionView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    [self.collectionView.header beginRefreshing];
}

- (void)setupFooterRefresh{
    [self.collectionView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
}

- (void)headerRefreshing{
    if (self.collectionView.footer.state == MJRefreshFooterStateNoMoreData) {
        [self.collectionView.footer resetNoMoreData];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self getdata];
        
        if ([self.collectionView.header isRefreshing]) {
            [self.collectionView.header endRefreshing];
        }
    });
    
}

- (void)getdata{
    page = 1;
    [HonourVcManager postWithLoginNameStr:@"1" password:@"18" FWD:@"HYXK00020" success:^(id json) {
        [self.dataArray removeAllObjects];
        page++;
        NSArray *listArray = [[json objectForKey:@"data"] objectForKey:@"list"];
        totalPage = [[[json objectForKey:@"data"] objectForKey:@"totalPage"] intValue];
        for (NSDictionary *dict in listArray) {
            [self.dataArray addObject:[[ClassicalModel alloc] initWithDict:dict]];
        }
        [self.collectionView reloadData];
        [self.collectionView.header endRefreshing];
        [self setupFooterRefresh];
    } fail:^{
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"连接失败"];
        [self.view addSubview:message];
    }];

}

- (void)footerRefreshing{
    if (page > totalPage) {
        [self.collectionView.footer noticeNoMoreData];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self getMoreData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        if ([self.collectionView.footer isRefreshing]) {
            [self.collectionView.footer endRefreshing];
        }
    });
}

- (void)getMoreData{
    [HonourVcManager postWithLoginNameStr:[NSString stringWithFormat:@"%d",page] password:@"18" FWD:@"HYXK00004" success:^(id json) {
        page++;
        NSArray *listArray = [[json objectForKey:@"data"] objectForKey:@"list"];
        for (NSDictionary *dict in listArray) {
            [self.dataArray addObject:[[ClassicalModel alloc] initWithDict:dict]];
        }
        [self.collectionView reloadData];
        [self.collectionView.footer endRefreshing];
    } fail:^{
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"连接失败"];
        [self.view addSubview:message];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    ClassicalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    ClassicalModel *model = self.dataArray[indexPath.row];
    [cell imgViewSet];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    
    // Configure the cell
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((WIDTH ) / 3 - 2, 70);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"deselected");
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ClassicalModel *model = self.dataArray[indexPath.row];
    WebViewController *webVc = [[WebViewController alloc] initWithPath:model.path];
    [self.navigationController pushViewController:webVc animated:YES];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
