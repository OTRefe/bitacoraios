//
//  CustomView.h
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomAlertView;

@protocol CustomAlertViewDelegate <NSObject>

-(void)alert:(CustomAlertView *)alert ButtonclickedAtIndex:(NSInteger)index;
-(void)alert:(CustomAlertView *)alert;

@end


@interface CustomAlertView : UIView
    
@property(nonatomic,weak) id<CustomAlertViewDelegate> delegate;
    
-(id)initWithMessage:(NSString *)message andLeftButtonTitle:(NSString *)lTitle andRightButtonTitle:(NSString *)rTitle;
    
-(id)initWithMessage:(NSString *)message andCancelButtonTitle:(NSString *)cTitle;
    
-(void)showAlert;


@end
