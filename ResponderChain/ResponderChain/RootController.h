//
//  RootController.h
//  ResponderChain
//
//  Created by dangercheng on 2018/5/23.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellItem: NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, strong) UIViewController *controller;
@end

@interface RootController : UITableViewController

@end
