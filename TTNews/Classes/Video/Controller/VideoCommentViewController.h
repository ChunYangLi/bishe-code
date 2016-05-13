//
//  VideoCommentViewController.h
//  TTNews
//
//  Created by 李春阳 on 15/1/5.
//  Copyright © 2015年 李春阳. All rights reserved.
//
#import <UIKit/UIKit.h>

@class TTVideo;
@class VideoTableViewCell;
@interface VideoCommentViewController : UIViewController
/** 帖子模型 */
@property (nonatomic, strong) TTVideo *video;

@end
