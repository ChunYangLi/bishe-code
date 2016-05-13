//
//  SinglePictureNewsTableViewCell.m
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "SinglePictureNewsTableViewCell.h"
#import "UIImageView+Extension.h"

@interface SinglePictureNewsTableViewCell()

//UI
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIView *separatorLine;
@end
@implementation SinglePictureNewsTableViewCell

- (void)awakeFromNib {
    self.commentCount.text = [NSString stringWithFormat:@"%d评论",arc4random()%1000];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


//image
-(void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    [self.pictureImageView TT_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

-(void)setContentTittle:(NSString *)contentTittle {
    _contentTittle = contentTittle;
    self.newsTittleLabel.text = contentTittle;
}

//排序
-(void)setDesc:(NSString *)desc {
    _desc = desc;
    self.descLabel.text = desc;
}

#pragma mark 切换至日间模式
-(void)updateToDaySkinMode {
    self.newsTittleLabel.textColor = [UIColor blackColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.separatorLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0  blue:240/255.0  alpha:1.0];
    
}

#pragma mark 切换至夜间模式
-(void)updateToNightSkinMode {
    self.newsTittleLabel.textColor = [UIColor grayColor];
    self.contentView.backgroundColor = [UIColor colorWithRed:42/255.0 green:39/255.0 blue:43/255.0 alpha:1.0];
    self.separatorLine.backgroundColor = [UIColor colorWithRed:40/255.0 green:36/255.0  blue:40/255.0  alpha:1.0];
    
    
}

@end
