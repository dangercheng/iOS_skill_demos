//
//  BViewController.m
//  strongSelf
//
//  Created by dangercheng on 2018/11/2.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "BViewController.h"
#import "BigImageDownloader.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"BViewController";
    __weak typeof(self) _self = self;
    [[BigImageDownloader shareDownloader] requestBigImageWithUrl:@"BigImg" completion:^(UIImage * _Nonnull image) {
        //在此之前如果点击了dissmiss按钮 BViewController将j会被释放， self = nil;
        __strong typeof(_self) self = _self;
        
        //创建一个UIImageView显示, 并添加水平居中约束
        UIImageView *bigImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 200, 200)];
        bigImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:bigImageView];
        bigImageView.image = image;
        
        //创建约束
        [NSLayoutConstraint constraintWithItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:bigImageView
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0f
                                      constant:0.0f].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.topLayoutGuide
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:bigImageView
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0f
                                      constant:-80.0f].active = YES;
    }];
}

- (IBAction)clickDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"BViewController dealloc.");
}

@end
