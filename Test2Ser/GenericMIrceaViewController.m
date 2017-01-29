//
//  GenericMIrceaViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 15/01/2017.
//  Copyright © 2017 Mircea Macovei. All rights reserved.
//

#import "GenericMIrceaViewController.h"

@interface GenericMIrceaViewController ()

@end

@implementation GenericMIrceaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSheetButtonPressed:(id)sender {
    
    //    if ([sender tag] == 1) {
    //        isAddPhoto = YES;
    //    }
    //    else{
    //        isAddPhoto = NO;
    //    }
    //
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose Image"
                                                                   message:@" By M.M."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Gallery"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed button one");
                                                              
//                                                              [self selectCoverPhoto:(UIButton *)sender];
                                                              
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Camera"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               NSLog(@"You pressed button two");
                                                               
//                                                               [self takePhoto:(id)sender];
                                                           }];
    
    UIAlertAction* thirdAction = [UIAlertAction
                                  actionWithTitle:@"Cancel"
                                  style:UIAlertActionStyleCancel
                                  handler:^(UIAlertAction * action)
                                  {
                                      //  UIAlertController will automatically dismiss the view
                                  }];
    
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [alert addAction:thirdAction];
    
    [self presentViewController:alert animated:YES completion:nil];
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
