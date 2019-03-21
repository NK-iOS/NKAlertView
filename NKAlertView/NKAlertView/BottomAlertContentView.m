//
//  BottomAlertContentView.m
//  NKAlertView
//
//  Created by 聂宽 on 2019/3/20.
//  Copyright © 2019 聂宽. All rights reserved.
//

#import "BottomAlertContentView.h"
#import "NKAlertView.h"

#define NKColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BottomAlertContentView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BottomAlertContentView

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];

        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.text = @"Restaurant";
        titleLab.textColor = [UIColor grayColor];
        titleLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLab];
        titleLab.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 50);
        
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(titleLab.frame), CGRectGetWidth(frame), CGRectGetHeight(frame) - 100);
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.backgroundColor = NKColorWithRGB(0xFED953);
        rightBtn.tag = 12;
        [rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [rightBtn addTarget:self action:@selector(botBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        rightBtn.frame = CGRectMake(0, CGRectGetHeight(frame) - 40, CGRectGetWidth(frame), 35);
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = @"UITableViewCell";
    return cell;
}

- (void)botBtnClick:(UIButton *)btn
{
    NKAlertView *alertView = (NKAlertView *)self.superview;
    [alertView hide];
}

@end
