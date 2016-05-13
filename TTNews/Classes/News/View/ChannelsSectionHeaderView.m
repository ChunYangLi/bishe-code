//
//  ChannelsSectionHeaderView.m
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "ChannelsSectionHeaderView.h"


//collection HeadView ,显示标签的类别
@implementation ChannelsSectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        CGFloat margin = 15;
        UILabel *label = [[UILabel alloc] init];
        self.titleLabel = label;
        label.frame = CGRectMake(margin, 0, [UIScreen mainScreen].bounds.size.width - 2*margin, frame.size.height);
        [self addSubview:label];
    }
    return self;
}

@end
