//
//  ArticleDetailViewController.m
//  NYTimes
//
//  Created by Steven Bishop on 1/19/17.
//  Copyright © 2017 Steven Bishop. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "AsyncImageView.h"
#import "Theme.h"

@interface ArticleDetailViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIStackView *stackView;
@property (strong, nonatomic) ArticleViewModel *viewModel;
@end

@implementation ArticleDetailViewController

+ (instancetype)buildWithViewModel:(ArticleViewModel *)viewModel {
    ArticleDetailViewController *detailController = [ArticleDetailViewController new];
    detailController.viewModel = viewModel;
    return detailController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self setupConstraints];
}

- (void)setup {
    self.title = NSLocalizedString(@"ArticleDetail.NavigationItem.Title", nil);
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButtonTapped:)];
    self.navigationItem.rightBarButtonItem = shareButton;
    self.view.backgroundColor = [UIColor primaryLightGrayColor];

    self.scrollView = [UIScrollView new];
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];

    self.stackView = [UIStackView new];
    self.stackView.spacing = 7.0f;
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.stackView];

    UILabel *articleTypeLabel = [UILabel new];
    articleTypeLabel.font = [UIFont boldSystemFontOfSize:12.0f];

    [self.stackView addArrangedSubview:articleTypeLabel];
    articleTypeLabel.text = [self.viewModel.articleType uppercaseString];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlaceHolderImage_Detail"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.imageURL = self.viewModel.detailImageUrl;

    [self.stackView addArrangedSubview:imageView];

    UILabel *dateLabel = [UILabel new];
    dateLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    dateLabel.text = self.viewModel.publishedDateString;
    dateLabel.textColor = [UIColor primaryDarkGrayColor];
    [self.stackView addArrangedSubview:dateLabel];

    UILabel *titleLabel = [UILabel new];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont primaryFont];
    titleLabel.text = self.viewModel.titleText;
    [self.stackView addArrangedSubview:titleLabel];

    UILabel *detailLabel = [UILabel new];
    detailLabel.numberOfLines = 0;
    detailLabel.text = self.viewModel.detailText;
    detailLabel.font = [UIFont georgiaFontOfSize:14.0f];
    detailLabel.textColor = [UIColor primaryGrayColor];
    [self.stackView addArrangedSubview:detailLabel];

    if (self.viewModel.authorName) {
        UILabel *authorLabel = [UILabel new];
        authorLabel.text = [NSString stringWithFormat:@"%@%@", NSLocalizedString(@"AuthorPrefix.By", nil), self.viewModel.authorName];
        authorLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        authorLabel.textColor = [UIColor primaryDarkGrayColor];
        [self.stackView addArrangedSubview:authorLabel];
    }

    UIButton *safariButton = [UIButton buttonWithType:UIButtonTypeSystem];
    safariButton.titleLabel.font = [UIFont georgiaFontOfSize:14];
    [safariButton setTitle:NSLocalizedString(@"ArticleDetail.LinkToArticle.Text", nil) forState:UIControlStateNormal];
    [safariButton addTarget:self action:@selector(linkToFullArticleTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.stackView addArrangedSubview:safariButton];

    UIStackView *footerStackView = [UIStackView new];
    footerStackView.alignment = UIStackViewAlignmentCenter;
    footerStackView.axis = UILayoutConstraintAxisVertical;
    footerStackView.spacing = 3.0f;

    UIImageView *footerLogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NYT_footer_logo"]];
    footerLogoImageView.contentMode = UIViewContentModeCenter;
    [footerStackView addArrangedSubview:footerLogoImageView];

    UILabel *copyrightLabel = [UILabel new];
    copyrightLabel.textColor = [UIColor primaryGrayColor];
    copyrightLabel.font = [UIFont georgiaFontOfSize:10.0f];
    copyrightLabel.text = NSLocalizedString(@"ArticleDetail.CopyrightLabel.Text", nil);
    [footerStackView addArrangedSubview:copyrightLabel];

    [self.stackView addArrangedSubview:footerStackView];
}

- (void)setupConstraints {
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.scrollView.superview.leadingAnchor].active = YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.scrollView.superview.trailingAnchor].active = YES;
    [self.scrollView.topAnchor constraintEqualToAnchor:self.scrollView.superview.topAnchor].active = YES;
    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.scrollView.superview.bottomAnchor].active = YES;

    [self.stackView.topAnchor constraintEqualToAnchor:self.stackView.superview.topAnchor constant:6.0f].active = YES;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.stackView.superview.leadingAnchor constant:6.0f].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.stackView.superview.trailingAnchor constant:6.0f].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.stackView.superview.bottomAnchor constant:-12.0f].active = YES;
    [self.stackView.centerXAnchor constraintEqualToAnchor:self.stackView.superview.centerXAnchor].active = YES;
}


#pragma mark - Actions

- (void)actionButtonTapped:(UIBarButtonItem *)sender {

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[self.viewModel.webUrl]
                                                                                     applicationActivities:nil];
    activityController.popoverPresentationController.barButtonItem = sender;
    activityController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)linkToFullArticleTapped:(UIButton *)sender {
    if ([[UIApplication sharedApplication] canOpenURL:self.viewModel.webUrl]) {
        [[UIApplication sharedApplication] openURL:self.viewModel.webUrl options:@{} completionHandler:nil];
    }
}

@end
