//
//  NCScreen.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/27/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 底部迷你播放器的高度
#define MINI_PLAYVIEW_HEIGHT 44

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 顶部高度
#define STATUSBAR_HEIGHT statusBarHeight()
#define NAVIGATIONBAR_HEIGHT (44)
// 上面的整体高度
#define TOP_HEIGHT (STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT)

// 底部高度
#define HOMEINDICATOR_HEIGHT homeIndicatorHeight()
#define TABBAR_HEIGHT (49)
// 下面的整体高度
#define BOTTOM_HEIGHT (HOMEINDICATOR_HEIGHT + TABBAR_HEIGHT)

#define UI(x) UIAdapter(x)
#define UIRect(x, y, width, height) UIRectAdapter(x, y, width, height)
#define UISize(width, height) UISizeAdapter(width, height)
#define UIPoint(x, y) UIPointAdapter(x, y)

/// 根据iPhone 13/iPhone 13 Pro/iPhone 12/iPhone 12 Pro设置
/// @param x 在iPhone 13/iPhone 13 Pro/iPhone 12/iPhone 12 Pro机型上布局的数值
static inline NSInteger UIAdapter (float x) {
    CGFloat scale = 390 / SCREEN_WIDTH;  // 390: iPhone 13/iPhone 13 Pro/iPhone 12/iPhone 12 Pro 屏幕宽度
    return (NSInteger)x / scale;
}

static inline CGRect UIRectAdapter(x, y, width, height) {
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

static inline CGSize UISizeAdapter(width, height) {
    return CGSizeMake(UIAdapter(width), UIAdapter(height));
}

static inline CGPoint UIPointAdapter(x, y) {
    return CGPointMake(UIAdapter(x), UIAdapter(y));
}

/// 顶部状态栏高度
static inline NSInteger statusBarHeight() {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager = windowScene.statusBarManager;
    return statusBarManager.statusBarFrame.size.height;
}

/// 底部home indicator高度
static inline NSInteger homeIndicatorHeight() {
    NSSet *set = [[UIApplication sharedApplication] connectedScenes];
    UIWindowScene *windowScene = [set anyObject];
    UIWindow *window = windowScene.windows.firstObject;
    return window.safeAreaInsets.bottom;
}

/// 分辨率及状态栏适配，使用UI根据iPhone 13/iPhone 13 Pro/iPhone 12/iPhone 12 Pro设置
@interface NCScreen : NSObject

@end

NS_ASSUME_NONNULL_END
