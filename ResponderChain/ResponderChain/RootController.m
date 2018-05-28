//
//  RootController.m
//  ResponderChain
//
//  Created by dangercheng on 2018/5/23.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import "RootController.h"
#import "FindResponderController.h"

@implementation CellItem

@end

@interface RootController ()
@property (nonatomic, strong) NSMutableArray *cellItems;
@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Root";
    _cellItems = [NSMutableArray array];
    CellItem *cellItem1 = [[CellItem alloc] init];
    cellItem1.title = @"找到响应者";
    cellItem1.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"FindResponderController"];
    [_cellItems addObject:cellItem1];
    
    CellItem *cellItem2 = [[CellItem alloc] init];
    cellItem2.title = @"无法响应的情况";
    cellItem2.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"UnableRespondController"];
    [_cellItems addObject:cellItem2];
    
    CellItem *cellItem3 = [[CellItem alloc] init];
    cellItem3.title = @"点击透传";
    cellItem3.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"OverlappingController"];
    [_cellItems addObject:cellItem3];
    
    CellItem *cellItem4 = [[CellItem alloc] init];
    cellItem4.title = @"特定点击区域";
    cellItem4.controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ClickAreaController"];
    [_cellItems addObject:cellItem4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    CellItem *cellItem = [_cellItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellItem.title;
    cell.detailTextLabel.text = cellItem.desc;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CellItem *cellItem = [_cellItems objectAtIndex:indexPath.row];
    UIViewController *targetController = cellItem.controller;
    [self.navigationController pushViewController:targetController animated:YES];
}


@end
