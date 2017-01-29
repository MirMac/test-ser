//
//  SettingsDetailViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 20/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *lblNomeTitolare;
@property (weak, nonatomic) IBOutlet UITextField *lblIndirizzo;
@property (weak, nonatomic) IBOutlet UITextField *lblMail;
@property (weak, nonatomic) IBOutlet UITextField *lblTelefono;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnAnnulla;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnSalva;

@property (weak, nonatomic) IBOutlet UIImageView *imgOld;

@end
