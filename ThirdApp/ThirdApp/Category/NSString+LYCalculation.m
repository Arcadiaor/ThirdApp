//
//  NSString+LYCalculation.m
//  OneApp
//
//  Created by leiyong on 2019/5/7.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "NSString+LYCalculation.h"

@implementation NSString (LYCalculation)
- (CGSize)size:(CGSize)size font:(CGFloat)fontNum {
    CGSize strSize = [self boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                     attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontNum]}
                                        context:nil].size;
    return strSize;
}
@end
