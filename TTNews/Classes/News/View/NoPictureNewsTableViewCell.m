//
//  NoPictureNewsTableViewCell.m
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "NoPictureNewsTableViewCell.h"

@interface NoPictureNewsTableViewCell()


//XIB UI
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UIView *separatorLine;

@end

@implementation NoPictureNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.commentCountLabel.text = [NSString stringWithFormat:@"%d评论",arc4random()%1000];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)setTitleText:(NSString *)titleText {
    _titleText = titleText;
    self.newsTitleLabel.text = titleText;
}

-(void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    self.newsTitleLabel.text  = contentText;
}

//切换至日间模式
-(void)updateToDaySkinMode {
    self.newsTitleLabel.textColor = [UIColor blackColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.separatorLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0  blue:240/255.0  alpha:1.0];
    
    
}

//切换至夜间模式
-(void)updateToNightSkinMode {
    self.newsTitleLabel.textColor = [UIColor grayColor];
    self.contentView.backgroundColor = [UIColor colorWithRed:42/255.0 green:39/255.0 blue:43/255.0 alpha:1.0];
    self.separatorLine.backgroundColor = [UIColor colorWithRed:40/255.0 green:36/255.0  blue:40/255.0  alpha:1.0];
    
    
}

@end
