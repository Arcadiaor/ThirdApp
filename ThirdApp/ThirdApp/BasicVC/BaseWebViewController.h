//
//  BaseWebViewController.h
//  OneApp
//
//  Created by leiyong on 2019/5/8.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : BaseViewController

- (instancetype)initWithURLString:(NSString *)URLString
                            title:(NSString *)title;

@property (nonatomic, assign) BOOL isHidNavigationBar;

@end

NS_ASSUME_NONNULL_END
