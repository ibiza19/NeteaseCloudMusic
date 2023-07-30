//
//  NCNavigationController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCNavigationController.h"
#import "NCBaseViewController.h"
#import "NCNavigationControllerPushAnimatedTransitionBottomToTop.h"
#import "NCNavigationControllerPopAnimatedTransitionTopToBottom.h"

@interface NCNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, assign, readwrite) NCNavigationControllerPushOperations currentPushOperation;

@property (nonatomic, strong, readwrite) UIPanGestureRecognizer *panGestureRecognizer;
// 从边缘滑动的手势
@property (nonatomic, strong, readwrite) UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;

@end

@implementation NCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.translucent = NO;
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (self.childViewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    [super pushViewController:viewController animated:animated];
//}

#pragma mark - Lazy Load

- (UIPanGestureRecognizer *)panGestureRecognizer {
    if (!_panGestureRecognizer) {
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_handleGesture:)];
        _panGestureRecognizer.maximumNumberOfTouches = 1;  // 只允许单指滑动
        _panGestureRecognizer.delegate = self;
    }
    return _panGestureRecognizer;
}

- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer {
    if (!_screenEdgePanGestureRecognizer) {
        _screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(_handleGesture:)];
        _screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;
        _screenEdgePanGestureRecognizer.delegate = self;
    }
    return _screenEdgePanGestureRecognizer;
}

#pragma mark - Private Method

- (void)_handleGesture:(UIPanGestureRecognizer *)gesture {
    NSLog(@"");
}

#pragma mark - UINavigationControllerDelegate

// navigationController切换完成后即调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (((NCBaseViewController *)viewController).currentPushOperation == NCNavigationControllerPushOperationBottomUp) {
        self.panGestureRecognizer.enabled = YES;
        [viewController.view addGestureRecognizer:self.panGestureRecognizer];
        
        self.screenEdgePanGestureRecognizer.enabled = YES;
        [viewController.view addGestureRecognizer:self.screenEdgePanGestureRecognizer];
        
        // 在screenEdgePanGestureRecognizer失败后才会识别panGestureRecognizer
        [self.panGestureRecognizer requireGestureRecognizerToFail:self.screenEdgePanGestureRecognizer];
    }
}

// 转场动画, 解决自定义的BottomUp的动画逻辑
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        if (((NCBaseViewController *)toVC).currentPushOperation == NCNavigationControllerPushOperationBottomUp) {
            ((NCBaseViewController *)fromVC).isDelayShowBottomBar = NO;
            return [[NCNavigationControllerPushAnimatedTransitionBottomToTop alloc] init];
        }
    } else if (operation == UINavigationControllerOperationPop) {
        if (((NCBaseViewController *)fromVC).currentPushOperation == NCNavigationControllerPushOperationBottomUp) {
            ((NCBaseViewController *)toVC).isDelayShowBottomBar = YES;
            return [[NCNavigationControllerPopAnimatedTransitionTopToBottom alloc] init];
        }
    }
    return nil;

}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    NSLog(@"");
    return nil;
}

@end
