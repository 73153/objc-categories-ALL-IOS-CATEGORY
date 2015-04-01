//
//  UIApplication+AppDimensions.h
//  Categories
//
//  Created by Ben Weidig on 5/30/12.
//  Copyright (c) 2012 Section71. All rights reserved.
//
//  Originally from: http://stackoverflow.com/questions/7905432/how-to-get-orientation-dependent-height-and-width-of-the-screen
//  Get the size of the app dependend on the orientation

@interface UIApplication (AppDimensions)

// Returns the actual view size depending on the interface orientation
+ (CGSize)currentSize;

// Returns the size for a specific orientation
+ (CGSize)sizeInOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
