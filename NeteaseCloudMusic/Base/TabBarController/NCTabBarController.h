//
//  NCTabBarController.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import <UIKit/UIKit.h>
#import "NCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

/// 自定义的tabBarController
@interface NCTabBarController : UITabBarController

/// 更新tabBar的样式
/// @param style 需要更新到的样式
- (void)updateBottomStyle:(NCTabBarBottomBarStyles)style;

@end

NS_ASSUME_NONNULL_END
