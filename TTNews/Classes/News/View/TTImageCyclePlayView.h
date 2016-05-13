//
//  TTImageCyclePlayView.h
//  TTNews
//
//  Created by 李春阳 on 15/4/15.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>


//首页轮播图
@protocol TTImageCyclePlayViewDelegate <NSObject>
@optional

- (void)clickCurrentImageViewInImageCyclePlay;

@end

@interface TTImageCyclePlayView : UIView

@property (nonatomic, strong) NSArray *imageUrls;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, assign) NSInteger currentMiddleImageViewIndex;
@property (nonatomic, weak) id<TTImageCyclePlayViewDelegate> delegate;


-(instancetype)initWithFrame:(CGRect)frame;

- (void)updateImageViewsAndTitleLabel;
- (void)addTimer;
- (void)removeTimer;

- (void)updateToDaySkinMode;
- (void)updateToNightSkinMode;

@end
