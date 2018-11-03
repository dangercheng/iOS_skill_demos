//
//  ViewController.m
//  KVOTestDemo
//
//  Created by dangercheng on 2018/11/1.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "ViewController.h"
#import "ViewA.h"
#import "ObjectA.h"
#import "NSObject+FBKVOController.h"

@interface ViewController ()
@property (nonatomic, weak) ViewA *viewA;
@property (nonatomic, strong) ObjectA *objectA;
@property (nonatomic, strong) ObjectB *objectB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self observeWithoutRemoveAction];
}

- (void)observeWithoutRemoveAction {
    //重复添加观察者
    /*
    self.objectA = [ObjectA new];
    self.objectB = [ObjectB new];
    [self.objectA addObserver:self.objectB forKeyPath:@"valueA" options:NSKeyValueObservingOptionNew context:nil];
    [self.objectA addObserver:self.objectB forKeyPath:@"valueA" options:NSKeyValueObservingOptionNew context:nil];
    self.objectA.valueA = 20;
    [self.objectA removeObserver:self.objectB forKeyPath:@"valueA"];
    [self.objectA removeObserver:self.objectB forKeyPath:@"valueA"];
    self.objectB = nil;
    self.objectA = nil;*/
    
    //移除不存在的观察者
    /*
    self.objectA = [ObjectA new];
    self.objectB = [ObjectB new];
    self.objectA.valueA = 20;
    [self.objectA removeObserver:self.objectB forKeyPath:@"valueA"];
    */
    
    //被观察者销毁时还存在有未移除的观察者
    /*self.objectA = [ObjectA new];
    self.objectB = [ObjectB new];
    [self.objectA addObserver:self.objectB forKeyPath:@"valueA" options:NSKeyValueObservingOptionNew context:nil];
    self.objectA.valueA = 20;
    self.objectA = nil;*/
    
    //移除一个已经销毁的观察者
    /*
    self.objectA = [ObjectA new];
    self.objectB = [ObjectB new];
    [self.objectA addObserver:self.objectB forKeyPath:@"valueA" options:NSKeyValueObservingOptionNew context:nil];
    self.objectA.valueA = 20;
    self.objectB = nil;
    [self.objectA removeObserver:self.objectB forKeyPath:@"valueA"];
    self.objectA = nil;*/
    
    //FBKVOController使用起来更安全更简单
    self.objectA = [ObjectA new];
    self.objectB = [ObjectB new];
    [self.objectB.KVOController observe:self.objectA keyPath:@"valueA" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSLog(@"ObjectA valueA changed:%@", change);
    }];
    self.objectA.valueA = 20;
    self.objectA = nil;
    self.objectB = nil;
}



- (void)addSubviews {
    ViewA *viewA = [[ViewA alloc] initWithFrame:CGRectMake(50.0, 100.0, 300.0, 400.0)];
    viewA.backgroundColor = UIColor.greenColor;
    self.viewA = viewA;
    UIButton *releaseViewABtn = [[UIButton alloc] initWithFrame:CGRectMake(50.0, 550.0, 300.0, 50.0)];
    [releaseViewABtn setTitle:@"release" forState:UIControlStateNormal];
    [releaseViewABtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    releaseViewABtn.backgroundColor = UIColor.redColor;
    [self.view addSubview:viewA];
    [self.view addSubview:releaseViewABtn];
    [releaseViewABtn addTarget:self action:@selector(clickReleaseBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickReleaseBtn:(id)sender {
    [self.viewA removeFromSuperview];
    self.viewA = nil;
}


@end
