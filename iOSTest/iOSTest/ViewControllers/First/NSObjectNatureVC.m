//
//  NSObjectNatureVC.m
//  iOSTest
//
//  Created by caozhenwei on 2019/7/13.
//  Copyright © 2019 czw. All rights reserved.
//

#import "NSObjectNatureVC.h"
#import "SonClass.h"
#import "FatherClass.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface NSObjectNatureVC ()

@end

@implementation NSObjectNatureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL flag1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL flag2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL flag3 = [(id)[SonClass class] isKindOfClass:[SonClass class]];
    BOOL flag4 = [(id)[SonClass class] isMemberOfClass:[SonClass class]];
    NSLog(@"%d,%d,%d,%d",flag1,flag2,flag3,flag4);
    
    //测试 NSObject 占用多少内存
    //class_getInstanceSize：获取对象成员变量的大小(考虑内存对齐)
    //malloc_size：获取指针指向的内存大小
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"class_getInstanceSize_NSObject：%zd",class_getInstanceSize([NSObject class]));
    NSLog(@"malloc_size_NSObject:%zu",malloc_size((__bridge const void *)obj));
    
    FatherClass *facherClass = [[FatherClass alloc] init];
    NSLog(@"class_getInstanceSize_FatherClass：%zd",class_getInstanceSize([FatherClass class]));
    NSLog(@"malloc_size_FatherClass:%zu",malloc_size((__bridge const void *)facherClass));
}

@end
