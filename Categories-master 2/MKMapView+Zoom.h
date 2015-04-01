//
//  MKMapView+Zoom.h
//  Categories
//
//  Created by Ben Weidig on 5/14/12.
//  Copyright (c) 2012 Section71. All rights reserved.
//
//  Extends MKMapView so you can zoom to a location while still showing a specified diameter
//
//  Originally from: http://stackoverflow.com/questions/5854698/mapview-regionthatfits-set-using-horizontalaccuracy


@interface MKMapView (Zoom)

- (void)zoomToLocation:(CLLocation *)location minDiameter:(NSInteger)minDiameter animated:(BOOL)animated;

@end
