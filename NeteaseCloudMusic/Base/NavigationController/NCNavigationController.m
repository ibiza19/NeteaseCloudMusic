//
//  NCNavigationController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCNavigationController.h"
#import "NCNavigationControllerPushAnimatedTransitionBottomToTop.h"
#import "NCNavigationControllerPopAnimatedTransitionTopToBottom.h"
#import "NCScreen.h"
#import "NCBaseViewController.h"


@interface NCNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong, readwrite) UIPercentDrivenInteractiveTransition *popInteractiveTransition;
@property (nonatomic, strong, readwrite) UIPanGestureRecognizer *panGestureRecognizer;
// 从边缘滑动的手势
@property (nonatomic, strong, readwrite) UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;

@end

@implementation NCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

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
    CGFloat process = 0.0;
    CGFloat velocity = 0.0;
    BOOL isScreenEdge = NO;
    
    // 测滑处理
    if (self.screenEdgePanGestureRecognizer == gesture) {
        velocity = [self.screenEdgePanGestureRecognizer velocityInView:self.screenEdgePanGestureRecognizer.view].x;
        process = [self.screenEdgePanGestureRecognizer translationInView:self.screenEdgePanGestureRecognizer.view].x / SCREEN_WIDTH;
        process = pow(MIN(1.0, MAX(0.0, process)), 2); // 增加手势梯度
        isScreenEdge = YES;
    } else {
        velocity = [self.panGestureRecognizer velocityInView:self.panGestureRecognizer.view].y;
        process = [self.panGestureRecognizer translationInView:self.panGestureRecognizer.view].y / (SCREEN_HEIGHT - UI(190));
        process = pow(MIN(1.0, MAX(0.0, process)), 2); // 增加手势梯度
    }
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.popInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self popViewControllerAnimated:YES];
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.popInteractiveTransition updateInteractiveTransition:process];
    } else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        if (isScreenEdge) {
            if (velocity > 1000 || process > 0.2) {
                [self.popInteractiveTransition finishInteractiveTransition];
            } else {
                [self.popInteractiveTransition cancelInteractiveTransition];
            }
        } else {
            if (velocity > 1500 || process > 0.2) {
                [self.popInteractiveTransition finishInteractiveTransition];
            } else {
                [self.popInteractiveTransition cancelInteractiveTransition];
            }
        }
        self.popInteractiveTransition = nil;
    }

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

// 非交互手势转场
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

// 交互手势转场
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if ([animationController isKindOfClass:[NCNavigationControllerPopAnimatedTransitionTopToBottom class]]) {
        return self.popInteractiveTransition;
    }
    return nil;
}

#pragma mark - UIGestureRecognizerDelegate

// 判断手势是否复合条件
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        return NO;
    }

    // 处理符合边缘的手势
    if (self.screenEdgePanGestureRecognizer == gestureRecognizer) {
        CGPoint beginPoint = [gestureRecognizer locationInView:gestureRecognizer.view];
        CGFloat maxAllowDistance = UI(20.0);
        if (beginPoint.x > maxAllowDistance) {
            return NO;
        }
    }

    // 正在转场，不再重新开始一个新的转场
    if ([self valueForKey:@"_isTransitioning"] != nil && [[self valueForKey:@"_isTransitioning"] boolValue] == YES) {
        return NO;
    }

    return YES;
}

@end
