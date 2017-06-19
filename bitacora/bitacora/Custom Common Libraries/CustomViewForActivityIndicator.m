//
//  CustomView.m
//  datafetchingUsingSession
//
//  Created by Aleena joseph on 07/06/17.
//  Copyright © 2017 Aleena joseph. All rights reserved.
//

#import "CustomViewForActivityIndicator.h"

@implementation CustomViewForActivityIndicator

#pragma mark -  Custom Method
-(id)initWithMessage:(NSString *)message{
    //This function is used to setup  the activity indicator and label
    self = [super init];
    if(self){
        UILabel *messageLabel=[[UILabel alloc] init];
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]
                                                initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [self addSubview:messageLabel];
        [self addSubview:indicatorView];
        
        [messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [indicatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        messageLabel.text=message;
        messageLabel.numberOfLines=0;
        messageLabel.lineBreakMode=NSLineBreakByWordWrapping;
        messageLabel.textAlignment=NSTextAlignmentCenter;
        messageLabel.font=[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18];
        messageLabel.textColor=[UIColor whiteColor];
        
        [indicatorView startAnimating];
        indicatorView.backgroundColor = [UIColor blackColor];
        
        
        //Adding constraints to the activity indicator and label
       NSLayoutConstraint *contstraint =[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:indicatorView attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:messageLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:120.0];
        [self addConstraint:contstraint];
        
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        
    }
    return  self;
}

-(void)showIndicator{
    //This Function is used to show the Activity indicator
    self.alpha=0;
    [self addAndbindViewWithContraints];
    [UIView animateWithDuration:0.2 animations:^{self.alpha = 1.0;} completion:nil];
}

-(void)addAndbindViewWithContraints{
    //This function is used to add and relate the objects with window
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
    UIWindow *window=[[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *contstraint =[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeTop  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint =[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeRight  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint =[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint =[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeLeft  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
}

@end
