//
//  NCTabBarItem.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import <UIKit/UIKit.h>
@class NCTabBarItem;

NS_ASSUME_NONNULL_BEGIN

@protocol NCTabBarItemDelegate <NSObject>
- (void)tabBarItem:(NCTabBarItem *)tabBarItem didSelectedIndex:(NSInteger)didSelectedIndex;
@end


typedef NS_ENUM(NSInteger, NCTabBarItemState) {
    NCTabBarItemStateNormal,
    NCTabBarItemStateSelected
};

/// 自定义的tabBarItem
@interface NCTabBarItem : UIView

@property (nonatomic, copy, readwrite) NSString *iconName;
@property (nonatomic, copy ,readwrite) NSString *iconSelectedName;
@property (nonatomic, strong, readwrite) UIColor *titleColor;
@property (nonatomic, strong, readwrite) UIColor *titleSelectedColor;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, weak, readwrite) id<NCTabBarItemDelegate> delegate;

/// 刷新tabBarItem
/// @param state tabBarItem的状态(是否被选中)
- (void)reloadDataWithState:(NCTabBarItemState)state;

@end

NS_ASSUME_NONNULL_END
