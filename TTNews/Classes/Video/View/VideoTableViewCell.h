//
//  VideoTableViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/1/5.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayView.h"
@class VideoPlayView;
@class TTVideo;

@protocol  VideoTableViewCellDelegate<NSObject>

@optional

-(void)clickMoreButton:(TTVideo *)video;
-(void)clickVideoButton:(NSIndexPath *)indexPath;
-(void)clickCommentButton:(NSIndexPath *)indexPath;

@end

@interface VideoTableViewCell : UITableViewCell

+(instancetype)cell;
-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;
@property (nonatomic, strong) TTVideo *video;
@property (nonatomic, weak) id<VideoTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) VideoPlayView *playView;

@end
