//
//  NSArray+FunctionalHelpers.h
//  NYTimes
//
//  Created by Steven Bishop on 1/19/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FunctionalHelpers)
- (NSMutableArray*)mapWithBlock:(id (^)(id))block;

@end
