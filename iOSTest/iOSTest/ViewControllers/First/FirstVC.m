//
//  FirstVC.m
//  iOSTest
//
//  Created by caozhenwei on 2018/4/27.
//  Copyright © 2018 czw. All rights reserved.
//

#import "FirstVC.h"
#import "ZWBaseVC.h"

@interface FirstVC () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
}

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"各种测试";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self initDataSource];
}

- (void)initDataSource {
    _dataArray = @[
                   @{@"NSObjectNatureVC":@"NSNSObject本质"}
                   
                ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:[[dic allKeys] objectAtIndex:0]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = [_dataArray objectAtIndex:indexPath.row];
    ZWBaseVC *clazz = [[NSClassFromString([[dic allKeys] objectAtIndex:0]) alloc] init];
    clazz.navTitleStr = [dic objectForKey:[[dic allKeys] objectAtIndex:0]];
    clazz.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:(UIViewController *)clazz animated:YES];
}

@end
