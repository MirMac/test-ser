//
//  CustomPinMapView.h
//  Test2Ser
//
//  Created by Mircea Macovei on 02/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomPinMapView : NSObject <MKAnnotation>{
    CLLocationCoordinate2D _coordinate;
}

@property( nonatomic, readonly) CLLocationCoordinate2D coordinates;
@property( nonatomic, strong) NSString *strTitle;
@property( nonatomic, strong) NSString *strSubtitle;
@property( nonatomic, strong) NSString *strAlertMessage;

-(id) initWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle andCoordinates:(CLLocationCoordinate2D)coordinate andAlertMessage:(NSString *)alertMessage;

@end
