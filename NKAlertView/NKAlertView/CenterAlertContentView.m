//
//  CenterAlertContentView.m
//  NKAlertView
//
//  Created by 聂宽 on 2019/3/20.
//  Copyright © 2019 聂宽. All rights reserved.
//

#import "CenterAlertContentView.h"
#import "NKAlertView.h"

#define NKColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation CenterAlertContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.text = @"Restaurant";
        titleLab.textColor = [UIColor grayColor];
        titleLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLab];
        titleLab.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 50);
        
        // shop_invite_icon
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"shop_invite_icon"];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        [self addSubview:imgView];
        imgView.frame = CGRectMake(20,  CGRectGetMaxY(titleLab.frame) + 10, CGRectGetWidth(frame) - 40, CGRectGetHeight(frame) - (CGRectGetMaxY(titleLab.frame) + 10 + 60));
        
        UIView *botVIew = [[UIView alloc] init];
        botVIew.backgroundColor = NKColorWithRGB(0xEFEFF4);
        [self addSubview:botVIew];
        botVIew.frame = CGRectMake(0, CGRectGetHeight(frame) - 50, CGRectGetWidth(frame), 50);
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.backgroundColor = [UIColor whiteColor];
        leftBtn.tag = 11;
        [leftBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [leftBtn addTarget:self action:@selector(botBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [botVIew addSubview:leftBtn];
        leftBtn.frame = CGRectMake(0, 1, (CGRectGetWidth(frame) - 1) * 0.5, 49);
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.backgroundColor = [UIColor whiteColor];
        rightBtn.tag = 12;
        [rightBtn setTitle:@"Invite friend" forState:UIControlStateNormal];
        [rightBtn setTitleColor:NKColorWithRGB(0xFED953) forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [rightBtn addTarget:self action:@selector(botBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [botVIew addSubview:rightBtn];
        rightBtn.frame = CGRectMake((CGRectGetWidth(frame) - 1) * 0.5 + 1, 1, (CGRectGetWidth(frame) - 1) * 0.5, 49);
    }
    return self;
}

- (void)botBtnClick:(UIButton *)btn
{
    NKAlertView *alertView = (NKAlertView *)self.superview;
    [alertView hide];
    if (btn.tag == 11) {
        
    }else
    {
        
    }
}

@end
