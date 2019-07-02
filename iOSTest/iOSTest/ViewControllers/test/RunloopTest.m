//
//  RunloopTest.m
//  iOSTest
//
//  Created by caozhenwei on 2019/6/19.
//  Copyright © 2019 czw. All rights reserved.
//

#import "RunloopTest.h"

@implementation RunloopTest

+ (void)observerTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        /**
         param1: 给observer分配存储空间
         param2: 需要监听的状态类型:kCFRunLoopAllActivities监听所有状态
         param3: 是否每次都需要监听，如果NO则一次之后就被销毁，不再监听，类似定时器的是否重复
         param4: 监听的优先级，一般传0
         param5: 监听到的状态改变之后的回调
         return: 观察对象
         */
        CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            switch (activity) {
                case kCFRunLoopEntry:
                    NSLog(@"即将进入runloop");
                    break;
                case kCFRunLoopBeforeTimers:
                    NSLog(@"即将处理timer");
                    break;
                case kCFRunLoopBeforeSources:
                    NSLog(@"即将处理input Sources");
                    break;
                case kCFRunLoopBeforeWaiting:
                    NSLog(@"即将睡眠");
                    break;
                case kCFRunLoopAfterWaiting:
                    NSLog(@"从睡眠中唤醒，处理完唤醒源之前");
                    break;
                case kCFRunLoopExit:
                    NSLog(@"退出");
                    break;
                default:
                    break;
            }
        });
        // 没有任何事件源则不会进入runloop
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doFireTimer) userInfo:nil repeats:NO];
        CFRunLoopAddObserver([[NSRunLoop currentRunLoop] getCFRunLoop], observer, kCFRunLoopDefaultMode);
        [[NSRunLoop currentRunLoop] run];
    });
}

+ (void)doFireTimer {
    NSLog(@"---fire---");
}

@end
