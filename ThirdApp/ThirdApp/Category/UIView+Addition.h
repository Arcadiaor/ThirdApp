//
//  UIView+Addition.h
//  OneApp
//
//  Created by leiyong on 2019/4/29.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Addition)

- (UIImage *)captureView;

@end

typedef enum {
    UIViewBorderOptionTop = 0,
    UIViewBorderOptionRight,
    UIViewBorderOptionBottom,
    UIViewBorderOptionLeft,
    UIViewBorderOptionAll
}UIViewBorderOption;

@interface UIView (Border)

- (void) setBorder: (UIViewBorderOption)option  width:(CGFloat)width color: (UIColor *)color;
- (void) setDashBorder: (UIViewBorderOption)option  width:(CGFloat)width color: (UIColor *)color;
- (void) roundCornerWithDashBorder: (CGFloat)radius width: (CGFloat)widht color: (UIColor *)color;

@end


@interface UIView (FrameAdditions)
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float width;
@property (nonatomic) float height;
@property (nonatomic,getter = y,setter = setY:) float top;
@property (nonatomic,getter = x,setter = setX:) float left;
@property (nonatomic) float buttom;
@property (nonatomic) float right;
@property (nonatomic) CGSize size;
@property (nonatomic) CGPoint origin;


/**
 新增中心点
 */
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end


@interface UIView(ScreenShot)

+ (UIImage *)screenShot;
+ (UIImage *)screenShotWithoutStatusBar;

@end



@interface UIView (Gesture)

- (UILongPressGestureRecognizer *)addLogPressGestureWithTarget:(id)target selecter:(SEL)aSelector;

@end


@interface UIView (Layer)

- (void)drawLineWithColor:(UIColor *)lineColor
                lineWidth:(CGFloat)lineWidth
             cornerRaduis:(CGFloat)cornerRaduis;

- (void)drawBackgroundWithColor:(UIColor *)backgroundColor
                   cornerRaduis:(CGFloat)cornerRaduis;

- (void)drawBackgroundWithColor:(UIColor *)backgroundColor
                     rectCorner:(UIRectCorner)corner
                         raduis:(CGFloat)raduis;

- (void)drawShadowWithColor:(UIColor *)color;

#pragma mark -

- (void)showLoadingView;
- (void)dismissLoadingView;


@end

NS_ASSUME_NONNULL_END
