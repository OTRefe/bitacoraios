//
//  CommonFunctionClass.h
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CommonFunctionClass : NSObject

-(void)showAlert :(NSString *)message :(NSString*)title :(UIViewController*)viewController;

-(NSString*)trim :(NSString*)stringToTrim;
-(BOOL)isEmptyString :(NSString*)string;
-(BOOL)isValidPhoneNumber :(NSString*)textFieldText;
-(BOOL)isValidPinCode :(NSString*)textFieldText;
- (BOOL)emailValidation:(NSString *)email ;


@end
