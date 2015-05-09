//
//  T1TableViewController.m
//  TableviewIndex
//
//  Created by aa64mac on 5/9/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "T1TableViewController.h"

@interface T1TableViewController ()

@property NSMutableArray *sectionArray;

@property NSMutableArray *dataArray1;
@property NSMutableArray *dataArray2;
@property NSMutableArray *dataArray3;

@end

@implementation T1TableViewController

@synthesize sectionArray;
@synthesize dataArray1;
@synthesize dataArray2;
@synthesize dataArray3;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataArray1 = [NSMutableArray arrayWithObjects:@"data11",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  @"data12",
                  nil];
    dataArray2 = [NSMutableArray arrayWithObjects:@"data21",
                  @"data22",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  @"data23",
                  nil];
    dataArray3 = [NSMutableArray arrayWithObjects:@"data31",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  @"data33",
                  nil];
    sectionArray = [NSMutableArray arrayWithObjects:dataArray1,
                    dataArray2,
                    dataArray3,
                    nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sectionArray[section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
    return [NSString stringWithFormat:@"section %ld", section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{
    return @[@"0", @"1", @"2"];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index

{
    //return [sectionArray indexOfObject:title];
    return index;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.textLabel.text = sectionArray[indexPath.section][indexPath.row];
    
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
