//
//  NCBaseViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/29/23.
//

#import "NCBaseViewController.h"
#import "NCTabBarController.h"
#import "NCBottomBarConfig.h"

@interface NCBaseViewController ()

@end

@implementation NCBaseViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.extendedLayoutIncludesOpaqueBars = YES;  // 可以扩展到不透明bar底部
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
    if ([self.tabBarController isKindOfClass:[NCTabBarController class]] && !self.isDelayShowBottomBar) {
        NCTabBarController *tabBarController = (NCTabBarController *)self.tabBarController;
        [tabBarController updateBottomStyle:[NCBottomBarConfig bottomBarStyleForViewControllerClass:self.class]];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
  
    // 此处处理从使用自定义push方式实现present的页面dismiss的情况
    if ([self.tabBarController isKindOfClass:[NCTabBarController class]] && self.isDelayShowBottomBar) {
        NCTabBarController *tabBarController = (NCTabBarController *)self.tabBarController;
        [tabBarController updateBottomStyle:[NCBottomBarConfig bottomBarStyleForViewControllerClass:self.class]];
    }
}


@end
