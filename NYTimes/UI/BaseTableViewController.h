//
//  BaseTableViewController.h
//  NYTimes
//
//  Created by Steven Bishop on 1/17/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleDetailViewController.h"
#import "ArticleTableViewCell.h"
#import "NYTimes-Swift.h"

@interface BaseTableViewController : UITableViewController
@property (nonatomic, strong) NSArray<ArticleViewModel *> *viewModels;

@end
