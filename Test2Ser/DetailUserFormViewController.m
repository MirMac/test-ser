//
//  DetailUserFormViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 10/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "DetailUserFormViewController.h"
#import "RegistrationViewController.h"
#import "JsonObjects.h"
#import "AFNetworking.h"
#import "GalleryPhotoCollectionViewCell.h"
#define RADIANS(degrees) ((degrees * M_PI) / 180.0)
#import "JTSImageViewController.h"
#import "JTSImageInfo.h"

#import "mapKitViewController.h"
#import "CustomPinMapView.h"

//setti tag a ogni alert e li gestisci in un unico metodo
#define ALERT_CHOOSE_PHOTO 4;


@interface DetailUserFormViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate,MKMapViewDelegate, CLLocationManagerDelegate>

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

BOOL isAddPhoto;
BOOL isWobble;

@implementation DetailUserFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(makeRoundImage) withObject:nil afterDelay:0.3];
    [self performSelector:@selector(detailData) withObject:nil afterDelay:0.3];
    
    //    isAddPhoto = !isAddPhoto;
    
    [self setDataSource:[[NSMutableArray alloc]init]];
    [[self collectionView] setDelegate:self];
    [[self collectionView] setDataSource:self];
    
    UILongPressGestureRecognizer *lpgr
    = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.delegate = self;
    lpgr.delaysTouchesBegan = YES;
    [self.collectionView addGestureRecognizer:lpgr];
    
//    [self zoomOnUserLocation];
    [self detailData];
}

- (void)makeRoundImage
{
    NSData *test = [[NSUserDefaults standardUserDefaults]objectForKey:@"123456789"];
    
    [_imgProfileUser setImage:[UIImage imageWithData:test]];
    _imgProfileUser.layer.masksToBounds = YES;
    _imgProfileUser.layer.cornerRadius = self.imgProfileUser.frame.size.width/2;
}

- (void) detailData
{

    NSString *nome2 = [[NSUserDefaults standardUserDefaults]objectForKey:@"0000"];
    NSString *palestra = [[NSUserDefaults standardUserDefaults]objectForKey:@"0001"];
    NSString *email = [[NSUserDefaults standardUserDefaults]objectForKey:@"0002"];
    NSString *indirizzo = [[NSUserDefaults standardUserDefaults]objectForKey:@"0003"];
    NSString *telefono = [[NSUserDefaults standardUserDefaults]objectForKey:@"0004"];
    
    [_nome setText:nome2];
    _nome.textColor = [UIColor whiteColor];
    
    [_palestra setText:palestra];
    
    if(!_txtMail.text.length){
        [_txtMail setText:@"-"];
    }else{
        [_txtMail setText:email];
    }
    
    [_indirizzo setText:indirizzo];
    
    if(!_txtTelephone.text.length){
        [_txtTelephone setText:@"-"];
    }else{
        [_txtTelephone setText:telefono];
        
    }
    
    self.lblDescrizioneTxt.numberOfLines = 0;
    [self.lblDescrizioneTxt setText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam scelerisque, ipsum eget interdum lacinia, leo sapien tempus nisi, ut egestas leo sem quis purus. Morbi a orci et nibh pharetra venenatis."];
    
    [_imgCopertina setBackgroundColor:[UIColor lightGrayColor]];
    _btnCalendarioLezioni.layer.cornerRadius = 5;
    
    _lblSeparatorDesc.layer.borderWidth = 1.0;
    _lblSeparatorDesc.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _viewDescription.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _viewDescription.layer.borderWidth = 1.0;
    _viewDescription.layer.cornerRadius = 5;
    
    _viewSports.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _viewSports.layer.borderWidth = 1.0;
    _viewSports.layer.cornerRadius = 5;
    
}

// legato al button e mi da accesso alla galleria foto
- (IBAction)selectCoverPhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void) imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary<NSString *,id> *)editingInfo
{
    
    if(isAddPhoto){
        [[self dataSource]addObject:image];
        [[self collectionView] reloadData];
    } else {
        
        [_imgCopertina setImage:image];
        _imgCopertina.contentMode = UIViewContentModeScaleAspectFill;
        _imgCopertina.layer.masksToBounds = YES;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction) takePhoto:(id) sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    
    pickerController.delegate = self;
    pickerController.sourceType =  UIImagePickerControllerSourceTypeCamera;
    pickerController.allowsEditing = YES;
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (IBAction)actionSheetButtonPressed:(id)sender {
    
    if ([sender tag] == 1) {
        isAddPhoto = YES;
    }
    else{
        isAddPhoto = NO;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose Image"
                                                                   message:@" By M.M."
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Gallery"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              NSLog(@"You pressed button one");
                                                              
                                                              [self selectCoverPhoto:(UIButton *)sender];
                                                              
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


-(IBAction)tap:(id)sender {
    
    //goto new ViewController and set the image
    
    if (!_fullscreen) {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            //save previous frame
            _prevFrame = _imgProfileUser;
            [_imgProfileUser setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            _fullscreen = TRUE;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [_imgProfileUser setFrame:_prevFrame.frame];
        } completion:^(BOOL finished){
            _fullscreen = FALSE;
        }];
        return;
    }
}

- (IBAction)addPhoto:(id)sender {
    
    [self actionSheetButtonPressed:sender];
    
}

#pragma mark - collection view

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [[self dataSource]count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GalleryPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fotoID" forIndexPath:indexPath];
    
    UIImage *image = [[self dataSource]objectAtIndex:indexPath.row];
    
    cell.photoImage.layer.masksToBounds = YES;
    cell.photoImage.layer.cornerRadius = 12;
    
    [cell.photoImage setImage:image];
    
    return cell;
}

NSMutableArray *animatedCells;

//da sistemare puoi aggiungere boolean nel metodo sotto e il resto della logica da cestire nel metodo sopra della cella cosi le celle che non si vedono ballano comunque e sotto hai un metodo di due righe;

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        animatedCells = [NSMutableArray new];
        
        for (NSInteger row = 0; row < [_collectionView numberOfItemsInSection:0]; row++) {
            [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
            
            CGPoint p = [gestureRecognizer locationInView:self.collectionView];
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
            
            NSLog(@"STAMPO FOTO TOTALI INSERITE: %ld", row);
            
            //      setto a una nuova variabile di tipo NSIndexPath il mio valore di tipo NSInteger
            NSIndexPath *changedRow = [NSIndexPath
                                       indexPathForRow:row
                                       inSection:indexPath.section];
            
            NSLog(@"ENTRO IN IF");
            if (indexPath == nil){
                NSLog(@"couldn't find index path");
            } else {
                
                UICollectionViewCell* cell =
                [_collectionView cellForItemAtIndexPath:changedRow];
                
                CGAffineTransform leftWobble = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5.0));
                CGAffineTransform rightWobble = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5.0));
                
                cell.transform = leftWobble;
                
//                [gestureRecognizer setMinimumPressDuration:10];
                
                [UIView beginAnimations:@"wobble" context:(__bridge void * _Nullable)(cell)];
                [UIView setAnimationRepeatAutoreverses:YES];
                [UIView setAnimationBeginsFromCurrentState:YES];
                [UIView setAnimationRepeatCount:999999]; // adjustable
                [UIView setAnimationDuration:0.100];
                [UIView setAnimationDelegate:self];
            
                cell.transform = rightWobble; // end here & auto-reverse
                [UIView commitAnimations];
                
                [animatedCells addObject:cell];
            }
        }
        
        isWobble = YES;
        
    }else if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"FINE GESTURE RECOGNIZER");
    }

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(isWobble) {
        
        [_dataSource removeObjectAtIndex:indexPath.row];
        [_collectionView reloadData];
        
    }else{
        GalleryPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fotoID" forIndexPath:indexPath];
        
        UIImage *image = [[self dataSource] objectAtIndex:indexPath.row];
        
        //    [cell.photoImage setImage:nil];
        
        
        // Create image info
        
        CGRect cellRectInView = [_collectionView convertRect:cell.frame toView:self.view];
        
        
        JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
        imageInfo.image = image;
        imageInfo.referenceRect = cellRectInView;
        imageInfo.referenceView = self.view;
        
        // Setup view controller
        JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                               initWithImageInfo:imageInfo
                                               mode:JTSImageViewControllerMode_Image
                                               backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
        
        // Present the view controller.
        [imageViewer showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
        
        //    _collectionView.reloadData;
    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    for (UICollectionViewCell *cell in animatedCells) {
//        [cell.layer removeAllAnimations];
        cell.transform = CGAffineTransformIdentity;
    }
    
    isWobble = NO;
    
}
#pragma mark - HEX COLOR

//-(UIColor*)colorWithHexString:(NSString*)hex
//{
//    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
//
//    // String should be 6 or 8 characters
//    if ([cString length] < 6) return [UIColor grayColor];
//
//    // strip 0X if it appears
//    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
//
//    if ([cString length] != 6) return  [UIColor grayColor];
//
//    // Separate into r, g, b substrings
//    NSRange range;
//    range.location = 0;
//    range.length = 2;
//    NSString *rString = [cString substringWithRange:range];
//
//    range.location = 2;
//    NSString *gString = [cString substringWithRange:range];
//
//    range.location = 4;
//    NSString *bString = [cString substringWithRange:range];
//
//    // Scan values
//    unsigned int r, g, b;
//    [[NSScanner scannerWithString:rString] scanHexInt:&r];
//    [[NSScanner scannerWithString:gString] scanHexInt:&g];
//    [[NSScanner scannerWithString:bString] scanHexInt:&b];
//
//    return [UIColor colorWithRed:((float) r / 255.0f)
//                           green:((float) g / 255.0f)
//                            blue:((float) b / 255.0f)
//                           alpha:1.0f];
//}


#pragma mark - Web Services

//- (void)getDate
//{
//    // Chiamata a servizio attraverso AFNetworking
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    NSURL *URL = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/todos"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//
//            NSMutableArray *listaJson = [NSMutableArray new];
//
//            for (NSDictionary *item in responseObject) {
//
//                JsonObjects *obj = [JsonObjects new];
//
//                [obj setID:[[item valueForKey:@"id"] integerValue]];
//                [obj setTitle:[item valueForKey:@"title"]];
//
//                [listaJson addObject:obj];
//            }
//
//            self.arrListJson = listaJson;
//            // qui faccio il reload della tabella, dopo che è stata riempita.. altrimenti la vedo sempre vuota
//            [self.customTableJSON reloadData];
//        }
//    }];
//
//    [dataTask resume];
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
