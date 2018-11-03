//
//  BigImageDownloader.h
//  strongSelf
//
//  Created by dangercheng on 2018/11/2.
//  Copyright © 2018 DandJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigImageDownloader : NSObject

+ (instancetype)shareDownloader;

/**
 模拟在弱网环境下下载一个大图片，耗费超过3秒

 */
- (void)requestBigImageWithUrl:(NSString *)url completion:(void (^)(UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
