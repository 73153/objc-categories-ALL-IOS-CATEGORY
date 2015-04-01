//
//  NSObject+GodEraAdd.m
//  kissme
//
//  Created by sunyanliang on 13-9-20.
//  Copyright (c) 2013年 赵岩. All rights reserved.
//

#import "NSObject+GEJSON.h"

@implementation NSObject (GEJSON)

- (NSString*)JSONString
{
    NSError* error = nil;
    NSData* JSONData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"JSONString transferd error : %@",error.localizedDescription);
        return nil;
    }else{
        NSString* string = [[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding] autorelease];
        return string;
    }
}

@end
