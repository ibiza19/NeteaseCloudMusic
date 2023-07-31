//
//  NCTabBar.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import <UIKit/UIKit.h>
@class NCTabBar;

NS_ASSUME_NONNULL_BEGIN

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


@interface NCTabBar : UITabBar
@property (nonatomic, assign, readwrite) NCTabBarBottomBarStyles bottomBarStyle;
@property (nonatomic, copy, readwrite) NSArray<NCTabBarItemInfo *> *itemsInfo;
@property (nonatomic, strong, readwrite) UIImage *bgImage;
@property (nonatomic, weak, readwrite) id<NCTabBarDelegate> NCDelegate;

- (void)createTabBarItems;
- (void)reloadData:(NSInteger)selectedIndex;
- (void)updateBarItemsWithSelectedIndex:(NSInteger)selectedIndex;
@end

NS_ASSUME_NONNULL_END
