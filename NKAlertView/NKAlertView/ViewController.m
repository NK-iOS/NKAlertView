//
//  ViewController.m
//  NKAlertView
//
//  Created by 聂宽 on 2019/3/20.
//  Copyright © 2019 聂宽. All rights reserved.
//

#import "ViewController.h"
#import "NKAlertView.h"
#import "CenterAlertContentView.h"
#import "BottomAlertContentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 从中间弹出
- (IBAction)centerAlertAction:(id)sender {
    NKAlertView *alertView = [[NKAlertView alloc] init];
    CenterAlertContentView *customContentView = [[CenterAlertContentView alloc] initWithFrame:CGRectMake(0, 0, 281, 281)];
    alertView.contentView = customContentView;
//    alertView.hiddenWhenTapBG = YES;
    [alertView show];
}

// 从底部弹出
- (IBAction)bottomAlertAction:(id)sender {
    NKAlertView *alertView = [[NKAlertView alloc] init];
    BottomAlertContentView *customContentView = [[BottomAlertContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    alertView.type = NKAlertViewTypeBottom;
    alertView.contentView = customContentView;
    alertView.hiddenWhenTapBG = YES;
    [alertView show];
}

@end
