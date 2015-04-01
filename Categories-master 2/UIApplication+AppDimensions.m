//
//  UIApplication+AppDimensions.m
//  Categories
//
//  Created by Ben Weidig on 5/30/12.
//  Copyright (c) 2012 Section71. All rights reserved.
//

#import "UIApplication+AppDimensions.h"


@implementation UIApplication (AppDimensions)

+ (CGSize)currentSize {

    return [UIApplication sizeInOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}


+ (CGSize)sizeInOrientation:(UIInterfaceOrientation)interfaceOrientation {

    CGSize size = UIScreen.mainScreen.bounds.size;
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation) == YES) {
        size = CGSizeMake(size.height, size.width);
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    if (app.statusBarHidden == NO) {
        size.height -= MIN(app.statusBarFrame.size.width, app.statusBarFrame.size.height);
    }
    
    return size;
}


@end
