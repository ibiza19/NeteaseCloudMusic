//
//  NCTabBarController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCTabBarController.h"
#import "NCNavigationController.h"
#import "NCScreen.h"

@interface NCTabBarController ()

//@property (nonatomic, strong, readwrite)
@property (nonatomic, assign, readwrite) NCTabBarBottomBarStyles bottomBarStyle;

@end

@implementation NCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setValue:[[NCTabBar alloc] init] forKey:@"tabBar"];

    NSArray *classNameArray = @[@"NCDiscoverViewController",
                                @"NCMineViewController"];
    NSArray *titleArray = @[@"发现", @"我的"];
    NSArray *imageNameArray = @[@"discover", @"mine"];
    NSMutableArray *navigationControllers = @[].mutableCopy;
    for (int i = 0; i < classNameArray.count; i++) {
        UIViewController *viewController = [[NSClassFromString(classNameArray[i]) alloc] init];
        NCNavigationController *navigationController = [[NCNavigationController alloc] initWithRootViewController:viewController];
        [navigationControllers addObject:navigationController];
        NSString *imageString = imageNameArray[i];
        NSString *imageSelectedString = [NSString stringWithFormat:@"%@_selected", imageString];
        navigationController.tabBarItem.image = [UIImage imageNamed:imageString];
        navigationController.tabBarItem.selectedImage = [UIImage imageNamed:imageSelectedString];
        navigationController.tabBarItem.title = titleArray[i];
        
    }
    self.viewControllers = navigationControllers.copy;
//    self.tabBar.tintColor = kNetEaseRedColor;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat tabBarY;
    switch (self.bottomBarStyle) {
        case NCTabBarBottomBarStyleNone:
            tabBarY = SCREEN_HEIGHT;
            break;
        case NCTabBarBottomBarStyleAll:
            tabBarY = SCREEN_HEIGHT - TABBAR_HEIGHT - MINI_PLAYVIEW_HEIGHT - HOMEINDICATOR_HEIGHT;
            break;
        case NCTabBarBottomBarStyleMiniPlayViewOnly:
            tabBarY = SCREEN_HEIGHT - MINI_PLAYVIEW_HEIGHT - HOMEINDICATOR_HEIGHT;
            break;
    }
    
    self.tabBar.frame = CGRectMake(0, tabBarY, SCREEN_WIDTH, TABBAR_HEIGHT + MINI_PLAYVIEW_HEIGHT + HOMEINDICATOR_HEIGHT);
}

- (void)updateBottomStyle:(NCTabBarBottomBarStyles)style {
    [self.view layoutIfNeeded];
    self.bottomBarStyle = style;
    ((NCTabBar *)self.tabBar).bottomBarStyle = style;
    [self.view setNeedsLayout];
    [UIView animateWithDuration:0.24 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}


@end
