//
//  NSArray+FunctionalHelpers.m
//  NYTimes
//
//  Created by Steven Bishop on 1/19/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import "NSArray+FunctionalHelpers.h"

@implementation NSArray (FunctionalHelpers)

- (NSMutableArray*)mapWithBlock:(id (^)(id))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        id mapped = block(obj);

        if (mapped) {
            [result addObject:mapped];
        }
    }
    return result;
}
@end
