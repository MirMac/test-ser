//
//  RegistrationViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 09/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "RegistrationViewController.h"
#import "DetailUserFormViewController.h"

@interface RegistrationViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate>

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.modalVieew setHidden:TRUE];
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    
    
    [self formRegistration];
}

- (IBAction)PressRefine:(id)sender {
    if (_modalVieew.hidden) {
        _modalVieew.hidden = false;
    } else {
        _modalVieew.hidden = true;
    }
}

- (void) formRegistration {
    
    [_view2.layer setCornerRadius:8.0f];
    [_viewProfilePic.layer setCornerRadius:8.0f];
    
    [_btnRegister.layer setCornerRadius:4.0f];
    
    [_btnLoadImage setFont:[UIFont systemFontOfSize:11]];
    _btnLoadImage.textAlignment = NSTextAlignmentCenter;
    
    [_imgProfilo.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [_imgProfilo.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [_imgProfilo.layer setCornerRadius:4.0f];
    _imgProfilo.layer.borderWidth = 1.0f;
    
    [self textStylingForm:_inputNomeTitolare];
    [self textStylingForm:_inputTextNomePalestra];
    [self textStylingForm:_inputTextEmail];
    [self textStylingForm:_inputTextPassword];
    [self textStylingForm:_inputTextRepeatPassword];
    //    Nascondi password e cambio tastiera email già fatto da storyboard, possibile anche con codice
    
    _inputNomeTitolare.autocapitalizationType = UITextAutocapitalizationTypeWords;
    _inputTextNomePalestra.autocapitalizationType = UITextAutocapitalizationTypeWords;
    
    //    qui fa soltanto la prima lettera della prima parola maiuscola, il resto minuscolo
    //    _inputTextNomePalestra.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    
    _imgDefaulLogo.layer.masksToBounds = YES;
    //    in questo caso non funzina perchè l'immagine non è quadrata!
    _imgDefaulLogo.layer.cornerRadius = self.imgDefaulLogo.frame.size.width / 2;
    //    quindi diamo border fisso
    _imgDefaulLogo.layer.cornerRadius = 4;
    
    // Metodo che mette l'immagine adattandola al mio frame senza deformarla
    _imgDefaulLogo.contentMode = UIViewContentModeScaleAspectFill;
    
    // Metodo che prende la mia immagine scelta e la rimpicciolisce fino a farla entrare intera nel mio frame
    //    _imgDefaulLogo.contentMode = UIViewContentModeScaleAspectFit;
    
}

- (UITextField *)textStylingForm:(UITextField *)textField {
    
    [textField.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [textField.layer setCornerRadius:4.0f];
    textField.layer.borderWidth = 1.0f;
    textField.layer.sublayerTransform = CATransform3DMakeTranslation(10.0f, 0.0f, 0.0f);
    
    return textField;
}

- (CGRect)rectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 40, 3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionSheetButtonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose Image"
                                                                   message:@" By M.M."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Gallery"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed button one");
                                                              
                                                              [self selectPhoto:(UIButton *)sender];
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Camera"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               NSLog(@"You pressed button two");
                                                               
                                                               [self takePhoto:(id)sender];
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

- (IBAction) takePhoto:(id) sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    
    pickerController.delegate = self;
    pickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    pickerController.allowsEditing = YES;
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [_imgDefaulLogo setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self saveDataToUserDefaults:image ofType:@"jpg" forKey:@"123456789"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)saveDataToUserDefaults:(UIImage *)image ofType:(NSString *)extension forKey:(NSString *)key {
    
    NSData * profileImg;
    
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        profileImg = UIImagePNGRepresentation(image);
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"]) {
        profileImg = UIImageJPEGRepresentation(image, 1.0);
    }
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:profileImg forKey:@"123456789"];
    //    [userDefaults setObject:nome forKey:@"0000"];
    [userDefaults synchronize];
}

- (IBAction)Registrati:(id)sender {
    
    [self saveDataText:_inputNomeTitolare forKey:@"0000"];
    //    [self saveDataText:_inputTextNomePalestra forKey:@"0001"];
    //    [self saveDataText:_inputTextEmail forKey:@"0002"];
//    ciao
    NSLog(@"HAI PREMUTO REGISTRATI");
    
}

-(void)saveDataText:(UITextField *)text forKey:(NSString *)key{
    
    NSString * nome = _inputNomeTitolare.text;
    NSString * palestra = _inputTextNomePalestra.text;
    NSString * email = _inputTextEmail.text;
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nome forKey:@"0000"];
    [userDefaults setObject:palestra forKey:@"0001"];
    [userDefaults setObject:email forKey:@"0002"];
    [userDefaults synchronize];
    
    NSLog(@"STAMPO USERDEFAULT %@", userDefaults);
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
