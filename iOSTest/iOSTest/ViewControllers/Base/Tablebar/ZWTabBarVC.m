//
//  ZWTabBarVC.m
//  iOSTest
//
//  Created by caozhenwei on 2018/4/27.
//  Copyright © 2018 czw. All rights reserved.
//

#import "ZWTabBarVC.h"
#import "ZWTabbar.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourthVC.h"

@interface ZWTabBarVC ()

@property (nonatomic, strong) FirstVC *firstVC;
@property (nonatomic, strong) SecondVC *secondVC;
@property (nonatomic, strong) ThirdVC *thirdVC;
@property (nonatomic, strong) FourthVC *fourthVC;

@end

@implementation ZWTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabbar];
    [self addAllChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addTabbar {
    ZWTabbar *tabbar = tabbar = [[ZWTabbar alloc] initWithFrame:self.tabBar.frame];
    [self.tabBar addSubview:tabbar];
    
//    self.tabBar.backgroundColor = [UIColor whiteColor];
//    //去掉系统tabBar的横线
//    [self.tabBar setBackgroundImage:[UIImage new]];
//    [self.tabBar setShadowImage:[UIImage new]];
}

- (void)addAllChildViewControllers {
    
}

@end
