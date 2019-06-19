//
//  LYBaseService.m
//  OneApp
//
//  Created by leiyong on 2019/5/5.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "LYBaseService.h"
#import "AFHTTPSessionManager.h"

@implementation LYBaseService

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure {

     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:URLString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(success)success failure:(failure)failure {


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager POST:URLString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];

}

+ (void)POST:(NSString *)URLString headers:(NSDictionary<NSString *,NSString *> *)headers parameters:(id)parameters success:(success)success failure:(failure)failure {


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager POST:URLString parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
