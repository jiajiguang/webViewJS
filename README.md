# webViewJS
使用iOS 系统自带的webView和JS实现交互

1.iOS 去执行JS代码。
  在iOS 的方法中调用webView的[webView stringByEvaluatingJavaScriptFromString:@"ocToJS()"]
  
  ocToJS为我们要调用的js中的方法名称，其中无参形式为：ocToJS()
  
  有一个入参：ocToJS('msg')
  
  有两个入参：ocToJS('msg','msg')
  
2.JS调用OC
  
  在OC中实现webView的代理方法shouldStartLoadWithRequest用来监听URL
  
  双方商定好URL，比如当监听到http://qqqq去执行oc中的aaa（）方法，监听到http://bbbb去执行oc中的bbb（）方法
  
  如果需要传参，双方规定好怎么取参就ok了
