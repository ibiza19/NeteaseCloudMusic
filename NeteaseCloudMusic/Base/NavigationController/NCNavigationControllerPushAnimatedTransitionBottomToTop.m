//
//  NCNavigationControllerPushAnimatedTransitionBottomToTop.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCNavigationControllerPushAnimatedTransitionBottomToTop.h"
#import "NCScreen.h"

@implementation NCNavigationControllerPushAnimatedTransitionBottomToTop

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        toView = toVC.view;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    toView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toView.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
