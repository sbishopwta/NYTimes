//
//  Theme.m
//  NYTimes
//
//  Created by Steven Bishop on 1/18/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import "Theme.h"

@implementation Theme

+ (NSString *)date_monthDayYear:(NSDate *)date {
    static NSDateFormatter* formatter;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.dateStyle = NSDateFormatterMediumStyle;
    });

    return [formatter stringFromDate:date];
}

@end

@implementation UIFont (Helpers)

+ (UIFont *)georgiaFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"Georgia" size: size];
}

+ (UIFont *)primaryFont {
    return [UIFont fontWithName:@"Cheltenham" size: 20];
}

@end

@implementation UIColor (Helpers)

+ (UIColor *)primaryGrayColor {
    return [UIColor colorWithRed:92.0f / 255.0f green:92.0f / 255.0f blue:92.0f / 255.0f alpha:1.0f];
}

+ (UIColor *)primaryLightGrayColor {
    return [UIColor colorWithRed:247.0f / 255.0f green:247.0f / 255.0f blue:247.0f / 255.0f alpha:1.0f];
}

+ (UIColor *)primaryDarkGrayColor {
    return [UIColor colorWithRed:92.0f / 255.0f green:92.0f / 255.0f blue:92.0f / 255.0f alpha:1.0f];
}

@end

