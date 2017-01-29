//
//  RegistrationViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 09/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *imgProfilo;
@property (weak, nonatomic) IBOutlet UIImageView *imgDefaulLogo;
@property (weak, nonatomic) IBOutlet UILabel *btnLoadImage;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@property (weak, nonatomic) IBOutlet UITextField *inputNomeTitolare;
@property (weak, nonatomic) IBOutlet UITextField *inputTextNomePalestra;
@property (weak, nonatomic) IBOutlet UITextField *inputTextEmail;
@property (weak, nonatomic) IBOutlet UITextField *inputTextPassword;
@property (weak, nonatomic) IBOutlet UITextField *inputTextRepeatPassword;
@property (weak, nonatomic) IBOutlet UIView *viewProfilePic;
@property (weak, nonatomic) IBOutlet UIView *modalVieew;

@end
