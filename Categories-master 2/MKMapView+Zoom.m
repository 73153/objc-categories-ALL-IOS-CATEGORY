//
//  MKMapView+Zoom.m
//  Categories
//
//  Created by Ben Weidig on 5/14/12.
//  Copyright (c) 2012 Section71. All rights reserved.
//

#import "MKMapView+Zoom.h"

@implementation MKMapView (Zoom)

- (void)zoomToLocation:(CLLocation *)location minDiameter:(NSInteger)minDiameter animated:(BOOL)animated {
    
    double diameter = location.horizontalAccuracy;
    
    if (diameter < minDiameter) {
        diameter = minDiameter;
    }
    
    CLLocationDegrees spanInDegrees = (CLLocationDegrees) (diameter / 222240.0);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(spanInDegrees, spanInDegrees) ;
    CLLocationCoordinate2D coordinate = location.coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);

    [self setCenterCoordinate:location.coordinate animated:animated];
    [self setRegion:region animated:animated];
}

@end
