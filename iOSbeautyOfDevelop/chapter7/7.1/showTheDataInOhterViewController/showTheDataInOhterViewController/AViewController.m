//
//  AViewController.m
//  showTheDataInOhterViewController
//
//  Created by aa64mac on 8/29/15.
//  Copyright (c) 2015 cc. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UILabel *labelA;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    BViewController *bViewController = [segue destinationViewController];
    if (bViewController) {
        //bViewController.labelB.text = self.textField1.text;
        //[bViewController.labelB setText:self.textField1.text];
        bViewController.textFromA = self.textField1.text;
    }
    //NSLog(@"%@", self.textField1.text);
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    NSLog(@"unwidsegue");
    BViewController *bViewController = segue.sourceViewController;
    if (bViewController) {
        self.labelA.text = bViewController.textFieldB.text;
    }
}

@end
