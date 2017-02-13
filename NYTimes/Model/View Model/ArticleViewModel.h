//
//  ArticleViewModel.h
//  NYTimes
//
//  Created by Steven Bishop on 1/19/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NYTimes-Swift.h"

@interface ArticleViewModel : NSObject

@property (copy, readonly) NSString * _Nonnull articleType;
@property (copy, readonly) NSString * _Nonnull titleText;
@property (copy, readonly) NSString * _Nonnull detailText;
@property (copy, readonly) NSString * _Nonnull publishedDateString;
@property (copy, readonly) NSString * _Nullable authorName;
@property (strong, readonly, nonnull) NSURL *  webUrl;
@property (strong, readonly) NSURL * _Nullable thumbnailImageUrl;
@property (strong, readonly) NSURL * _Nullable detailImageUrl;

- (instancetype _Nonnull)initWithFeaturedArticle:(FeaturedArticle * _Nonnull)article;
- (instancetype _Nonnull)initWithSearchArticle:(SearchArticle * _Nonnull)article;

@end
