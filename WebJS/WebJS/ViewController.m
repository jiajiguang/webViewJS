//
//  ViewController.m
//  WebJS
//
//  Created by yang on 2017/12/12.
//  Copyright © 2017年 wondertek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    webView.delegate = self;
    
    //只有设置为NO才能手动进行适配
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    // align greenView from the left and right
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(webView)]];
    
    // align greenView from the top and bottom
    float aa = 50;
    NSString *layoutS = [NSString stringWithFormat:@"V:|-%f-[webView]-0-|",aa];
    NSLog(@"%@",layoutS);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:layoutS options:0 metrics:nil views:NSDictionaryOfVariableBindings(webView)]];
    
}
- (void)aaa{
    NSLog(@"oc代码被js调用了");
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"request == %@",request.URL.absoluteString);
    // 根据url的不同做响应的处理，js调用oc
    if ([self respondsToSelector:@selector(aaa)]) {
        [self performSelector:@selector(aaa)];
    }
    
    //oc调用js，在需要执行的地方用webView去调用，参数为js中的方法名称(ocToJS为js中的方法名称)，无参样式ocToJS()，一个参数样式ocToJS(‘msg’)，连个参数ocToJS(‘msg’,'msg2')。名称的话是需要双方商定好的
//    [webView stringByEvaluatingJavaScriptFromString:@"ocToJS()"];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"didStart %@",NSStringFromSelector(_cmd));
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"didFinish");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error = %@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
