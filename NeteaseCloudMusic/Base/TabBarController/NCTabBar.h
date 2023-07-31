//
//  NCTabBar.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import <UIKit/UIKit.h>
@class NCTabBar;

NS_ASSUME_NONNULL_BEGIN

/// tabBarItem的相关信息，使用其来布局tabBarItem
@interface NCTabBarItemInfo : NSObject
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *selectName;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) UIColor *color;
@property (nonatomic, strong, readwrite) UIColor *selectColor;
@end

typedef NS_ENUM(NSInteger, NCTabBarBottomBarStyles) {
    NCTabBarBottomBarStyleMiniPlayViewOnly,
    NCTabBarBottomBarStyleAll,
    NCTabBarBottomBarStyleNone
};

@protocol NCTabBarDelegate <NSObject>
- (void)tabBar:(NCTabBar *)tabBar didSelectedIndex:(NSInteger)index;
@end

/// 自定义的tabBar
@interface NCTabBar : UITabBar
@property (nonatomic, assign, readwrite) NCTabBarBottomBarStyles bottomBarStyle;
@property (nonatomic, copy, readwrite) NSArray<NCTabBarItemInfo *> *itemsInfo;
@property (nonatomic, strong, readwrite) UIImage *bgImage;
@property (nonatomic, weak, readwrite) id<NCTabBarDelegate> NCDelegate;

/// 对tabBarItems进行初始化
- (void)createTabBarItems;

/// 通过数据加载tabBar
/// @param selectedIndex 处于selected的item的index
- (void)reloadData:(NSInteger)selectedIndex;
@end

NS_ASSUME_NONNULL_END
