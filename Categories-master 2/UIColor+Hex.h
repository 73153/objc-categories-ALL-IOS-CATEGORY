//
//  UIColor+Hex.h
//  Categories
//
//  Created by Benjamin Weidig on 4/7/12.
//  Copyright (c) 2012 section71. All rights reserved.
//


@interface UIColor (Hex)

// Get the UIColor from an integer like 0xAA03F2
+ (UIColor *)colorWithHex:(NSUInteger)hex;

// Creates an UIColor from an Hex NSString.
// Allowed Formats: #RRGGBB and RRGGBB
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
