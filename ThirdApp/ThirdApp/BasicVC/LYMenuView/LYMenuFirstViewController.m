//
//  LYMenuFirstViewController.m
//  SecondApp
//
//  Created by leiyong on 2019/5/15.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "LYMenuFirstViewController.h"
#import "LYMenuView.h"

@interface LYMenuFirstViewController ()

@end

@implementation LYMenuFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"navigation_list"] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
}

- (void)clickLeftButton {
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows firstObject];
    for (UIView *view in keyWindow.subviews) {
        if ([view isKindOfClass:[LYMenuView class]]) {
            [(LYMenuView *)view trigger];
        }
    }
}

@end
