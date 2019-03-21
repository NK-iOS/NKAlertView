//
//  NKAlertView.h
//  General
//
//  Created by 聂宽 on 2018/11/30.
//  Copyright © 2018年 聂宽. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    // 从中间弹出
    NKAlertViewTypeDef,
    // 从底部弹出
    NKAlertViewTypeBottom
} NKAlertViewType;

@interface NKAlertView : UIView

@property (nonatomic, assign) NKAlertViewType type;
@property (nonatomic, strong) UIView *contentView;

// 点击背景时候隐藏alert
@property (nonatomic, assign) BOOL hiddenWhenTapBG;

// Show the alert view in current window
- (void)show;

// Hide the alert view
- (void)hide;
@end
