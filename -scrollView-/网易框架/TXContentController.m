//
//  TXContentController.m
//  网易框架
//
//  Created by mac on 15-3-11.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import "TXContentController.h"
@interface TXContentController ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TXContentController
    static NSString *ID = @"cell";
- (void)viewDidLoad{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma <UITabBarControllerDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;

}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%ld",self.title,indexPath.row];
    return cell;
}

@end
