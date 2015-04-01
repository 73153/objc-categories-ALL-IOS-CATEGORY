//
//  UIColor+Hex.m
//  Categories
//
//  Created by Benjamin Weidig on 4/7/12.
//  Copyright (c) 2012 section71. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(NSUInteger)hex {

    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0 alpha:1.0];

}
   
   
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    
    // Remove a possible prefix
    NSString *cleanHexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
	// Only (#)RRGGBB is supported for now
	if (cleanHexString.length != 6) return nil;
    
	// Separate into red, green, blue substrings
	NSRange range;
	range.location = 0;
	range.length = 2;
	NSString *redString = [cleanHexString substringWithRange:range];
    
	range.location = 2;
	NSString *greenString = [cleanHexString substringWithRange:range];
    
	range.location = 4;
	NSString *blueString = [cleanHexString substringWithRange:range];
    
	// Get values as integer
	unsigned int red, green, blue;
	[[NSScanner scannerWithString:redString] scanHexInt:&red];
	[[NSScanner scannerWithString:greenString] scanHexInt:&green];
	[[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
	return [UIColor colorWithRed:((float)red / 255.0f)
						   green:((float)green / 255.0f)
							blue:((float)blue / 255.0f)
						   alpha:1.0f];
}
   
@end
