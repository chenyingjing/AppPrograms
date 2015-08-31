//
//  RadioTableViewController.m
//  TableView1
//
//  Created by aa64mac on 8/30/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "RadioTableViewController.h"
#import "RadioTableViewCell.h"

@interface RadioTableViewController ()

@end

@implementation RadioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.radioListArray = @[@"CRI怀旧金曲", @"CRI轻松调频", @"CRI新闻广播", @"CRI劲歌FM88.7"];
    self.radioEnglishArray = @[@"CRI Oldies Online", @"CRI Easy FM", @"CRI News Radio", @"CRI HIT FM 88.7"];
    self.radioImages = @[@"CRI_Oldies_OnLine.png", @"CRI_EasyFM.png", @"CRI_NewsRadio.png", @"CRI_HIT_FM88.7.png"];
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
    return [self.radioListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RadioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RADIO_LIST_CELL" forIndexPath:indexPath];
    
    //cell.textLabel.text = [self.radioListArray objectAtIndex:indexPath.row];
//    cell.textLabel.text = self.radioListArray[indexPath.row];
//    
//    cell.imageView.image = [UIImage imageNamed:self.radioImages[indexPath.row]];
    
    cell.logoImageView.image = [UIImage imageNamed:self.radioImages[indexPath.row]];
    
    cell.mainTitleLabel.text = self.radioListArray[indexPath.row];
    
    cell.subTitleLabel.text = self.radioEnglishArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *radioName = self.radioListArray[indexPath.row];
    NSString *alertMsg = [NSString stringWithFormat:@"你已经选择了：%@", radioName];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"选择某行后的提示框"
                                                           message:alertMsg
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles: nil];
    [messageAlert show];
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
