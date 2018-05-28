//
//  BaseView.m
//  ResponderChain
//
//  Created by dangercheng on 2018/5/24.
//  Copyright © 2018年 DandJ. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

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

@end

@implementation RootView
@end

@implementation View1
@end

@implementation View2
- (void)awakeFromNib {
    [super awakeFromNib];
//    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
}

- (void)tapAction:(UITapGestureRecognizer *)recognizer {
    NSLog(@"View2 taped");
}
@end

@implementation View3
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
}

- (void)tapAction:(UITapGestureRecognizer *)recognizer {
    NSLog(@"View3 taped");
}

@end

@implementation View4

@end
@implementation View5
@end

@implementation CircleView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = self.frame.size.width / 2.0f;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    const CGFloat radius = self.frame.size.width / 2.0f;
    CGFloat xOffset = point.x - radius;
    CGFloat yOffset = point.y - radius;
    CGFloat distance = sqrt(xOffset * xOffset + yOffset * yOffset);
    return distance <= radius;
}
@end
