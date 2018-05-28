//
//  FisrtResponderController.m
//  ResponderChain
//
//  Created by dangercheng on 2018/5/23.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import "FindResponderController.h"
#import "BaseView.h"

@interface FindResponderController ()
@property (weak, nonatomic) IBOutlet View3 *view3;

@end

@implementation FindResponderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Find Responder";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIResponder *nextResponder = self.view3.nextResponder;
    NSMutableString *pre = [NSMutableString stringWithString:@"--"];
    NSLog(@"View3");
    while (nextResponder) {
        NSLog(@"%@%@", pre, NSStringFromClass([nextResponder class]));
        [pre appendString:@"--"];
        nextResponder = nextResponder.nextResponder;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesBegan", NSStringFromClass([self class]));
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesMoved", NSStringFromClass([self class]));
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesEnded", NSStringFromClass([self class]));
    [super touchesEnded:touches withEvent:event];
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
