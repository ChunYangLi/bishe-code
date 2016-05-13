//
//  PictureCommentViewController.h
//  TTNews
//
//  Created by 李春阳 on 15/5/3.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTPicture;

@interface PictureCommentViewController : UIViewController
/** 帖子模型 */
@property (nonatomic, strong) TTPicture *picture;

@end
