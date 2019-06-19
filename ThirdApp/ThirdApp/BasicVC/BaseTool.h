//
//  BaseTool.h
//  OneApp
//
//  Created by leiyong on 2019/5/11.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTool : NSObject

+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
