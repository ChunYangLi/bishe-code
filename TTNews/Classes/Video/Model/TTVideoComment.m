//
//  TTVideoComment.m
//  TTNews
//
//  Created by 李春阳 on 15/1/5.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "TTVideoComment.h"
#import <MJExtension.h>

@implementation TTVideoComment

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}


-(void)encodeWithCoder:(NSCoder *)aCoder {
    [self mj_encode:aCoder];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self= [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}


@end
