//
//  MultiPictureTableViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiPictureTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, copy) NSString *title;

-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;

@end
