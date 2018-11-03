//
//  ViewB.m
//  KVOTestDemo
//
//  Created by dangercheng on 2018/11/1.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "ViewB.h"

@interface ViewB()
@property (nonatomic, weak) UILabel *countLabel;
@end

@implementation ViewB

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.countValue = 0;
        [self addLabel];
    }
    return self;
}

- (void)addLabel {
    UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    valueLabel.textColor = UIColor.whiteColor;
    valueLabel.font = [UIFont systemFontOfSize:30];
    valueLabel.text = [NSString stringWithFormat:@"%@", @(self.countValue)];
    
    self.countLabel = valueLabel;
    [self addSubview:valueLabel];
}

- (void)increaseValue {
    self.countValue++;
    self.countLabel.text = [NSString stringWithFormat:@"%@", @(self.countValue)];
}

- (void)dealloc {
    NSLog(@"ViewB dealloc");
}

@end
