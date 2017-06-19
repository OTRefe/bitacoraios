//
//  CustomView.m
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

// Custom view with two buttons

-(id)initWithMessage:(NSString *)message andLeftButtonTitle:(NSString *)lTitle andRightButtonTitle:(NSString *)rTitle{
    
    self = [super init];
    if (self) {
        
        UILabel *lblMsg = [[UILabel alloc] init];
        UIButton *btnCancel = [[UIButton alloc] init];
        UIButton *btnOK = [[UIButton alloc] init];
        
        [self addSubview:lblMsg];
        [self addSubview:btnCancel];
        [self addSubview:btnOK];
        
        [lblMsg setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btnCancel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btnOK setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        lblMsg.text = message;
        lblMsg.numberOfLines = 0;
        lblMsg.lineBreakMode = NSLineBreakByWordWrapping;
        lblMsg.textAlignment = NSTextAlignmentCenter;
        lblMsg.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18];
        lblMsg.textColor = [UIColor whiteColor];
        
        
        NSLayoutConstraint *contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        
        contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:280.0];
        [self addConstraint:contstraint];
        
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnCancel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:140.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnCancel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:140.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblMsg attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:btnCancel attribute:NSLayoutAttributeLeft multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint =[NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblMsg attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnCancel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblMsg attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:contstraint];
        
        
        btnOK.backgroundColor = [UIColor grayColor];
        btnCancel.backgroundColor = [UIColor lightGrayColor];
        
        [btnOK setTitle:lTitle forState:UIControlStateNormal];
        [btnCancel setTitle:rTitle forState:UIControlStateNormal];
        
        btnOK.tag = 0;
        btnCancel.tag = 1;
        
        [btnOK addTarget:self action:@selector(buttonClickedWithButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnCancel addTarget:self action:@selector(buttonClickedWithButton:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.55];
    }
    
    return self;
    
}

// Custom view with single button

-(id)initWithMessage:(NSString *)message andCancelButtonTitle:(NSString *)cTitle {
    
    self = [super init];
    if (self) {
        
        UILabel *lblMsg = [[UILabel alloc] init];
        UIButton *btnOK = [[UIButton alloc] init];
        
        [self addSubview:lblMsg];
        [self addSubview:btnOK];
        
        lblMsg.text = message;
        lblMsg.numberOfLines = 0;
        lblMsg.lineBreakMode = NSLineBreakByWordWrapping;
        lblMsg.textAlignment = NSTextAlignmentCenter;
        lblMsg.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:18];
        lblMsg.textColor = [UIColor whiteColor];
        
        
        [lblMsg setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btnOK setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSLayoutConstraint *contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:lblMsg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:280.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:contstraint];
        
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:280.0];
        [self addConstraint:contstraint];
        
        contstraint = [NSLayoutConstraint constraintWithItem:btnOK attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblMsg attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:contstraint];
        
        btnOK.backgroundColor = [UIColor grayColor];
        [btnOK setTitle:cTitle forState:UIControlStateNormal];
        btnOK.tag = 0;
        [btnOK addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
    }
    return self;
}

#pragma mark - Custom Methods

// method to trigger which button action

-(void)buttonClickedWithButton:(UIButton *)sender{
    [_delegate alert:self ButtonclickedAtIndex:sender.tag];
    if(sender.tag == 0){
        [_delegate alert:self]; // ok Button clicked
    }
    [UIView animateWithDuration:0.2
                     animations:^{self.alpha = 0.0;}
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}

// method to trigger button action - single button

-(void)buttonClicked:(UIButton *)sender{
    [_delegate alert:self ButtonclickedAtIndex:sender.tag];
    [UIView animateWithDuration:0.2
                     animations:^{self.alpha = 0.0;}
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}

-(void)showAlert{
    self.alpha = 0;
    [self addAndbindViewWithContraints];
    [UIView animateWithDuration:0.2
                     animations:^{self.alpha = 1.0;}
                     completion:nil];
}

-(void)addAndbindViewWithContraints{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.8];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    NSLayoutConstraint *contstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeTop  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeRight  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
    contstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeLeft  multiplier:1 constant:0.0];
    [window addConstraint:contstraint];
    
}

@end
