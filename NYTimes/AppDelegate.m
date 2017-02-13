//
//  AppDelegate.m
//  NYTimes
//
//  Created by Steven Bishop on 1/20/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import "AppDelegate.h"
#import "FeaturedArticlesTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FeaturedArticlesTableViewController *featuredController = [FeaturedArticlesTableViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:featuredController];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
