# JS拦截学习笔记

如果在 WKWebView 中使用 alert、confirm 等弹窗，就得实现 WKWebView 的WKUIDelegate中相应的代理方法。
例如，我在 JS 中要显示 alert 弹窗，就必须实现如下代理方法，否则 alert 并不会弹出。

```
#pragma mark - WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}
```

