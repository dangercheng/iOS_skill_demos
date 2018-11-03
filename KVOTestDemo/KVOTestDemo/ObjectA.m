//
//  ObjectA.m
//  KVOTestDemo
//
//  Created by dangercheng on 2018/11/2.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "ObjectA.h"

@implementation ObjectA

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if(![object isKindOfClass:[ObjectB class]]) {
        return;
    }
    if(![keyPath isEqualToString:@"valueB"]) {
        return;
    }
    NSLog(@"ObjectA valueB changed:%@", change);
}

@end

@implementation ObjectB

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if(![object isKindOfClass:[ObjectA class]]) {
        return;
    }
    if(![keyPath isEqualToString:@"valueA"]) {
        return;
    }
    NSLog(@"ObjectA valueA changed:%@", change);
}

@end
