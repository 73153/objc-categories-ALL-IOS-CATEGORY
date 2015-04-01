//
//  UINavigationController+FixKeyboardDismiss.h
//  Categories
//
//  Created by Ben Weidig on 6/27/12.
//  Copyright (c) 2012 Section71. All rights reserved.
//
//  Fixes the non-dismissable keyboard in a modal view controller
//  with presentation style FormSheet when you use a NavController
//  and can't override - (BOOL)disablesAutomaticKeyboardDismissal
//  See http://stackoverflow.com/questions/3372333/ipad-keyboard-will-not-dismiss-if-modal-view-controller-presentation-style-is-ui

@interface UINavigationController (FixKeyboardDismiss)

// Allows dismissal of the keyboard
- (BOOL)disablesAutomaticKeyboardDismissal;

@end
