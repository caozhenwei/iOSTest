//
//  NSObjectIMPLVC.m
//  iOSTest
//
//  Created by caozhenwei on 2019/7/15.
//  Copyright © 2019 czw. All rights reserved.
//

#import "NSObjectIMPLVC.h"
#import "NSObjectIMPL.h"

struct NSObject_IMPL {
    Class *isa;
    int _name;
    int _height;
};

@interface NSObjectIMPLVC ()

@end

@implementation NSObjectIMPLVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObjectIMPL *obj = [[NSObjectIMPL alloc] init];
    obj->_height = 111;
    obj->_name = 222;
    
    struct NSObject_IMPL *obj_IMPL = (__bridge struct Son_IMPL *)obj;
    NSLog(@"%d,%d",obj_IMPL->_height,obj_IMPL->_name);// 111,222
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
