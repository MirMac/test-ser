//
//  DetailUserFormViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 10/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
//#import "JsonObjects.h"

@interface DetailUserFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgProfileUser;
@property (strong, nonatomic) IBOutlet UIView *nomeTitolare;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *palestra;
//@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UITextView *txtMail;
@property (weak, nonatomic) IBOutlet UITextView *txtTelephone;
@property (weak, nonatomic) IBOutlet UILabel *indirizzo;
//@property (weak, nonatomic) IBOutlet UILabel *lblTelefono;
//@property (weak, nonatomic) IBOutlet MKMapView *myMap;
@property (weak, nonatomic) IBOutlet UIImageView *imgFullScreen;

@property (weak, nonatomic) IBOutlet UIImageView *imgCopertina;
@property (weak, nonatomic) IBOutlet UIButton *btnCalendarioLezioni;
@property (weak, nonatomic) IBOutlet UIView *viewDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblSeparatorDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblDescrizioneTxt;
@property (weak, nonatomic) IBOutlet UIView *viewSports;
@property (weak, nonatomic) IBOutlet UIButton *btnCoverPhoto;
@property(nonatomic, getter=isFullscreen) BOOL fullscreen;

@property (weak, nonatomic) IBOutlet UIImageView *prevFrame;
@property (weak, nonatomic) IBOutlet UIView *viewAnteprima;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


//@property (nonatomic, strong) CLLocationManager *locationManager;
//@property (nonatomic) CLLocationCoordinate2D userLocation;
//@property (strong, nonatomic) NSString *dataUpdate;


//@property (strong, nonatomic) NSArray *arrListJson;
//@property (weak, nonatomic) IBOutlet UITableView *customTableJSON;
//@property(strong, nonatomic) JsonObjects *jsonList;

@end
