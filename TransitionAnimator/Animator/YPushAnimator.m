//
//  YPushAnimator.m
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import "YPushAnimator.h"

@implementation YPushAnimator

- (void)showAnimate:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contentView = transitionContext.containerView;
    
    [contentView addSubview:from.view];
    [contentView addSubview:to.view];
    
    CATransform3D fromT = CATransform3DIdentity;
    fromT = CATransform3DTranslate(fromT, -200, 0, 0);
    fromT = CATransform3DScale(fromT, 1, 1, 1);
    
    CATransform3D toTBegin = CATransform3DIdentity;
    toTBegin = CATransform3DTranslate(toTBegin, [UIScreen mainScreen].bounds.size.width, 0, 0);
    
    to.view.layer.transform = toTBegin;
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        from.view.layer.transform = fromT;
        
        to.view.layer.transform = CATransform3DIdentity;
        from.view.alpha = 0.5;
    } completion:^(BOOL finished) {
        if (!transitionContext.transitionWasCancelled) {
            
            [from.view removeFromSuperview];
        }
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
        from.view.alpha = 1;
        to.view.layer.transform = CATransform3DIdentity;
        from.view.layer.transform = CATransform3DIdentity;
    }];
    
}

- (void)dismissAnimate:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *contentView = transitionContext.containerView;
    
    [contentView addSubview:to.view];
    [contentView addSubview:from.view];
    
    to.view.alpha = 0.5;
    
    CATransform3D fromT = CATransform3DIdentity;
    fromT = CATransform3DTranslate(fromT, [UIScreen mainScreen].bounds.size.width, 0, 0);
    
    CATransform3D toTBegin = CATransform3DIdentity;
    toTBegin = CATransform3DTranslate(toTBegin, -200, 0, 0);
    toTBegin = CATransform3DScale(toTBegin, 1, 1, 1);
    to.view.layer.transform = toTBegin;
    
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        from.view.layer.transform = fromT;
        to.view.alpha = 1;
        to.view.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        if (!transitionContext.transitionWasCancelled) {
            
            [from.view removeFromSuperview];
        }
        to.view.layer.transform = CATransform3DIdentity;
        from.view.layer.transform = CATransform3DIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}

@end
