//
//  TTPictureFetchDataParameter.h
//  TTNews
//
//  Created by 李春阳 on 16/1/5.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTPictureFetchDataParameter : NSObject
@property (nonatomic, copy) NSString *recentTime;//最新的picture的时间

@property (nonatomic, copy) NSString *remoteTime;//最晚的picture的时间

@property (nonatomic, copy) NSString *maxtime;

@property (nonatomic, assign) NSInteger page;//当前页面的Page
@end
