//
//  TTJudgeNetworking.m
//  TTNews
//
//  Created by 李春阳 on 16/1/3.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import "TTJudgeNetworking.h"
#import "Reachability.h"

@implementation TTJudgeNetworking

+ (BOOL)judge {
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        return NO;
    }
    return YES;
}


//判断网络状态
+(NetworkingType)currentNetworkingType {
    Reachability *reachablility =  [Reachability reachabilityWithHostName:@"www.baidu.com"];
    if ([reachablility currentReachabilityStatus] == ReachableViaWiFi) {
        return NetworkingTypeWiFi;
    } else if ([reachablility currentReachabilityStatus] == ReachableViaWWAN) {
        return NetworkingType3G;
    }
    return NetworkingTypeNoReachable;
}
@end
