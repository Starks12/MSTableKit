//
//  MSTableViewCell.h
//  Plain Example
//
//  Created by Eric Horacek on 12/25/12.
//  Copyright (c) 2012 Monospace Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MSTableViewCellSelectionStyle) {
    MSTableViewCellSelectionStyleNone,
    MSTableViewCellSelectionStyleIndent
};

@interface MSTableViewCell : UITableViewCell

@property (nonatomic, readonly) UILabel *accessoryTextLabel;
@property (nonatomic, readonly) UIControlState controlState;
@property (nonatomic, assign) MSTableViewCellSelectionStyle selectionStyle;

- (void)setTitleTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (void)setDetailTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (void)setAccessoryTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (NSDictionary *)titleTextAttributesForState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (NSDictionary *)detailTextAttributesForState:(UIControlState)state UI_APPEARANCE_SELECTOR;
- (NSDictionary *)accessoryTextAttributesForState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (void)updateBackgroundState:(BOOL)darkened animated:(BOOL)animated;

- (void)initialize;
- (void)configureViews;

@end
