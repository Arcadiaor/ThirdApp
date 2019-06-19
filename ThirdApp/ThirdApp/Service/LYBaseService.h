//
//  LYBaseService.h
//  OneApp
//
//  Created by leiyong on 2019/5/5.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^success)(id responseObject);
typedef void(^failure)(NSError *error);
@interface LYBaseService : NSObject

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure;
+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure ;

+ (void)POST:(NSString *)URLString headers:(nullable NSDictionary <NSString *, NSString *> *)headers parameters:(id)parameters success:(success)success failure:(failure)failure ;
@end

NS_ASSUME_NONNULL_END
