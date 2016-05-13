//
//  TTJudgeNetworking.h
//  TTNews
//
//  Created by 李春阳 on 16/1/3.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface TTJudgeNetworking : NSObject

typedef NS_ENUM(NSUInteger, NetworkingType) {
    //    定义网络状态
    NetworkingTypeNoReachable = 1,
    NetworkingType3G = 2,
    NetworkingTypeWiFi = 3,
};

+ (BOOL)judge;

+ (NetworkingType)currentNetworkingType;
@end
