//
//  SettingsDetailViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 20/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "SettingsDetailViewController.h"
#import "DetailUserFormViewController.h"

@interface SettingsDetailViewController ()

@end

@implementation SettingsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(makeRoundImage) withObject:nil afterDelay:0.3];
    
    [self detailUser];
}

- (IBAction)btnAnnulla:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)makeRoundImage
{
    NSData *test = [[NSUserDefaults standardUserDefaults]objectForKey:@"123456789"];
    
    [_imgOld setImage:[UIImage imageWithData:test]];
    
}

-(void) detailUser{
    
    NSString *nomeTitolare = [[NSUserDefaults standardUserDefaults]objectForKey:@"0000"];
    NSString *indirizzo = [[NSUserDefaults standardUserDefaults]objectForKey:@"0003"];
    NSString *mail = [[NSUserDefaults standardUserDefaults]objectForKey:@"0002"];
    NSString *telefono = [[NSUserDefaults standardUserDefaults]objectForKey:@"0004"];
    
    [_lblNomeTitolare setPlaceholder:nomeTitolare];
    [_lblIndirizzo setPlaceholder:indirizzo];
    [_lblMail setPlaceholder:mail];
    [_lblTelefono setPlaceholder:telefono];
}

//- (IBAction)btnSalva:(id)sender {

//    [self saveDataProfile:_lblNomeTitolare forKey:@"0000"];
//    [self saveDataProfile:_lblIndirizzo forKey:@"0003"];
//    [self saveDataProfile:_lblMail forKey:@"0002"];
//    
//    NSLog(@"%@ nome titolare: ", _lblNomeTitolare.text);
//}

//- (void)saveDataProfile:(UITextField *)text forKey:(NSString *)key{

//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
//    [userDefaults setObject:_lblNomeTitolare.text forKey:@"0000"];
//    [userDefaults setObject:_lblIndirizzo.text forKey:@"0003"];
//    [userDefaults setObject:_lblMail.text forKey:@"0002"];
    
//}

#pragma mark - SEGUE

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToDetail2"]) {
   
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        
        if(!_lblNomeTitolare.text.length)
        {
            NSLog(@"NOME VUOTO");
            [userDefaults setObject:_lblNomeTitolare.placeholder forKey:@"0000"];
        }else{
            [userDefaults setObject:_lblNomeTitolare.text forKey:@"0000"];
            NSLog(@"NOME COMPLETATO");
        }
        
        if(!_lblIndirizzo.text.length)
        {
            [userDefaults setObject:_lblIndirizzo.placeholder forKey:@"0003"];
        }else{
            [userDefaults setObject:_lblIndirizzo.text forKey:@"0003"];
        }
        
        if(!_lblMail.text.length)
        {
            [userDefaults setObject:_lblMail.placeholder forKey:@"0002"];
        }else{
            [userDefaults setObject:_lblMail.text forKey:@"0002"];
        }
        
        if(!_lblTelefono.text.length)
        {
            [userDefaults setObject:_lblTelefono.placeholder forKey:@"0004"];
        }else{
            [userDefaults setObject:_lblTelefono.text forKey:@"0004"];
        }
    }
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
