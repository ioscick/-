//
//  IntruduceViewController.m
//  鸿雁重构
//
//  Created by shenliping on 16/3/24.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "IntruduceViewController.h"
#import "HonourTableViewCell.h"
#import "MJRefresh.h"
#import "HonourVcManager.h"
#import "HonourModel.h"

@interface IntruduceViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    int page;
    int totalPage;
}
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation IntruduceViewController

- (void)viewWillAppear:(BOOL)animated{
    self.title = @"企业荣誉";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self setupHeaderRefresh];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)setupHeaderRefresh{
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    [self.tableView.header beginRefreshing];
}

- (void)setupFooterRefresh{
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
}

- (void)headerRefreshing{
    if (self.tableView.footer.state == MJRefreshFooterStateNoMoreData) {
        [self.tableView.footer resetNoMoreData];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self getdata];
        if ([self.tableView.header isRefreshing]) {
            [self.tableView.header endRefreshing];
        }
        
    });
    
}

- (void)getdata{
    page = 1;
    [HonourVcManager postWithLoginNameStr:@"1" password:@"10" FWD:@"HYXK00004" success:^(id json) {
        [self.dataArray removeAllObjects];
        page++;
        NSArray *listArray = [[json objectForKey:@"data"] objectForKey:@"list"];
        totalPage = [[[json objectForKey:@"data"] objectForKey:@"totalPage"] intValue];
        for (NSDictionary *dict in listArray) {
            HonourModel *model = [[HonourModel alloc] initWithDict:dict];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
        [self setupFooterRefresh];
    } fail:^{
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"连接失败"];
        [self.view addSubview:message];
    }];
}

- (void)footerRefreshing{
    if (page > totalPage) {
        [self.tableView.footer noticeNoMoreData];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self getMoreData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        if ([self.tableView.footer isRefreshing]) {
            [self.tableView.footer endRefreshing];
        }
        
    });
}

- (void)getMoreData{
    [HonourVcManager postWithLoginNameStr:[NSString stringWithFormat:@"%d",page] password:@"10" FWD:@"HYXK00004" success:^(id json) {
        page++;
        NSArray *listArray = [[json objectForKey:@"data"] objectForKey:@"list"];
        for (NSDictionary *dict in listArray) {
            HonourModel *model = [[HonourModel alloc] initWithDict:dict];
            [self.dataArray addObject:model];
        }
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    } fail:^{
        MessageView *message = [[MessageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 100, MainHIGHT / 2 - 30, 200, 60) Text:@"连接失败"];
        [self.view addSubview:message];
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HonourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HONOURCELL"];
    if (!cell) {
        cell = [[HonourTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HONOURCELL"];
    }
    HonourModel *model = self.dataArray[indexPath.row];
    cell.timeLabel.text = model.honor_date;
    cell.titleLabel.text = model.introduction;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

@end
