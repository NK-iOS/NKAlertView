//
//  CenterAlertContentView.m
//  NKAlertView
//
//  Created by 聂宽 on 2019/3/20.
//  Copyright © 2019 聂宽. All rights reserved.
//

#import "CenterAlertContentView.h"

@implementation CenterAlertContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
