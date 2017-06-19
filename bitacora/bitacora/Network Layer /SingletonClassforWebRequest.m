//
//  SingletonClass.m
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "SingletonClassforWebRequest.h"

@implementation SingletonClassforWebRequest

#pragma mark Singleton Methods

+ (id)sharedManager{
    static SingletonClassforWebRequest *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init{
    if (self = [super init]){
        
    }
    return self;
}


#pragma mark - Common Web Request Methods

//for GET Method
-(void)commonGETMethod :(NSString *)strGETURL :(void (^)(NSDictionary *dictionary, NSError *error)) completionBlock {
    NSString *strUrl = strGETURL;
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfig.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if(data != nil){
                                          NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                                          completionBlock (dictResponse, error);
                                      }
                                  }];
    [task resume];
}

//for POST Method
-(void)commonPOSTMethod :(NSString *)strPOSTURL :(void (^) (NSDictionary *dictionary, NSError *error))completionBlock {
    NSString *strUrl = strPOSTURL;
    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField: @"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(data != nil){
            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            completionBlock (dictResponse, error);
        }
    }];
    [task resume];
}

@end
