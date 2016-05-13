//
//  TTDataTool.h
//  TTNews
//
//  Created by 李春阳 on 16/1/5.
//  Copyright © 2016年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TTVideo;
@class TTHeaderNews;
@class TTVideoFetchDataParameter;
@class TTPictureFetchDataParameter;
@class TTNormalNewsFetchDataParameter;
@interface TTDataTool : NSObject

+(void)videoWithParameters:(TTVideoFetchDataParameter *)videoParameters success:(void (^)(NSArray *array, NSString *maxtime))success failure:(void (^)(NSError *error))failure;

+(void)pictureWithParameters:(TTPictureFetchDataParameter *)pictureParameters success:(void (^)(NSArray *array, NSString *maxtime))success failure:(void (^)(NSError *error))failure;


+(void)TTNormalNewsWithParameters:(TTNormalNewsFetchDataParameter *)normalNewsParameters success:(void (^)(NSMutableArray *array))success failure:(void (^)(NSError *error))failure;

+(void)TTHeaderNewsFromServerOrCacheWithMaxTTHeaderNews:(TTHeaderNews *)headerNews success:(void (^)(NSMutableArray *array))success failure:(void (^)(NSError *error))failure;

+(void)deletePartOfCacheInSqlite;


@end
