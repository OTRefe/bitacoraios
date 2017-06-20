//
//  LoginViewController.m
//  bitacora
//
//  Created by Aleena joseph on 20/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController (){
    NSHTTPCookie *cookie;
    NSUserDefaults *userTokenDefaults;
}
@end

@implementation LoginViewController
#pragma mark -View Load Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    userTokenDefaults = [NSUserDefaults standardUserDefaults];
    NSURL* bitacoraWebUrl = [NSURL URLWithString:LOGINURL];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:bitacoraWebUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    [_loginWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - WebView Delegate Methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeFormSubmitted) {
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];//To store the cookies to the cookieStorage object
        for (cookie in [cookieStorage cookies]) {
            if ([cookie.name  isEqual: @"CSRF-TOKEN"] ) {
                [userTokenDefaults setObject:cookie.value forKey:@"X-CSRF-TOKEN"];//To store the Token value in userdefaults
                NSLog(@"CSRF Token Value is %@",cookie.value);
                // [self performSegueWithIdentifier:@"show" sender:self];//performing navigation to the next controller
            }
        }
    }
    return YES;
}


#pragma mark - Navigation
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier  isEqual: @"show"]) {
//        ViewController2 *vco = segue.destinationViewController;
//        vco.tokenFromSegue = cookie.value;
//    }
//}
//

@end
