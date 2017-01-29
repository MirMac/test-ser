//
//  CustomPinMapView.m
//  Test2Ser
//
//  Created by Mircea Macovei on 02/12/2016.
//  Copyright © 2016 Mircea Macovei. All rights reserved.
//

#import "CustomPinMapView.h"

@implementation CustomPinMapView

-(id) initWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle andCoordinates:(CLLocationCoordinate2D)coordinate andAlertMessage:(NSString *)alertMessage{
    
    self = [self init];
    
    self.strTitle = title;
    self.strSubtitle = subtitle;
    _coordinate = coordinate;
    _coordinates = coordinate;
    self.strAlertMessage = alertMessage;
    
    return self;
}

- (NSString *)title
{
    return self.strTitle;
}

-(NSString *)subtitle
{
    return self.strSubtitle;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.coordinates;
}

@end
