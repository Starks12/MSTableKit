//
//  ERNavigationPaneTableView.m
//  MSTableKit
//
//  Created by Eric Horacek on 6/19/12.
//  Copyright (c) 2012 Monospace Ltd. All rights reserved.
//

#import "MSPlainTableView.h"
#import "MSPlainTableViewCell.h"
#import "KGNoise.h"
#import <QuartzCore/QuartzCore.h>

@interface MSPlainTableView ()

@property (nonatomic, strong) UIView *topShadow;
@property (nonatomic, strong) UIView *bottomHighlight;
@property (nonatomic, strong) UIView *bottomShadow;

@end

@implementation MSPlainTableView

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIColor *etchHighlightColor = [[MSPlainTableViewCell appearanceWhenContainedIn:self.class, nil] etchHighlightColor];
    UIColor *etchShadowColor = [[MSPlainTableViewCell appearanceWhenContainedIn:self.class, nil] etchShadowColor];
    self.bottomHighlight.backgroundColor = etchHighlightColor;
    self.bottomShadow.backgroundColor = etchShadowColor;
    self.topShadow.backgroundColor = etchShadowColor;
    
    if ((self.numberOfSections != 0) && ([self numberOfRowsInSection:0] != 0)) {
        
        NSInteger maxSection = ([self.dataSource numberOfSectionsInTableView:self] - 1);
        NSInteger maxRow = ([self.dataSource tableView:self numberOfRowsInSection:maxSection] - 1);
        CGRect bottomCellRect = [self rectForRowAtIndexPath:[NSIndexPath indexPathForRow:maxRow inSection:maxSection]];
        CGRect topCellRect = [self rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
        self.bottomHighlight.frame = CGRectMake(0.0, CGRectGetMaxY(bottomCellRect) + 1.0, self.bounds.size.width, 1.0);
        self.bottomShadow.frame = CGRectMake(0.0, CGRectGetMaxY(bottomCellRect), self.bounds.size.width, 1.0);
        self.topShadow.frame = CGRectMake(0.0, CGRectGetMinY(topCellRect) - 1.0, self.bounds.size.width, 1.0);
    }
}

-(void)setFrame:(CGRect)frame
{
    [self setNeedsLayout];
    [super setFrame:frame];
}

#pragma mark - UIScrollView

-(void)setContentOffset:(CGPoint)contentOffset
{
    [self setNeedsLayout];
    [super setContentOffset:contentOffset];
}

#pragma mark - UITableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.topShadow = [[UIView alloc] init];
        [self addSubview:self.topShadow];
        
        self.bottomShadow = [[UIView alloc] init];
        [self addSubview:self.bottomShadow];
        
        self.bottomHighlight = [[UIView alloc] init];
        [self addSubview:self.bottomHighlight];
        
        self.layer.masksToBounds = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end
