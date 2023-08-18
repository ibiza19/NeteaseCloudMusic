//
//  NCTabBarController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCTabBarController.h"
#import "NCNavigationController.h"
#import "NCScreen.h"
#import "NCColor.h"
#import "NCNotification.h"
#import "NCMusicDetailViewController.h"

@interface NCTabBarController () <NCTabBarDelegate>

@property (nonatomic, strong, readwrite) NCTabBar *rootTabBar;  // 代替原来的tabBar
@property (nonatomic, assign, readwrite) NCTabBarBottomBarStyles bottomBarStyle;
@property (nonatomic, strong, readwrite) UIImage *tabBarBgImage;
@property (nonatomic, copy, readwrite) NSArray<NCTabBarItemInfo *> *itemsInfo;

@end

@implementation NCTabBarController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *classNameArray = @[@"NCDiscoverViewController",
                                @"NCMineViewController"];
    NSArray *titleArray = @[@"发现", @"我的"];
    NSArray *imageNameArray = @[@"music.note.house", @"person"];
    
    self.tabBarBgImage = [UIImage imageNamed:@"minibar_bg"];
    
    NSMutableArray<NCTabBarItemInfo *> *itemsMutableInfo = @[].mutableCopy;
    for (int i = 0; i < imageNameArray.count; i++) {
        NCTabBarItemInfo *info = [[NCTabBarItemInfo alloc] init];
        info.name = imageNameArray[i];
        info.selectName = [NSString stringWithFormat:@"%@.fill", imageNameArray[i]];
        info.color = kTabBarItemColor;
        info.selectColor = kTabBarItemSelectColor;
        info.title = titleArray[i];
        [itemsMutableInfo addObject:info];
    }
    self.itemsInfo = itemsMutableInfo.copy;
    
    self.rootTabBar = [[NCTabBar alloc] init];
    self.rootTabBar.NCDelegate = self;
    self.rootTabBar.itemsInfo = self.itemsInfo;
    self.rootTabBar.bgImage = self.tabBarBgImage;
    [self.rootTabBar createTabBarItems];
    [self setValue:self.rootTabBar forKey:@"tabBar"];

    
    NSMutableArray *navigationControllers = @[].mutableCopy;
    for (int i = 0; i < classNameArray.count; i++) {
        UIViewController *viewController = [[NSClassFromString(classNameArray[i]) alloc] init];
        NCNavigationController *navigationController = [[NCNavigationController alloc] initWithRootViewController:viewController];
        [navigationControllers addObject:navigationController];
    }
    self.viewControllers = navigationControllers.copy;
    [self _updateRootTabBarInfos];
    
    [kNotificationCenter addObserver:self selector:@selector(_pushMusicDetailViewController) name:NCMINIPLAYERVIEW_LET_APPEAR_NOTIFICATION object:nil];
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

#pragma mark - Public Method

- (void)updateBottomStyle:(NCTabBarBottomBarStyles)style {
    [self.view layoutIfNeeded];
    self.bottomBarStyle = style;
    ((NCTabBar *)self.tabBar).bottomBarStyle = style;
    [self.view setNeedsLayout];
    [UIView animateWithDuration:0.24 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

#pragma mark - Private Method

- (void)_updateRootTabBarInfos {
    self.rootTabBar.itemsInfo = self.itemsInfo;
    self.rootTabBar.bgImage = self.tabBarBgImage;
    [self.rootTabBar reloadData:self.selectedIndex];
}

// 推入musicDetailViewController
- (void)_pushMusicDetailViewController {
    [((NCNavigationController *)self.selectedViewController) pushViewController:kMusicDetailViewController animated:YES];
}

#pragma mark - NCTabBarDelegate
- (void)tabBar:(NCTabBar *)tabBar didSelectedIndex:(NSInteger)index {
    self.selectedIndex = index;
    [self.rootTabBar reloadData:self.selectedIndex];
}

@end
