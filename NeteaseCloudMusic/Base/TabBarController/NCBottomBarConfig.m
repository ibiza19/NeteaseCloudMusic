//
//  NCBottomBarConfig.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCBottomBarConfig.h"

@implementation NCBottomBarConfig

+ (NCTabBarBottomBarStyles)bottomBarStyleForViewControllerClass:(Class)className {
    NSArray *noneBottomBarList = @[
        NSClassFromString(@"NCMusicDetailViewController")
    ];

    NSArray *allBottomBarList = @[
        NSClassFromString(@"NCDiscoverViewController"),
        NSClassFromString(@"NCMineViewController")
    ];

    if ([noneBottomBarList containsObject:className]) {
        return NCTabBarBottomBarStyleNone;
    }

    if ([allBottomBarList containsObject:className]) {
        return NCTabBarBottomBarStyleAll;
    }

    return NCTabBarBottomBarStyleMiniPlayViewOnly;
}

@end
