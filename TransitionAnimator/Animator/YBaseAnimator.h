//
//  YBaseAnimator.h
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YBaseAnimatorOperator) {
    YBaseAnimatorOperatorShow,
    YBaseAnimatorOperatorDismiss,
};

@interface YBaseAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@property (assign, nonatomic) NSTimeInterval duration;

@property (assign, nonatomic, readonly) YBaseAnimatorOperator operation;

- (instancetype)initWithOperation:(YBaseAnimatorOperator)operation;

- (instancetype)initWithOperation:(YBaseAnimatorOperator)operation duration:(NSTimeInterval)duration;

+ (instancetype)animatorWithOperation:(YBaseAnimatorOperator)operation;

+ (instancetype)animatorWithOperation:(YBaseAnimatorOperator)operation duration:(NSTimeInterval)duration;

#pragma mark - subclass override

- (void)showAnimate:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)dismissAnimate:(id<UIViewControllerContextTransitioning>)transitionContext;


@end

NS_ASSUME_NONNULL_END
