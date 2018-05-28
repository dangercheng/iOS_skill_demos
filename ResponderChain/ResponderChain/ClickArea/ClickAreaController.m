//
//  ClickAreaController.m
//  ResponderChain
//
//  Created by dangercheng on 2018/5/24.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import "ClickAreaController.h"
#import "BaseView.h"

@interface ClickAreaController ()
@property (weak, nonatomic) IBOutlet CircleView *circleView;

@end

@implementation ClickAreaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.circleView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedAction:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapedAction:(UITapGestureRecognizer *)recognizer {
    NSLog(@"circleView taped!");
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
