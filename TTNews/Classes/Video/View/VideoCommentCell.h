//
//  VideoCommentCell.h
//  TTNews
//
//  Created by 李春阳 on 15/1/5.
//  Copyright © 2015年 李春阳. All rights reserved.
//v

#import <UIKit/UIKit.h>
@class TTVideoComment;

@interface VideoCommentCell : UITableViewCell
/** 评论 */
@property (nonatomic, strong) TTVideoComment *comment;
-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;
@end
