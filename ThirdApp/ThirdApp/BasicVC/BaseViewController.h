//
//  BaseViewController.h
//  OneApp
//
//  Created by leiyong on 2019/4/30.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> presentedAnimationC;
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> dismissAnimationC;

/// 赋值该属性的时候请调用 sizeToFit
@property (nonatomic, strong) UIButton *rightBtn;

- (void)clickBack;

- (void)clickRightButton:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
