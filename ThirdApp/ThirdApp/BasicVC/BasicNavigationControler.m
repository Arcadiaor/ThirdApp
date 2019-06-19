//
//  BasicNavigationControler.m
//  OneApp
//
//  Created by leiyong on 2019/4/30.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "BasicNavigationControler.h"
#import "BaseViewController.h"

@interface BasicNavigationControler ()
<
UINavigationControllerDelegate,
UIGestureRecognizerDelegate
>

@end

@implementation BasicNavigationControler

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"2f2f2f"]}];
                self.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationBar.translucent = NO;
        self.navigationBar.shadowImage = [UIImage new];
        self.navigationBar.backgroundColor = [UIColor whiteColor];
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.delegate = self;
        }
    }
    return self;
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        if ([toVC isKindOfClass:[BaseViewController class]]) {
            BaseViewController *basicVC = (BaseViewController *)toVC;
            return basicVC.presentedAnimationC;
        }
    } else if (operation == UINavigationControllerOperationPop) {
        if ([fromVC isKindOfClass:[BaseViewController class]]) {
            BaseViewController *basicVC = (BaseViewController *)fromVC;
            return basicVC.dismissAnimationC;
        }
    }
    
    return nil;
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 || [[self valueForKey:@"_isTransitioning"] boolValue]) { return NO; }
    
    return YES;
}



@end
