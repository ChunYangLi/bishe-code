//
//  SendFeedbackViewController.m
//  TTNews
//
//  Created by 李春阳 on 15/3/4.
//  Copyright © 2015年 李春阳. All rights reserved.
//

#import "SendFeedbackViewController.h"
#import "TTConst.h"
#import <SVProgressHUD.h>

@interface SendFeedbackViewController ()<UITextViewDelegate>

@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation SendFeedbackViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBasic];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkinModel) name:SkinModelDidChangedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self updateSkinModel];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark 更新皮肤模式 接到模式切换的通知后会调用此方法
-(void)updateSkinModel {
    NSString *currentSkinModel = [[NSUserDefaults standardUserDefaults] stringForKey:CurrentSkinModelKey];
    if ([currentSkinModel isEqualToString:NightSkinModelValue]) {
        self.view.backgroundColor = [UIColor blackColor];
        self.textView.backgroundColor= [UIColor darkGrayColor];
        self.textView.textColor = [UIColor lightGrayColor];
    } else {//日间模式
        self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        self.textView.backgroundColor= [UIColor whiteColor];
        self.textView.textColor = [UIColor blackColor];
    }
}

-(void)keyboardWillChangeFrame:(NSNotification *)notification {
    CGRect frame = [notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat margin = 20;
    self.textView.frame = CGRectMake(margin, CGRectGetMaxY(self.navigationController.navigationBar.frame) + margin, [UIScreen mainScreen].bounds.size.width - 2*margin, frame.origin.y - 2*margin - CGRectGetMaxY(self.navigationController.navigationBar.frame));
}


//反馈页面设置
-(void)setupBasic {
    self.title = @"反馈";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendFeedBack)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    textView = [[UITextView alloc] init];
    self.textView = textView;
    CGFloat margin = 20;
    textView.frame = CGRectMake(margin, CGRectGetMaxY(self.navigationController.navigationBar.frame) + margin, [UIScreen mainScreen].bounds.size.width - 2*margin, [UIScreen mainScreen].bounds.size.height - 2*margin - CGRectGetMaxY(self.navigationController.navigationBar.frame));
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:18];
    [textView becomeFirstResponder];
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView.layer.cornerRadius = 5;
    textView.layer.masksToBounds = YES;
    [self.view addSubview:textView];
    
    
    placeholderLabel = [[UILabel alloc] init];
    self.placeholderLabel = placeholderLabel;
    placeholderLabel.text = [NSString stringWithFormat:@"感谢您对我们的反馈，我会继续努力"];
    placeholderLabel.textColor = [UIColor grayColor];
    placeholderLabel.frame = CGRectMake(textView.frame.origin.x + 10, textView.frame.origin.y + 10, textView.frame.size.width - 20, 20);
    [self.view addSubview:placeholderLabel];
    
    
}


//发送反馈信息
-(void)sendFeedBack {
    if([textView.text  isEqual: @""]){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有提交反馈内容，请填写后提交" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        [SVProgressHUD showSuccessWithStatus:@"发送成功！"];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView resignFirstResponder];
}

@end
