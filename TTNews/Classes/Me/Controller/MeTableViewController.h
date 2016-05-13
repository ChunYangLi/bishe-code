//
//  MeTableViewController.h
//  TTNews
//
//  Created by 李春阳 on 15/3/4.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeTableViewControllerDelegate <NSObject>
@optional
- (void)shakeCanChangeSkin:(BOOL)status;

@end

@interface MeTableViewController : UITableViewController

@property(nonatomic, weak) id<MeTableViewControllerDelegate> delegate;
@end
