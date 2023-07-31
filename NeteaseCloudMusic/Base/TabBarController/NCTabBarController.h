//
//  NCTabBarController.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import <UIKit/UIKit.h>
#import "NCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface NCTabBarController : UITabBarController

- (void)updateBottomStyle:(NCTabBarBottomBarStyles)style;

@end

NS_ASSUME_NONNULL_END
