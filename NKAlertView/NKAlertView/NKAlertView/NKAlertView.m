//
//  NKAlertView.m
//  General
//
//  Created by 聂宽 on 2018/11/30.
//  Copyright © 2018年 聂宽. All rights reserved.
//

#import "NKAlertView.h"

@interface NKAlertView ()
@property (nonatomic, strong) UIView *bgView;
@end

@implementation NKAlertView
- (UIView *)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        if (self.contentView) {
            [self insertSubview:_bgView belowSubview:self.contentView];
        }else
        {
            [self addSubview:_bgView];
        }
    }
    return _bgView;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.alpha = 0;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)show
{
    if (self.type == NKAlertViewTypeBottom) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 1.0;
            self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.contentView.bounds.size.height);
        } completion:nil];
    }else
    {
        self.alpha = 1.0;
        CAKeyframeAnimation * animation;
        animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        animation.duration = 0.30;
        animation.removedOnCompletion = YES;
        animation.fillMode = kCAFillModeForwards;
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        animation.values = values;
        [_contentView.layer addAnimation:animation forKey:nil];
    }
}

- (void)hide
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - set
- (void)setType:(NKAlertViewType)type
{
    _type = type;
    if (self.contentView && _type == NKAlertViewTypeBottom) {
        _contentView.frame = CGRectMake((CGRectGetMaxX(self.frame) - CGRectGetWidth(_contentView.frame)) * 0.5, CGRectGetMaxY(self.frame), CGRectGetWidth(_contentView.frame), CGRectGetHeight(_contentView.frame));
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = _contentView.bounds;
        shapeLayer.path = path.CGPath;
        _contentView.layer.mask = shapeLayer;
    }
}
- (void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    if (self.type == NKAlertViewTypeBottom) {
        _contentView.frame = CGRectMake((CGRectGetMaxX(self.frame) - CGRectGetWidth(_contentView.frame)) * 0.5, CGRectGetMaxY(self.frame), CGRectGetWidth(_contentView.frame), CGRectGetHeight(_contentView.frame));
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = _contentView.bounds;
        shapeLayer.path = path.CGPath;
        _contentView.layer.mask = shapeLayer;
    }else
    {
        _contentView.center = self.center;
    }
    [self addSubview:_contentView];
}

- (void)setHiddenWhenTapBG:(BOOL)hiddenWhenTapBG
{
    _hiddenWhenTapBG = hiddenWhenTapBG;
    if (_hiddenWhenTapBG) {
        [self.bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
}

@end
