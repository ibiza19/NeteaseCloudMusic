//
//  NCBottomBarConfig.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

/// 判断相关viewController使用什么bar的样式，可以自行在实现中更改，默认为miniPlayViewOnly
@interface NCBottomBarConfig : NSObject

/// 判断相关viewController使用什么bar的样式
/// @param className viewController的className
+ (NCTabBarBottomBarStyles)bottomBarStyleForViewControllerClass:(Class)className;

@end

NS_ASSUME_NONNULL_END
