//
//  UIImageView+Extension.h
//  TTNews
//
//  Created by 李春阳 on 15/12/30.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>


//image扩展，添加imageVie网络请求的方法
@interface UIImageView (Extension)

-(void)TT_setImageWithURL:(NSURL *)url;

-(void)TT_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(void (^)(UIImage *image, NSError *error))complete;

- (void)TT_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NSInteger)options progress:(void (^)(NSInteger receivedSize, NSInteger expectedSize))progressBlock completed:(void (^)(UIImage *image, NSError *error))complete;

- (void)TT_setImageAfterClickWithURL:(NSURL *)url;


@end
