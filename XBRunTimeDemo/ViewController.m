//
//  ViewController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/2.
//  Copyright © 2019 Sky. All rights reserved.
//  https://www.jianshu.com/p/bcfb67089b2b, https://www.cnblogs.com/someonelikeyou/p/8560156.html, https://www.jianshu.com/p/6ebda3cd8052, http://yulingtianxia.com/blog/2016/06/15/Objective-C-Message-Sending-and-Forwarding/

#import "ViewController.h"
#import "Classes/ClassController.h"
#import "Classes/MemberVariablesController.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RunTimeDemo";
    [self.view addSubview:self.tableView];
}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

#pragma UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.row) {
        case 0: {
            ClassController *vc = [ClassController new];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
        case 1: {
            MemberVariablesController *vc = [MemberVariablesController new];
            [self.navigationController pushViewController:vc animated:true];
        }
            break;
        default:
            break;
    }
    
}


#pragma get
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = self.view.frame;
        _tableView.rowHeight = 50;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}
-(NSArray *)array {
    if (!_array) {
        _array = @[@"类Demo",
                   @"成员变量Demo"];
    }
    return _array;
}

@end
