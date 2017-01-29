//
//  mapKitViewController.m
//  Test2Ser
//
//  Created by Mircea Macovei on 26/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "mapKitViewController.h"
#import "CustomPinMapView.h"

@interface mapKitViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
 
@end

@implementation mapKitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initMap];
    [self.label setText:@""];
    [self.label setHidden:YES];
    [self.constraints setConstant:0];
}

# pragma mark - SHOW & Hide The View 

- (void)hideViewWindow
{
    [self.constraints setConstant:0];
    [self.label setHidden:YES];
    [self.label setText:@""];

    [UIView animateWithDuration:0.3f animations:^{
        
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showViewWindow:(NSString *)msgLabel
{
    [self.constraints setConstant:114];
    [self.label setHidden:NO];
    [self.label setText:msgLabel];

    [UIView animateWithDuration:0.3f animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
 
    }];
}

# pragma mark - MAP

- (void)initMap
{
    self.mapView.showsUserLocation = YES;
    self.mapView.zoomEnabled = YES;
    self.mapView.scrollEnabled = YES;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    if( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined ){
        
        if( [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)] ){
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
    
    [self.locationManager startUpdatingLocation];
}

- (void)stopLocationManager
{
    [self.locationManager stopUpdatingLocation];
}

- (void)zoomOnUserLocation
{
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = self.userLocation.latitude;
    region.center.longitude = self.userLocation.longitude;
    region.span.latitudeDelta = 0.05;
    region.span.longitudeDelta = 0.05;
    
    [self.mapView setRegion: region animated:YES];
}

# pragma mark MAP DELEGATE

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *location = locations.lastObject;
    self.userLocation = location.coordinate;
    
    if(CLLocationCoordinate2DIsValid(self.userLocation)){
        if( self.userLocation.latitude != 0.0 && self.userLocation.longitude != 0.0 ){
            [self stopLocationManager];
            [self zoomOnUserLocation];
        }
    }
    
    CustomPinMapView *firstPin =[[CustomPinMapView alloc] initWithTitle:@"content" andSubtitle:@"first alert!" andCoordinates:CLLocationCoordinate2DMake(41.926642, 12.572508) andAlertMessage:@"content of my alert"];
    
    CustomPinMapView *thirdPin = [[CustomPinMapView alloc] initWithTitle:@"Mircea" andSubtitle:@"Subtitle" andCoordinates:CLLocationCoordinate2DMake(41.925147, 12.573301) andAlertMessage:@" content of my second alert!"];
    
    NSArray *arr = [NSArray arrayWithObjects:firstPin, thirdPin, nil];

    [self.mapView addAnnotations:arr];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *imagePinView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    
    if( imagePinView == nil ){
        imagePinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
        imagePinView.canShowCallout = YES;
    }
    
    if( [annotation isKindOfClass:[CustomPinMapView class]] ){
        imagePinView.image = [UIImage imageNamed:@"pin2"];
    }
    else {
        imagePinView.image = [UIImage imageNamed:@"pin"];
    }
    return imagePinView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    id<MKAnnotation> annotation = [view annotation];
   
    if( [annotation isKindOfClass:[CustomPinMapView class]] ){

        CustomPinMapView *customMessage = (CustomPinMapView *)annotation;
        NSString *strMessage = [customMessage strAlertMessage];

        [self showViewWindow:strMessage];
    }
    else{
        
        [self showViewWindow:@"YOU ARE HERE"];
    }
}

-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    [self hideViewWindow];
}


-(void) showAlertWithMessage:(NSString *)alertMessage
{
    UIAlertController *myAlert = [UIAlertController alertControllerWithTitle:@"Alert Title" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes, please"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"No, thanks"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
    
    [myAlert addAction:yesButton];
    [myAlert addAction:noButton];
    
    [self presentViewController:myAlert animated:YES completion:nil];
}

@end
