//
//  NSObject+PerformBlocks.m
//  Categories
//
//  Created by Benjamin Weidig on 3/29/12.
//  Copyright (c) 2012 section71. All rights reserved.
//

#import "NSObject+PerformBlocks.h"

@implementation NSObject (PerformBlocks)

- (void)performBlock:(void (^)(void))block {
	[self internal_runBlock:block];
}

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay  {

    [self performSelector:@selector(internal_runBlock:) 
               withObject:block 
               afterDelay:delay];
}

- (void)performBlockInBackground:(void (^)(void))block {

	[self performSelectorInBackground:@selector(internal_runBlock:) 
           withObject:block];
}

- (void)internal_runBlock:(void (^)(void))block {
    block();
}

@end
