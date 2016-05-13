//
//  PictureTableViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/5/4.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TTPicture;

@protocol  PictureTableViewCellDelegate<NSObject>
@optional

-(void)clickMoreButton:(TTPicture *)picture;
-(void)clickCommentButton:(NSIndexPath *)indexPath;

@end

@interface PictureTableViewCell : UITableViewCell

+(instancetype)cell;
-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;

@property (nonatomic, strong) TTPicture *picture;
@property (nonatomic, weak) id<PictureTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
