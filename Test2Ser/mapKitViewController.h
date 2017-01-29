//
//  mapKitViewController.h
//  Test2Ser
//
//  Created by Mircea Macovei on 26/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapKitViewController : UIViewController

// UI
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *viewWindow;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraints;

// Data
@property (nonatomic) CLLocationCoordinate2D userLocation;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;

@end
