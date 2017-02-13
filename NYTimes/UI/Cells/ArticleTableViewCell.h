//
//  ArticleTableViewCell.h
//  NYTimes
//
//  Created by Steven Bishop on 1/17/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleViewModel.h"

@interface ArticleTableViewCell : UITableViewCell
- (void)configureWithViewModel:(ArticleViewModel *)viewModel;

@end
