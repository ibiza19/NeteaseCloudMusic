//
//  NCNavigationControllerPushAnimatedTransitionBottomToTop.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCNavigationControllerPushAnimatedTransitionBottomToTop.h"

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
    
    toView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toView.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
