//
//  ZWBaseVC.m
//  iOSTest
//
//  Created by caozhenwei on 2018/4/27.
//  Copyright © 2018 czw. All rights reserved.
//

#import "ZWBaseVC.h"

@interface ZWBaseVC ()

@end

@implementation ZWBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = self.navTitleStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
