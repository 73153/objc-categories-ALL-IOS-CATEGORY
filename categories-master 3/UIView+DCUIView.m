//
//  UIView+DCImageUtils.m
//  Loky
//
//  Created by Srikanth Sombhatla on 10/10/12.
//  Copyright (c) 2012 Kony. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+DCUIView.h"

@implementation UIView (DCUIView)

- (UIImage*) renderToImage {
    // Taken from http://stackoverflow.com/questions/4159596/make-a-uiimage-from-a-mkmapview
    // IMPORTANT: using weak link on UIKit
    if(UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(self.frame.size);
    }
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
