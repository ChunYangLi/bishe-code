//
//  TTVideoFetchDataParameter.h
//  TTNews
//
//  Created by 李春阳 on 16/1/5.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTVideoFetchDataParameter : NSObject

@property (nonatomic, copy) NSString *recentTime;//最新的video的时间

@property (nonatomic, copy) NSString *remoteTime;//最晚的video的时间

@property (nonatomic, copy) NSString *maxtime;

@property (nonatomic, assign) NSInteger page;

@end
