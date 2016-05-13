//
//  TTPictureUser.m
//  TTNews
//
//  Created by 李春阳 on 15/5/3.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "TTPictureUser.h"
#import <MJExtension.h>

@implementation TTPictureUser

//json
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self=[super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [self mj_encode:aCoder];
}

@end
