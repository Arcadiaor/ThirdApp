//
//  LYMenuViewController.m
//  SecondApp
//
//  Created by leiyong on 2019/5/15.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "LYMenuViewController.h"
#import "LYMenuView.h"
#import "BasicNavigationControler.h"

@interface LYMenuViewController ()

@property (nonatomic ,strong)LYMenuView * menuView;

@end

@implementation LYMenuViewController

-(instancetype)init{
    if (self = [super init]) {
        _frontViewContainer = [[UIView alloc] init];
    }
    return self;
}



-(instancetype)initWithFrontView:(BasicNavigationControler *)frontView AndButtonTitleArr:(NSArray *)titleArr{
    self = [self init];
    if (self) {
        _frontView = frontView;
        _buttonTitles = titleArr;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.frontViewContainer];
    [self creatMenuView];
    if (self.frontView) {
        [self setDefaultFrontView:self.frontView];
    }
}


-(void)setDefaultFrontView:(BasicNavigationControler *)frontView{
    self.frontViewContainer.frame = self.view.bounds;
    self.frontViewContainer.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addChildViewController:self.frontView];
    self.frontView.view.frame = self.view.bounds;
    [self.frontViewContainer addSubview:self.frontView.view];
    [self.frontView didMoveToParentViewController:self];
}

-(void)changeViweControllerWithView:(BasicNavigationControler *)viewController{
    [self hideViewController:_frontView];
    _frontView = viewController;
    [self setDefaultFrontView:_frontView];
}

- (void)hideViewController:(UIViewController *)viewController
{
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}

-(void)creatMenuView{
    
    _menuView = [[LYMenuView alloc]initWithTitles:self.buttonTitles];
    __block typeof(self)  weakSelf = self;
    _menuView.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
//        NSLog(@"index:%ld title:%@ titleCounts:%ld",index,title,titleCounts);
        if (weakSelf.viewControllersArr.count > 0) {
            [weakSelf changeViweControllerWithView:weakSelf.viewControllersArr[index]];
        }
    };
}


-(void)setFrontView:(BasicNavigationControler *)frontView{
    if (_frontView == frontView) {
        return;
    }
    [self setDefaultFrontView:frontView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
