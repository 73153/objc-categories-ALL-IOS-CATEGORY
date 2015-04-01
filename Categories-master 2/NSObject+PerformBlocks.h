//
//  NSObject+PerformBlockss.m
//  Categories
//
//  Created by Benjamin Weidig on 3/29/12.
//  Copyright (c) 2012 section71. All rights reserved.
//

@interface NSObject (PerformBlocks)

- (void)performBlock:(void (^)(void))block;
- (void)performBlock:(void (^)(void))block  afterDelay:(NSTimeInterval)delay;

- (void)performBlockInBackground:(void (^)(void))block;

@end