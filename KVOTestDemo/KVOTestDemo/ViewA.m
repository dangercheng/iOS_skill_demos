//
//  ViewA.m
//  KVOTestDemo
//
//  Created by dangercheng on 2018/11/1.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "ViewA.h"
#import "ViewB.h"

@interface ViewA()
@property (nonatomic, weak) ViewB *viewB;
@end

@implementation ViewA

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addViewB];
        [self addButton];
    }
    return self;
}

- (void)addViewB {
    ViewB *viewB = [[ViewB alloc] initWithFrame:CGRectMake(50.0, 50.0, 200.0, 200.0)];
    viewB.backgroundColor = UIColor.blueColor;
    self.viewB = viewB;
    [self addSubview:viewB];
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [viewB addObserver:self forKeyPath:@"countValue" options:options context:nil];
}

- (void)addButton {
    UIButton *increaseBtn = [[UIButton alloc] initWithFrame:CGRectMake(50.0, 300.0, 200.0, 50.0)];
    increaseBtn.backgroundColor = UIColor.whiteColor;
    [increaseBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [increaseBtn setTitle:@"increase" forState:UIControlStateNormal];
    [self addSubview:increaseBtn];
    [increaseBtn addTarget:self action:@selector(clickIncreaseBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if(![object isEqual:self.viewB]) {
        return;
    }
    if(![keyPath isEqualToString:@"countValue"]) {
        return;
    }
    
    NSLog(@"ObserveValueChanged: %@", change);
}

- (void)clickIncreaseBtn:(id)sender {
    [self.viewB increaseValue];
}

- (void)dealloc {
    NSLog(@"ViewA dealloc");
}
@end
