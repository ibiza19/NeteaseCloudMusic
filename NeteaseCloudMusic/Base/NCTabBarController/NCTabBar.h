//
//  NCTabBar.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NCTabBarBottomBarStyles) {
    NCTabBarBottomBarStyleMiniPlayViewOnly,
    NCTabBarBottomBarStyleAll,
    NCTabBarBottomBarStyleNone
};

@interface NCTabBar : UITabBar

@property (nonatomic, assign, readwrite) NCTabBarBottomBarStyles bottomBarStyle;

@end

NS_ASSUME_NONNULL_END
