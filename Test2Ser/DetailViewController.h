//
//  DetailViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 21/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *dicElements;
@property (strong, nonatomic) NSArray *arrListJson;
@property (weak, nonatomic) IBOutlet UITableView *customTableJSON;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIView *header;

@end
