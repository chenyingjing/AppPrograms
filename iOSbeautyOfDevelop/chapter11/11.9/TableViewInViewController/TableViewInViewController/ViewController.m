//
//  ViewController.m
//  TableViewInViewController
//
//  Created by aa64mac on 9/3/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.radioListArray = @[@"CRI怀旧金曲", @"CRI轻松调频", @"CRI新闻广播", @"CRI劲歌FM88.7"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.radioListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"radio cell" forIndexPath:indexPath];
    cell.textLabel.text = self.radioListArray[indexPath.row];
    return cell;
}

@end
