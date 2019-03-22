# NKAlertView
### 我们自定义AlertView：
下边CenterAlertContentView是自定义contentView
```
// 从中间弹出
- (IBAction)centerAlertAction:(id)sender {
NKAlertView *alertView = [[NKAlertView alloc] init];
CenterAlertContentView *customContentView = [[CenterAlertContentView alloc] initWithFrame:CGRectMake(0, 0, 281, 281)];
alertView.contentView = customContentView;
// 点击背景隐藏提示框
alertView.hiddenWhenTapBG = YES;
[alertView show];
}
```

效果：
![2019-03-21 12_47_59.gif](https://upload-images.jianshu.io/upload_images/1721864-573fbe9016ea6b4a.gif?imageMogr2/auto-orient/strip)

### 其他
* 自由开发者交流群：811483008
* 附上：[简书](https://www.jianshu.com/p/95dfc1514584)
