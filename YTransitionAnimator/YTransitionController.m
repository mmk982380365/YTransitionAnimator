//
//  YTransitionController.m
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import "YTransitionController.h"
#import "UIViewController+YInteractiveTransition.h"
#import "YPushAnimator.h"

@implementation YTransitionController

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    YPushAnimator *anim = [[YPushAnimator alloc] initWithOperation:YBaseAnimatorOperatorDismiss];
    if (dismissed.y_interactivePopTransition) {
        anim.interactivePopTransition = dismissed.y_interactivePopTransition;
    }
    return anim;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    YPushAnimator *anim = [[YPushAnimator alloc] initWithOperation:YBaseAnimatorOperatorShow];
    return anim;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(YBaseAnimator *)animator {
    return animator.interactivePopTransition;
}

@end
