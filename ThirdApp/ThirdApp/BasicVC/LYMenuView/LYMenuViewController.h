//
//  LYMenuViewController.h
//  SecondApp
//
//  Created by leiyong on 2019/5/15.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "BaseViewController.h"
#import "BasicNavigationControler.h"
NS_ASSUME_NONNULL_BEGIN

@interface LYMenuViewController : BaseViewController
@property (nonatomic ,strong) BasicNavigationControler *frontView;
@property (nonatomic ,strong) NSArray * buttonTitles;
@property (nonatomic ,strong) UIView * frontViewContainer;
@property (nonatomic ,strong) NSArray <BasicNavigationControler *> * viewControllersArr;



-(instancetype)initWithFrontView:(BasicNavigationControler *)frontView AndButtonTitleArr:(NSArray *)titleArr;

-(void)setFrontView:(BasicNavigationControler *)frontView;

@end

NS_ASSUME_NONNULL_END
