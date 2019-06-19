//
//  UIView+Addition.m
//  OneApp
//
//  Created by leiyong on 2019/4/29.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "UIView+Addition.h"
#import <objc/runtime.h>
#import "LYPageLoadingView.h"

@implementation UIView (Addition)
- (UIImage *)captureView
{
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,NO,scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end

@implementation UIView (Border)

- (void) setBorder:(UIViewBorderOption)option width:(CGFloat)width color:(UIColor *)color
{
    CALayer *border = [CALayer layer];
    CGRect frame = self.bounds;
    switch (option) {
        case UIViewBorderOptionTop:
            frame.size.height = width;
            break;
        case UIViewBorderOptionRight:
            frame.origin.x = frame.size.width - width;
            frame.size.width = width;
            break;
        case UIViewBorderOptionBottom:
            frame.origin.y = frame.size.height - width;
            frame.size.height = width;
            break;
        case UIViewBorderOptionLeft:
            frame.size.width = width;
            break;
        case UIViewBorderOptionAll:
            [self setBorder: UIViewBorderOptionBottom width:width color: color];
            [self setBorder: UIViewBorderOptionLeft width:width color: color];
            [self setBorder: UIViewBorderOptionRight width:width color: color];
            [self setBorder: UIViewBorderOptionTop width:width color: color];
            break;
    }
    border.frame = frame;
    border.backgroundColor = [color CGColor];
    [self.layer addSublayer: border];
    
}

- (void) setDashBorder:(UIViewBorderOption)option width:(CGFloat)width color:(UIColor *)color
{
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGRect frame = self.bounds;
    switch (option) {
        case UIViewBorderOptionTop:
            frame.size.height = width;
            [path moveToPoint: CGPointMake(0, 0)];
            [path addLineToPoint: CGPointMake(frame.size.width, 0)];
            break;
        case UIViewBorderOptionRight:
            frame.origin.x = frame.size.width - width;
            frame.size.width = width;
            [path moveToPoint: CGPointMake(frame.size.width, 0)];
            [path addLineToPoint: CGPointMake(frame.size.width, frame.size.height)];
            break;
        case UIViewBorderOptionBottom:
            frame.origin.y = frame.size.height - width;
            frame.size.height = width;
            [path moveToPoint: CGPointMake(0, frame.size.height)];
            [path addLineToPoint: CGPointMake(frame.size.width, frame.size.height)];
            break;
        case UIViewBorderOptionLeft:
            frame.size.width = width;
            [path moveToPoint: CGPointMake(0, 0)];
            [path addLineToPoint: CGPointMake(0, frame.size.height)];
            break;
        case UIViewBorderOptionAll:
            [self setDashBorder: UIViewBorderOptionBottom width:width color: color];
            [self setDashBorder: UIViewBorderOptionLeft width:width color: color];
            [self setDashBorder: UIViewBorderOptionRight width:width color: color];
            [self setDashBorder: UIViewBorderOptionTop width:width color: color];
            break;
    }
    shapelayer.frame = frame;
    
    shapelayer.strokeStart = 0.0;
    shapelayer.strokeColor = color.CGColor;
    shapelayer.fillColor = [[UIColor clearColor] CGColor];
    shapelayer.lineWidth = width;
    shapelayer.lineJoin = kCALineJoinMiter;
    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:2], nil];
    shapelayer.lineDashPhase = 2.0f;
    shapelayer.path = path.CGPath;
    [self.layer addSublayer: shapelayer];
}

- (void) roundCornerWithDashBorder:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: radius];
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.frame = self.bounds;
    shapelayer.strokeStart = 0.0;
    shapelayer.strokeColor = color.CGColor;
    shapelayer.fillColor = [[UIColor clearColor] CGColor];
    shapelayer.lineWidth = width;
    shapelayer.lineJoin = kCALineJoinMiter;
    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:2], nil];
    shapelayer.lineDashPhase = 2.0f;
    shapelayer.path = path.CGPath;
    [self.layer insertSublayer: shapelayer atIndex: 0];
    //[self.layer addSublayer: shapelayer];
    
}

@end


@implementation UIView (FrameAdditions)
-(float) x {
    return self.frame.origin.x;
}

-(void) setX:(float) newX {
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(float) y {
    return self.frame.origin.y;
}

-(void) setY:(float) newY {
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

-(float) width {
    return self.frame.size.width;
}

-(void) setWidth:(float) newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(float) height {
    return self.frame.size.height;
}

-(void) setHeight:(float) newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

-(float) right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(float)newRight{
    CGRect frame = self.frame;
    frame.origin.x = newRight - frame.size.width;
    self.frame = frame;
}

- (float) buttom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setButtom:(float)newButtom{
    //    [self setHeight:fmaxf(newButtom-self.frame.origin.y, 0)];
    //    [self setY:newButtom - self.frame.size.height];
    
    CGRect frame = self.frame;
    frame.origin.y = newButtom - frame.size.height;
    self.frame = frame;
}

- (CGSize) size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint) origin {
    return self.frame.origin;
}

- (void) setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

/**
 *  补充中心点设置
 */
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

@end


@implementation UIView(ScreenShot)

+ (UIImage *)screenShotWithoutStatusBar
{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat barHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    if ([UIApplication sharedApplication].statusBarHidden == NO)
    {
        CGFloat scale = [[UIScreen mainScreen] scale];
        CGRect rect = CGRectMake(0, barHeight * scale, view.bounds.size.width * scale, (view.bounds.size.height - barHeight) * scale);
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
        image = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
        CFRelease(imageRef);
    }
    
    return image;
}

+ (UIImage *)screenShot
{
    
    UIView *view = [UIApplication sharedApplication].keyWindow;
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [[UIScreen mainScreen] scale]);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end



@implementation UIView(Gesture)

- (UILongPressGestureRecognizer *)addLogPressGestureWithTarget:(id)target selecter:(SEL)aSelector
{
    NSAssert([target respondsToSelector:aSelector], @"wrong selectro");
    UILongPressGestureRecognizer *longPressGR =
    [[UILongPressGestureRecognizer alloc] initWithTarget:target
                                                  action:aSelector];
    longPressGR.minimumPressDuration = 0.3;
    [self addGestureRecognizer:longPressGR];
    return longPressGR;
}

@end


@implementation UIView (Layer)

- (void)drawLineWithColor:(UIColor *)lineColor
                lineWidth:(CGFloat)lineWidth
             cornerRaduis:(CGFloat)cornerRaduis {
    
    CAShapeLayer *shapeLayer = objc_getAssociatedObject(self, _cmd);
    if (!shapeLayer) {
        shapeLayer = [[CAShapeLayer alloc] init];
        objc_setAssociatedObject(self, _cmd, shapeLayer, OBJC_ASSOCIATION_RETAIN);
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRaduis];
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = lineColor.CGColor;
    [self.layer insertSublayer:shapeLayer atIndex:0];
}

- (void)drawBackgroundWithColor:(UIColor *)backgroundColor
                   cornerRaduis:(CGFloat)cornerRaduis {
//    if ([TDRTools currentSystemVersion] < 10 &&
//        [self isKindOfClass:[UILabel class]]) {
//        self.layer.cornerRadius = cornerRaduis;
//        self.layer.masksToBounds = YES;
//        self.backgroundColor = backgroundColor;
//    } else
    {
        self.backgroundColor = [UIColor clearColor];
        CAShapeLayer *shapeLayer = objc_getAssociatedObject(self, _cmd);
        if (!shapeLayer) {
            shapeLayer = [[CAShapeLayer alloc] init];
            objc_setAssociatedObject(self, _cmd, shapeLayer, OBJC_ASSOCIATION_RETAIN);
        }
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRaduis];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = backgroundColor.CGColor;
        [self.layer insertSublayer:shapeLayer atIndex:0];
    }
}

- (void)drawBackgroundWithColor:(UIColor *)backgroundColor
                     rectCorner:(UIRectCorner)corner
                         raduis:(CGFloat)raduis; {
    CAShapeLayer *shapeLayer = objc_getAssociatedObject(self, @selector(drawBackgroundWithColor:cornerRaduis:));
    self.backgroundColor = [UIColor clearColor];
    if (!shapeLayer) {
        shapeLayer = [[CAShapeLayer alloc] init];
        objc_setAssociatedObject(self, @selector(drawBackgroundWithColor:cornerRaduis:), shapeLayer, OBJC_ASSOCIATION_RETAIN);
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(raduis, raduis)];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = backgroundColor.CGColor;
    [self.layer insertSublayer:shapeLayer atIndex:0];
}

- (void)drawShadowWithColor:(UIColor *)color {
    CAShapeLayer *shapeLayer = objc_getAssociatedObject(self, @selector(drawBackgroundWithColor:cornerRaduis:));
    self.backgroundColor = [UIColor clearColor];
    if (!shapeLayer) {
        shapeLayer = [[CAShapeLayer alloc] init];
        objc_setAssociatedObject(self, @selector(drawBackgroundWithColor:cornerRaduis:), shapeLayer, OBJC_ASSOCIATION_RETAIN);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
        shapeLayer.path = path.CGPath;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer insertSublayer:shapeLayer atIndex:0];
    }
    shapeLayer.shadowColor = color.CGColor;
}

- (void)showLoadingView {
    LYPageLoadingView * loadingView = objc_getAssociatedObject(self, _cmd);
    if (!loadingView) {
        loadingView = [[LYPageLoadingView alloc] initWithFrame:self.bounds];
        objc_setAssociatedObject(self, _cmd, loadingView, OBJC_ASSOCIATION_RETAIN);
    }
    [loadingView show:self];
}

- (void)dismissLoadingView {
    LYPageLoadingView * loadingView = objc_getAssociatedObject(self, @selector(showLoadingView));
    if (loadingView) {
        [loadingView dimiss];
    }
}



@end
