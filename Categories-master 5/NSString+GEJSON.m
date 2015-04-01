//
//  NSString+GodEraAdd.m
//  kissme
//
//  Created by sunyanliang on 13-9-20.
//  Copyright (c) 2013年 赵岩. All rights reserved.
//

#import "NSString+GEJSON.h"

@implementation NSString (GEJSON)

- (id)JSONObject
{
    NSData* JSONData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error = nil;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"JSONObject transferd error : %@",error.localizedDescription);
        return nil;
    }else{
        return JSONObject;
    }
}

@end
