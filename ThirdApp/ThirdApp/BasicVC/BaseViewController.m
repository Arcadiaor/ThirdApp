//
//  BaseViewController.m
//  OneApp
//
//  Created by leiyong on 2019/4/30.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithARGBHex:0xFFf5f7fa];
    //防止右滑手势退出VC，会自动出现“返回”button
    //self.navigationItem.backBarButtonItem = nil;
    //self.navigationItem.hidesBackButton = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;   //设置边沿不延伸
    UIImage *image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.rightBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
}

#pragma makr - action

- (void)clickBack {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)clickRightButton:(UIButton *)btn {
    
}

@end
