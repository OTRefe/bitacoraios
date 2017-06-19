//
//  CommonFunctionClass.m
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "CommonFunctionClass.h"

@implementation CommonFunctionClass

#pragma mark Custom Methods

// String Trimming
-(NSString*)trim :(NSString*)stringToTrim{
    NSString *trimmedString =  [stringToTrim stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return trimmedString;
}

// Empty String Check
-(BOOL)isEmptyString :(NSString*)string{
    if ([string isEqualToString:@""]){
        return TRUE;
    }else{
        return FALSE;
    }
}

// Custom Alert Method
-(void)showAlert :(NSString *)message :(NSString*)title :(UIViewController*)viewController{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alertController addAction:defaultAction];
    [viewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark  Validations

// Email Validation
- (BOOL)emailValidation:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if([emailTest evaluateWithObject:email] == YES){
        return TRUE;
    }else {
        return FALSE;
    }
}


// Phone Number Validation
-(BOOL)isValidPhoneNumber :(NSString*)textFieldText{
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([textFieldText rangeOfCharacterFromSet:notDigits].location == NSNotFound){
        if(textFieldText.length == 10){
            return true;
        }else{
            return FALSE;
        }
    }else{
        return FALSE;
    }
    
}

// Pincode Validation
-(BOOL)isValidPinCode :(NSString*)textFieldText{
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([textFieldText rangeOfCharacterFromSet:notDigits].location == NSNotFound){
        if(textFieldText.length == 6){
            return true;
        }else{
            return FALSE;
        }
    }else{
        return FALSE;
    }
}

@end
