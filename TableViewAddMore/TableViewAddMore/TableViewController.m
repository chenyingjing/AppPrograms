//
//  TableViewController.m
//  TableViewAddMore
//
//  Created by aa64mac on 4/28/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()



@end

@implementation TableViewController

NSInteger rowNum = 10;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return rowNum;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell1" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    CGFloat currentY = scrollView.contentOffset.y;
    //NSLog(@"scrollViewWillBeginDragging y=%f", currentY);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat currentY = scrollView.contentOffset.y;
    //NSLog(@"scrollViewDidEndDragging y=%f", currentY);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    CGFloat currentY = scrollView.contentOffset.y;
    //NSLog(@"scrollViewWillBeginDecelerating y=%f", currentY);
    
    NSLog(@"Get more data.");
    
    
    NSArray *insertIndexPaths = [NSArray arrayWithObjects:
                                 
                                 [NSIndexPath indexPathForRow:rowNum inSection:0],
                                 
                                 [NSIndexPath indexPathForRow:rowNum + 1 inSection:0],
                                 
                                 [NSIndexPath indexPathForRow:rowNum + 2 inSection:0],
                                 
                                 nil];
    rowNum += 3;
    UITableView *tv = (UITableView *)self.view;
    
    
    
    [tv beginUpdates];
    
    [tv insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationBottom];
    
    
    [tv endUpdates];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat currentY = scrollView.contentOffset.y;
    //NSLog(@"scrollViewDidScroll y=%f", currentY);
    static CGFloat lastY = 0;
    static CGFloat lastlastY = 0;
    if (currentY > 0 && currentY < lastY && lastlastY < lastY) {

//        NSLog(@"Get more data.");
//        
//
//        NSArray *insertIndexPaths = [NSArray arrayWithObjects:
//                                     
//                                     [NSIndexPath indexPathForRow:rowNum inSection:0],
//                                     
//                                     [NSIndexPath indexPathForRow:rowNum + 1 inSection:0],
//                                     
//                                     [NSIndexPath indexPathForRow:rowNum + 2 inSection:0],
//                                     
//                                     nil];
//        rowNum += 3;
//        UITableView *tv = (UITableView *)self.view;
//        
//        
//        
//        [tv beginUpdates];
//        
//        [tv insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationBottom];
//        
//        
//        [tv endUpdates];
    }
    lastlastY = lastY;
    lastY = currentY;
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
