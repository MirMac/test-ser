//
//  DetailOfJsonListViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 04/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonObjects.h"

@interface DetailOfJsonListViewController : UIViewController

// tutte quelle che iniziano con UI sono spesso IBoutlet(Interface builder outlet)
@property (weak, nonatomic) IBOutlet UILabel *lblUserId;
@property (weak, nonatomic) IBOutlet UILabel *lblSecondId;
@property (weak, nonatomic) IBOutlet UILabel *lblCompleted;
@property (weak, nonatomic) IBOutlet UILabel *lblUserTitle;

// Data
@property(strong, nonatomic) JsonObjects *jsonList;

@end
