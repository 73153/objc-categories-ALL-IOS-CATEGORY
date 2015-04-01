//
//  UINavigationController+PopWithDelay.m
//  Categories
//
//  Created by Benjamin Weidig on 5/14/12.
//  Copyright (c) 2012 section71. All rights reserved.
//

#import "UINavigationController+PopWithDelay.h"

@implementation UINavigationController (PopWithDelay)

- (void)popViewControllerAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay {

    [self performSelector:@selector(popViewControllerAnimated) withObject:nil afterDelay:delay];
}

- (void)popViewControllerAnimated {
    [self popViewControllerAnimated:YES];
}

@end
