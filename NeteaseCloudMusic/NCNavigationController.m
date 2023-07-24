//
//  NCNavigationController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCNavigationController.h"

@interface NCNavigationController ()

@end

@implementation NCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
