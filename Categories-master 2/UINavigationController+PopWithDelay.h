//
//  UINavigationController+PopWithDelay.m
//  Categories
//
//  Created by Benjamin Weidig on 5/14/12.
//  Copyright (c) 2012 section71. All rights reserved.
//
//  Pops the current ViewController on the navigation stack after a delay.
//  E.g. useful to show the checkmark selection in an UITableView.

@interface UINavigationController (PopWithDelay)

- (void)popViewControllerAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
