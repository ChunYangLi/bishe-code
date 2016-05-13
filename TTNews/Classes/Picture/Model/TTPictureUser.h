//
//  TTPictureUser.h
//  TTNews
//
//  Created by 李春阳 on 15/5/3.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <Foundation/Foundation.h>

//user messgae
@interface TTPictureUser : NSObject<NSCoding>
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *profile_image;
@property (nonatomic, copy) NSString *sex;
@end
