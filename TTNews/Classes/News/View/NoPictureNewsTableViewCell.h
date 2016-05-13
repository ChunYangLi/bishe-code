//
//  NoPictureNewsTableViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//


//无图模式
#import <UIKit/UIKit.h>

@interface NoPictureNewsTableViewCell : UITableViewCell


//新闻JSON数据Key
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *contentText;


//更新皮肤
-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;

@end
