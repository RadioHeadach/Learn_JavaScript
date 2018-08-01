//
//  ViewController.m
//  LearnJSOC
//
//  Created by 林恺祺 on 2018/8/1.
//  Copyright © 2018 minstone. All rights reserved.
//

#import "ViewController.h"
#import "WKWebViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HomeSreen";
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
    self.btn.backgroundColor = [UIColor blackColor];
    self.btn.titleLabel.text = @"WKWebView";
    self.btn.titleLabel.textColor = [UIColor whiteColor];
    [self.btn addTarget:self
                 action:@selector(click)
       forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click {
    WKWebViewController *wkWeb = [[WKWebViewController alloc] init];
    [self.navigationController pushViewController:wkWeb animated:YES];
}

@end
