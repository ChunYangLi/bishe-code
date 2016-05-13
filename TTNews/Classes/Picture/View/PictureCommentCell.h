//
//  VideoCommentCell.h
//  TTNews
//
//  Created by 李春阳 on 15/5/4.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTPictureComment;

@interface PictureCommentCell : UITableViewCell
/** 评论 */
@property (nonatomic, strong) TTPictureComment *comment;

-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;

@end
