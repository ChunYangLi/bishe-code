//
//  TTNormalNewsFetchDataParameter.h
//  TTNews
//
//  Created by 李春阳 on 16/1/5.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTNormalNewsFetchDataParameter : NSObject

@property (nonatomic, assign) NSInteger recentTime;//最新的picture的时间
@property (nonatomic, assign) NSInteger remoteTime;//最晚的picture的时间

@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *channelName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger page;

@end
