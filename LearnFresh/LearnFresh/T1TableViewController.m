//
//  T1TableViewController.m
//  LearnFresh
//
//  Created by aa64mac on 5/3/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "T1TableViewController.h"
#import "MJRefresh.h"
#import "MyCellTableViewCell.h"

static const CGFloat MJDuration = 2.0;

@interface T1TableViewController ()

@property NSMutableArray *cellData;

@end

@implementation T1TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.cellData = [NSMutableArray array];
    [self.cellData addObject:@"1"];
    [self.cellData addObject:@"2"];
    [self.cellData addObject:@"3"];
    [self.cellData addObject:@"4"];

    __weak typeof(self) weakSelf = self;

    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    
//    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)loadMoreData {
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    [self.cellData addObject:@"4"];
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.footer endRefreshing];
        //[self.tableView.footer noticeNoMoreData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    NSString *fileURL = @"http://192.168.1.6/iis-85.png";
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    cell.bigimage1.image = [UIImage imageWithData:data];
    NSString *fileURL1 = @"http://192.168.1.6/iis-85_1.png";
    NSData * data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL1]];
    cell.bigimage2.image = [UIImage imageWithData:data1];
    //cell.textLabel.text = self.cellData[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
