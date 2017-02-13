//
//  ArticleDetailViewController.h
//  NYTimes
//
//  Created by Steven Bishop on 1/19/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleViewModel.h"

@interface ArticleDetailViewController : UIViewController

+ (instancetype)buildWithViewModel:(ArticleViewModel *)viewModel;

@end
