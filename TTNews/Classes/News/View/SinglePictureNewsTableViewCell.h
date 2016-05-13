//
//  SinglePictureNewsTableViewCell.h
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePictureNewsTableViewCell : UITableViewCell


//d单张图模式
@property (nonatomic, strong) NSArray *pictureArray;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *contentTittle;
@property (nonatomic, copy) NSString *desc;

-(void)updateToDaySkinMode;
-(void)updateToNightSkinMode;

@end
