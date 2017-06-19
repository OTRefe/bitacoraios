//
//  SingletonClass.h
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SingletonClassforWebRequest : NSObject

+ (id)sharedManager;

-(void)commonGETMethod :(NSString *)strGETURL :(void (^)(NSDictionary *dictResponse, NSError *error)) completionBlock ;
-(void)commonPOSTMethod :(NSString *)strPOSTURL : (void (^) (NSDictionary *dictResponse , NSError *error)) completionBlock ;

@end
