//
//  Theme.h
//  NYTimes
//
//  Created by Steven Bishop on 1/18/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Theme : NSObject

+ (NSString *)date_monthDayYear:(NSDate *)date;

@end


@interface UIFont (Helpers)

+ (UIFont *)primaryFont;
+ (UIFont *)georgiaFontOfSize:(CGFloat)size;

@end

@interface UIColor (Helpers)

+ (UIColor *)primaryGrayColor;
+ (UIColor *)primaryLightGrayColor;
+ (UIColor *)primaryDarkGrayColor;

@end

