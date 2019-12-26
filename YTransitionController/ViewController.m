//
//  ViewController.m
//  YTransitionController
//
//  Created by Yuuki on 2019/12/26.
//  Copyright © 2019 Yuuki. All rights reserved.
//

#import "ViewController.h"
#import "YTransitionController.h"
#import "UIViewController+YInteractiveTransition.h"

@interface ViewController ()

@property (strong, nonatomic) YTransitionController *transitionController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    float r = (float)(arc4random() % 1000) / 1000.0;
    float g = (float)(arc4random() % 1000) / 1000.0;
    float b = (float)(arc4random() % 1000) / 1000.0;
    
    self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    self.transitionController = [[YTransitionController alloc] init];
    self.transitioningDelegate = self.transitionController;
    [self y_setupGestures];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
