
//
//  NormalNews.m
//  TTNews
//
//  Created by 李春阳 on 15/4/10.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "TTNormalNews.h"

@implementation TTNormalNews

-(void)setPubDate:(NSString *)pubDate {
    _pubDate = pubDate;
    _createdtime = [[[pubDate stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@":" withString:@""].integerValue;
}

-(void)setImageurls:(NSArray *)imageurls {
    _imageurls = imageurls;
    
    //    自定义属性
    CGFloat kScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat horizontalMargin = 10;
    CGFloat verticalMargin = 15;
    CGFloat controlMargin = 5;
    CGFloat titleLabelHeight = 19.5;
    CGFloat descLabelHeight = 31;
    CGFloat commentLabelHeight = 13.5;
    
    
    //    一般新闻多图模式，当图片大于等于3张时，显示前三张
    if (imageurls.count>=3) {
        self.normalNewsType = NormalNewsTypeMultiPicture;
        self.cellHeight = verticalMargin + titleLabelHeight + horizontalMargin + ((kScreenWidth - 4 *horizontalMargin)/3)*3/4 + controlMargin + commentLabelHeight + controlMargin;
        //        无图模式
    } else if (imageurls.count==0) {
        self.normalNewsType = NormalNewsTypeNoPicture;
        self.cellHeight = verticalMargin + titleLabelHeight + controlMargin + descLabelHeight + controlMargin + commentLabelHeight + controlMargin;
        //        0《图片数量《3
    } else {
        self.normalNewsType = NormalNewsTypeSigalPicture;
        self.cellHeight = verticalMargin + titleLabelHeight + controlMargin + descLabelHeight + controlMargin + commentLabelHeight + controlMargin;
    }
    
    
}
@end
