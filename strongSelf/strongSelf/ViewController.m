//
//  ViewController.m
//  strongSelf
//
//  Created by dangercheng on 2018/11/2.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickPresentBtn:(id)sender {
    ViewController *controllerB = [self.storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    [self presentViewController:controllerB animated:YES completion:nil];
}

@end
