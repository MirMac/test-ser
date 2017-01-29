//
//  ExampleViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 15/01/2017.
//  Copyright © 2017 Mircea Macovei. All rights reserved.
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [GenericMIrceaViewController piu];
//    [[[GenericMIrceaViewController alloc]init]meno];
    
    [self actionSheetButtonPressed:nil];
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
