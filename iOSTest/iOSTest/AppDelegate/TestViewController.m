//
//  TestViewController.m
//  iOSTest
//
//  Created by caozhenwei on 2018/6/29.
//  Copyright © 2018 czw. All rights reserved.
//

#import "TestViewController.h"
#import "RunloopTest.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface TestViewController ()

@end

@implementation TestViewController

+(void)load {
    NSLog(@"load");
}

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@1,@4,@2,@3,@5,nil];
    NSMutableArray *arr_M = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < arr_M.count; ++i) {
        //遍历数组的每一个`索引`（不包括最后一个,因为比较的是j+1）
        for (int j = 0; j < arr_M.count-1; ++j) {
            //根据索引的`相邻两位`进行`比较`
            
            NSComparisonResult r = [arr_M[j+1] compare:arr_M[j]];
            if (r == NSOrderedAscending) {
                NSLog(@"arr_M[j+1]小于arr_M[j]");
                [arr_M exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"最终结果：%@",arr_M);

    
    
//    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
//    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
//    BOOL res3 = [[TestViewController class] isKindOfClass:[TestViewController class]];
//    BOOL res4 = [[TestViewController class] isMemberOfClass:[TestViewController class]];
//
//    NSLog(@"%d",res1);
//    NSLog(@"%d",res2);
//    NSLog(@"%d",res3);
//    NSLog(@"%d",res4);
//
//    [RunloopTest observerTest];
    
    NSObject *obj = [[NSObject alloc] init];
    //class_getInstanceSize创建一个实例对象,至少需要多少内存(对齐后)
    NSLog(@"%zd",class_getInstanceSize([NSObject class]));
    //malloc_size接收的参数是一个const void *类型的C语言指针,所以需要将obj这个OC指针做个桥接转成C语言的指针
    NSLog(@"%zu",malloc_size((__bridge const void *)(obj)));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)bubbleSort:(NSMutableArray *)array {
    NSInteger n = array.count;
    for (NSInteger i = 0; i < n; i++) {
        //这里注意下，一定是 n - 1 -i,要不会数组越界
        for (NSInteger j = 0; j < n - 1 - i; j++) {
            NSInteger a = [[array objectAtIndex:j] intValue];
            NSInteger b = [[array objectAtIndex:j+1] intValue];
            if (a > b) {
                [array replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%ld",b]];
                [array replaceObjectAtIndex:j+1 withObject:[NSString stringWithFormat:@"%ld",a]];
            }
        }
    }
    return array;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
