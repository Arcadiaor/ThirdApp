//
//  UIColor+Hex.h
//  OneApp
//
//  Created by leiyong on 2019/4/29.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(uint)hex;
+ (UIColor *)colorWithARGBHex:(uint)hex;

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)getRandomColor;

@end

NS_ASSUME_NONNULL_END
