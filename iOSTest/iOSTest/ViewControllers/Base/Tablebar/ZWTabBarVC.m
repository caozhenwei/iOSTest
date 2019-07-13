//
//  ZWTabBarVC.m
//  iOSTest
//
//  Created by caozhenwei on 2018/4/27.
//  Copyright © 2018 czw. All rights reserved.
//

#import "ZWTabBarVC.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourthVC.h"
#import "ZWBaseNavVC.h"

@interface ZWTabBarVC ()

@property (nonatomic, strong) FirstVC *firstVC;
@property (nonatomic, strong) SecondVC *secondVC;
@property (nonatomic, strong) ThirdVC *thirdVC;
@property (nonatomic, strong) FourthVC *fourthVC;

@end

@implementation ZWTabBarVC

-(instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:[self viewControllers] tabBarItemsAttributes:[self tabBarItemsAttributesForController]];
    return (self = (ZWTabBarVC *)tabBarController);
}

-(NSArray *)viewControllers {
    FirstVC *firstVC = [[FirstVC alloc] init];
    ZWBaseNavVC *firstNavVC = [[ZWBaseNavVC alloc] initWithRootViewController:firstVC];
    
    SecondVC *secondVC = [[SecondVC alloc] init];
    ZWBaseNavVC *secondNavVC = [[ZWBaseNavVC alloc] initWithRootViewController:secondVC];
    
    ThirdVC *thirdVC = [[ThirdVC alloc] init];
    ZWBaseNavVC *thirdNavVC = [[ZWBaseNavVC alloc] initWithRootViewController:thirdVC];

    FourthVC *fourthVC = [[FourthVC alloc] init];
    ZWBaseNavVC *fourthNavVC = [[ZWBaseNavVC alloc] initWithRootViewController:fourthVC];
    
    NSArray *controllers = @[firstNavVC,secondNavVC,thirdNavVC,fourthNavVC];
    return controllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"第一页",
                                                 CYLTabBarItemImage : @"Mine",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"Mine_HighLighted",  /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"第二页",
                                                  CYLTabBarItemImage : @"Mine",
                                                  CYLTabBarItemSelectedImage : @"Mine_HighLighted",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"第三页",
                                                  CYLTabBarItemImage : @"Mine",
                                                  CYLTabBarItemSelectedImage : @"Mine_HighLighted",
                                                  };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"第四页",
                                                  CYLTabBarItemImage : @"Mine",
                                                  CYLTabBarItemSelectedImage : @"Mine_HighLighted",
                                                  };
    
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

@end
