//
//  LYPageLoadingView.m
//  SecondApp
//
//  Created by leiyong on 2019/5/16.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "LYPageLoadingView.h"
#import "MBProgressHUD.h"
@interface LYPageLoadingView  ()
<
UIGestureRecognizerDelegate
>

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end


@implementation LYPageLoadingView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:self.panGesture];
        self.panGesture.delegate = self;
        
        self.autoresizingMask =
        UIViewAutoresizingFlexibleHeight |
        UIViewAutoresizingFlexibleWidth;
        
        self.hud = [[MBProgressHUD alloc] initWithView:self];
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
        self.hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.8];
        [self.hud showAnimated:YES];
        self.hud.autoresizingMask =
        UIViewAutoresizingFlexibleWidth|
        UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.hud];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.hud.frame = self.bounds;
}

- (void)show:(UIView *)superView {
    self.frame = superView.bounds;
    [superView addSubview:self];
}

- (void)dimiss {
    [self removeFromSuperview];
}


#pragma mark - Gesture

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;
}

- (void)pan:(UIGestureRecognizer *)recognizer {
    //empt
}


@end
