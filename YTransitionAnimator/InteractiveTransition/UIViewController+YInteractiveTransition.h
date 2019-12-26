//
//  UIViewController+YInteractiveTransition.h
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YInteractiveTransition)

@property (strong, nonatomic) UIGestureRecognizer *y_interactivePopRecognizer;

@property (strong, nonatomic, nullable) UIPercentDrivenInteractiveTransition *y_interactivePopTransition;

@property (assign, nonatomic) CGPoint y_translationBegin;

- (void)y_setupGestures;

@end

NS_ASSUME_NONNULL_END
