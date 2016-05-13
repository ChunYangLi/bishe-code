//
//  NSDate+Extension.h
//  TTNews
//
//  Created by 李春阳 on 15/12/30.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

//  比较from和self的时间差值

- (NSDateComponents *)deltaFrom:(NSDate *)from;


// 是否为今年

- (BOOL)isThisYear;


//是否为今天

- (BOOL)isToday;


// 是否为昨天

- (BOOL)isYesterday;
@end
