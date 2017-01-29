//
//  DetailOfJsonListViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 04/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "DetailOfJsonListViewController.h"
#import "JsonObjects.h"

@interface DetailOfJsonListViewController ()

@end

@implementation DetailOfJsonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setdata];
}

- (void) setdata {
    
    [_lblUserId setText:[NSString stringWithFormat:@"%li", (long)_jsonList.ID]];
    [_lblSecondId setText:[NSString stringWithFormat:@"%li", (long)_jsonList.SecondId]];
    [self.lblUserTitle setText:_jsonList.Title];
    [_lblUserTitle setTextColor:[UIColor blueColor]];
    
    // cambio font e size tel titolo
    [_lblUserTitle setFont:[UIFont fontWithName:@"AmericanTypewriter-CondensedLight" size:25]];
    [_lblCompleted setText:@"Macovei Mircea Macovei Mircea Macovei Mircea Macovei Mircea Macovei Mircea "];
    
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
