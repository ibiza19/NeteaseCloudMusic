//
//  NCBaseViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/29/23.
//

#import "NCBaseViewController.h"
#import "NCTabBarController.h"

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
  
#warning 这一段的logic
//    if ([self.tabBarController isKindOfClass:[NCTabBarController class]] && !self.isDelayShowBottomBar) {
//        NCTabBarController *tabBarController = (NCTabBarController *)self.tabBarController;
//        [tabBarController updateBottomStyle:[BarConfig bottomBarStyleForViewControllerClass:[self class]]];
//    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
  
#warning 这一段的logic
    // 此处处理从使用自定义push方式实现present的页面 dismiss 的情况
//    if ([self.tabBarController isKindOfClass:[NCTabBarController class]] && self.isDelayShowBottomBar) {
//        NCTabBarController *tabBarController = (NCTabBarController *)self.tabBarController;
//        [tabBarController updateBottomStyle:[BarConfig bottomBarStyleForViewControllerClass:[self class]]];
//    }
}

#pragma mark - Lazy Load

#warning 懒加载currentPushOperation, 其实也不用，因为只设置了那个属性是不是那个而已

@end
