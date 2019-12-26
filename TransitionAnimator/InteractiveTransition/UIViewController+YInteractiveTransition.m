//
//  UIViewController+YInteractiveTransition.m
//  CommonUtils
//
//  Created by Yuuki on 2019/8/8.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import "UIViewController+YInteractiveTransition.h"
#import <objc/runtime.h>

@implementation UIViewController (YInteractiveTransition)

- (void)setY_interactivePopRecognizer:(UIGestureRecognizer *)y_interactivePopRecognizer {
    objc_setAssociatedObject(self, "y_interactivePopRecognizer", y_interactivePopRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIGestureRecognizer *)y_interactivePopRecognizer {
    return objc_getAssociatedObject(self, "y_interactivePopRecognizer");
}

- (void)setY_interactivePopTransition:(UIPercentDrivenInteractiveTransition *)y_interactivePopTransition {
    objc_setAssociatedObject(self, "y_interactivePopTransition", y_interactivePopTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)y_interactivePopTransition {
    return objc_getAssociatedObject(self, "y_interactivePopTransition");
}

- (void)setY_translationBegin:(CGPoint)y_translationBegin {
    objc_setAssociatedObject(self, "y_translationBegin", [NSValue valueWithCGPoint:y_translationBegin], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)y_translationBegin {
    return [objc_getAssociatedObject(self, "y_translationBegin") CGPointValue];
}

- (void)y_setupGestures {
    if (!self.y_interactivePopRecognizer) {
        UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(_y_gestureAct:)];
        recognizer.edges = UIRectEdgeLeft;
        [self.view addGestureRecognizer:recognizer];
        self.y_interactivePopRecognizer = recognizer;
    }
}

- (void)_y_gestureAct:(UIScreenEdgePanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.y_interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            self.y_translationBegin = translation;
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat percent = (translation.x - self.y_translationBegin.x) / self.view.frame.size.width;
            [self.y_interactivePopTransition updateInteractiveTransition:percent];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGPoint velocity = [recognizer velocityInView:self.view];
            CGFloat percent = (translation.x + velocity.x - self.y_translationBegin.x) / self.view.frame.size.width;
            if (percent < 0.25) {
                [self.y_interactivePopTransition cancelInteractiveTransition];
            } else {
                [self.y_interactivePopTransition finishInteractiveTransition];
            }
            self.y_interactivePopTransition = nil;
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            [self.y_interactivePopTransition cancelInteractiveTransition];
            self.y_interactivePopTransition = nil;
        }
            break;
        default:
            break;
    }
}

@end
