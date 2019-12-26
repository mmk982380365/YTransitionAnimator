//
//  YBaseAnimator.m
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import "YBaseAnimator.h"

@implementation YBaseAnimator

+ (instancetype)animatorWithOperation:(YBaseAnimatorOperator)operation {
    return [[self alloc] initWithOperation:operation];
}

+ (instancetype)animatorWithOperation:(YBaseAnimatorOperator)operation duration:(NSTimeInterval)duration {
    return [[self alloc] initWithOperation:operation duration:duration];
}

- (instancetype)initWithOperation:(YBaseAnimatorOperator)operation
{
    self = [super init];
    if (self) {
        _operation = operation;
        _duration = 0.35;
    }
    return self;
}

- (instancetype)initWithOperation:(YBaseAnimatorOperator)operation duration:(NSTimeInterval)duration
{
    self = [super init];
    if (self) {
        _operation = operation;
        _duration = duration;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.operation == YBaseAnimatorOperatorShow) {
        [self showAnimate:transitionContext];
    } else {
        [self dismissAnimate:transitionContext];
    }
}

- (void)showAnimate:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)dismissAnimate:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

@end
