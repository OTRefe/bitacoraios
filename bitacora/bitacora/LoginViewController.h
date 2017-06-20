//
//  LoginViewController.h
//  bitacora
//
//  Created by Aleena joseph on 20/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bitacora_Constants.h"

@interface LoginViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *loginWebView;
@end
