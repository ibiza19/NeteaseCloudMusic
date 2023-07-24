//
//  NCMainTabBarController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCMainTabBarController.h"
#import "NCNavigationController.h"

@interface NCMainTabBarController ()

@end

@implementation NCMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *classNameArray = @[@"NCDiscoverViewController",
                                @"NCMineViewController"];
    NSArray *titleArray = @[@"发现", @"我的"];
    NSArray *imageNameArray = @[@"discover", @"mine"];
    NSMutableArray *navigationControllers = @[].mutableCopy;
    for (int i = 0; i < classNameArray.count; i++) {
        UIViewController *viewController = [[NSClassFromString(classNameArray[i]) alloc] init];
        NCNavigationController *navigationController = [[NCNavigationController alloc] initWithRootViewController:viewController];
        [navigationControllers addObject:navigationController];
//        NSString *imageString =
        navigationController.tabBarItem.title = titleArray[i];
        
    }
    self.viewControllers = navigationControllers.copy;
//    self.tabBar.tintColor = kNetEaseRedColor;
}

@end
