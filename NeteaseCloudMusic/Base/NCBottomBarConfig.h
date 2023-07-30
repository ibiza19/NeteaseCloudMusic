//
//  NCBottomBarConfig.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBarController/NCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface NCBottomBarConfig : NSObject

+ (NCTabBarBottomBarStyles)bottomBarStyleForViewControllerClass:(Class)className;

@end

NS_ASSUME_NONNULL_END
