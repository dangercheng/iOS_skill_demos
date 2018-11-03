//
//  BigImageDownloader.m
//  strongSelf
//
//  Created by dangercheng on 2018/11/2.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import "BigImageDownloader.h"

@interface BigImageDownloader()
@property (nonatomic, copy) void (^completion)(UIImage *image) ;
@end

@implementation BigImageDownloader

+ (instancetype)shareDownloader {
    static BigImageDownloader *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [BigImageDownloader new];
    });
    return instance;
}

- (void)requestBigImageWithUrl:(NSString *)url completion:(void (^)(UIImage *image))completion {
    self.completion = completion;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //模拟弱网需要3秒下载
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImage *bigImg = [UIImage imageNamed:url];
            if(completion) completion(bigImg);
        });
    });
}

@end
