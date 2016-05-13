//
//  ChannelCollectionViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChannelCollectionViewCellDelegate <NSObject>

- (void)didLongPressAChannelCell;
- (void)deleteTheCellAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface ChannelCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *channelName;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (nonatomic, strong) NSIndexPath *theIndexPath;
@property (nonatomic, weak) id delegate;

- (void)startShake;
- (void)stopShake;

@end

