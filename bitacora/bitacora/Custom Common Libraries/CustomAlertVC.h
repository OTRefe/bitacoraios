//
//  CustomView.h
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomAlertVC;

@protocol AlertActions <NSObject>

-(void)alert:(CustomAlertVC *)alert ButtonclickedAtIndex:(NSInteger)index;

@end


@interface CustomAlertVC : UIView <UIPickerViewDelegate, UIPickerViewDataSource,  UITextFieldDelegate>
    
@property(nonatomic,weak) id<AlertActions> delegate;
    
-(id)initWithArray:(NSArray *)comboArray andCancelButtonTitle:(NSString *)cTitle;
    
-(void)showAlert;


@end
