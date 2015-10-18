//
//  T1TableViewController.m
//  practice823
//
//  Created by aa64mac on 10/17/15.
//  Copyright © 2015 cyj. All rights reserved.
//

#import "T1TableViewController.h"

static const CGFloat kRowHeight = 80.0;

@interface T1TableViewController ()

- (UIButton *)buttonForThisSampleWithType: (UIButtonType)type;

@end

@implementation T1TableViewController

NSArray *dataSource_;
NSArray *buttons_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.rowHeight = kRowHeight;
    dataSource_ = @[@"Custom", @"RoundedRect", @"DetailDisclosure", @"InfoLight", @"InfoDark", @"ContactAdd"];
    UIButton *customButton = [self buttonForThisSampleWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"frame.png"];
    UIImage *stretchableImage = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    [customButton setBackgroundImage:stretchableImage forState:UIControlStateNormal];
    customButton.frame = CGRectMake(0, 0, 200, 60);
//    self.tableView.backgroundColor = [UIColor lightGrayColor];
    buttons_ = @[customButton, [self buttonForThisSampleWithType:UIButtonTypeRoundedRect],
                 customButton, [self buttonForThisSampleWithType:UIButtonTypeDetailDisclosure],
                 customButton, [self buttonForThisSampleWithType:UIButtonTypeInfoLight],
                 customButton, [self buttonForThisSampleWithType:UIButtonTypeInfoDark],
                 customButton, [self buttonForThisSampleWithType:UIButtonTypeContactAdd]
                 ];
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
    return [dataSource_ count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellStyleDefault";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellStyleDefault" forIndexPath:indexPath];
    cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
    UIButton *button = [buttons_ objectAtIndex:indexPath.row];
    button.frame = CGRectMake(cell.contentView.bounds.size.width - button.bounds.size.width - 20,
                              (kRowHeight - button.bounds.size.height) / 2,
                              button.bounds.size.width,
                              button.bounds.size.height);
    [cell.contentView addSubview:button];
    return cell;
}

- (UIButton *)buttonForThisSampleWithType:(UIButtonType)type {
    UIButton *button = [UIButton buttonWithType:type];
    [button setTitle:@"UIButton" forState:UIControlStateNormal];
    [button sizeToFit];
    return button;
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
