//
//  ContentTableViewController.h
//  TTNews
//
//  Created by 李春阳 on 15/4/6.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTNormalNews.h"

@interface ContentTableViewController : UITableViewController

//一般新闻table
@property(nonatomic, strong) TTNormalNews *news;
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *channelName;


@end
