//
//  CustomView.m
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "CustomAlertVC.h"

@implementation CustomAlertVC{
    UITextField *txtActionName;
    UITextField *txtInCharge;
    UITextField *txtRevisionDate;
    UIButton *btnCalender;
    UIPickerView *customPickerView;
    UIDatePicker* picker;
    NSArray *arrPickerElements;
    BOOL isHidden;
    BOOL isClicked;
    NSLayoutConstraint *layoutConstraint;
}


// Custom view with single button

-(id)initWithArray:(NSArray *)comboArray andCancelButtonTitle:(NSString *)cTitle {
    
    self = [super init];
    if (self) {
        arrPickerElements = [[NSArray alloc]initWithArray:comboArray];
        NSLog(@"%@",arrPickerElements);
        customPickerView = [[UIPickerView alloc]init];
        customPickerView.hidden = NO;
        customPickerView.delegate = self;
        customPickerView.dataSource = self;
        
        isHidden = true;
        isClicked = true;
        UILabel *lblTitle = [[UILabel alloc]init];
        lblTitle.text = @"More Actions";
        UIImage *imgBtn = [UIImage imageNamed:@"close"];
        UIButton *btnClose = [[UIButton alloc]init];
        [btnClose setImage:imgBtn forState:UIControlStateNormal];
        btnClose.backgroundColor = [UIColor whiteColor];
        
        UIView *seperatorView = [[UIView alloc]init];
        seperatorView.backgroundColor = [UIColor whiteColor];

        UILabel *lblActionName = [[UILabel alloc]init];
        lblActionName.text = @"Action Name";
        
        txtActionName = [[UITextField alloc]init];
        txtActionName.delegate = self;
        [txtActionName setTag:0];
        txtActionName.returnKeyType = UIReturnKeyNext;
        
        UILabel *lblInCharge = [[UILabel alloc]init];
        lblInCharge.text = @"In Charge";
        
        txtInCharge = [[UITextField alloc]init];
        txtInCharge.delegate = self;
        [txtInCharge setTag:1];
        txtInCharge.returnKeyType = UIReturnKeyNext;
        txtInCharge.inputView = customPickerView;
        
        // creating toolbar for picker view
        UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [toolBar setBackgroundColor:[UIColor grayColor]];
        [toolBar setTintColor:[UIColor blackColor]];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissPickerView)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissPickerView)];
        toolBar.items = [NSArray arrayWithObjects:cancelButton, flexibleSpace , doneButton , nil];
        txtInCharge.inputAccessoryView = toolBar;
        
        UIImageView *imgViewDropDownArrow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
        imgViewDropDownArrow.image = [UIImage imageNamed:@"drop down"];
        txtInCharge.rightView = imgViewDropDownArrow;
        txtInCharge.rightViewMode = UITextFieldViewModeUnlessEditing;
        
        UILabel *lblRevisionDate = [[UILabel alloc]init];
        lblRevisionDate.text = @"Revision Date";
        
        txtRevisionDate = [[UITextField alloc]init];
        txtRevisionDate.delegate = self;
        txtRevisionDate.enabled = NO;
        [txtRevisionDate setTag:2];
        txtRevisionDate.returnKeyType = UIReturnKeyDone;
        
        UIImage *imgBtnCalender = [UIImage imageNamed:@"calender"];
        btnCalender = [[UIButton alloc]init];
        [btnCalender setImage:imgBtnCalender forState:UIControlStateNormal];
        
        UIButton *btn = [[UIButton alloc] init];
        
        [self addSubview:lblTitle];
        [self addSubview:btnClose];
        [self addSubview:seperatorView];
        [self addSubview:lblActionName];
        [self addSubview:txtActionName];
        [self addSubview:lblInCharge];
        [self addSubview:txtInCharge];
        [self addSubview:lblRevisionDate];
        [self addSubview:btnCalender];
        [self addSubview:txtRevisionDate];
        [self addSubview:btn];
        
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.font = [UIFont fontWithName:@"Baskerville-Bold" size:25];
        lblTitle.textColor = [UIColor whiteColor];
        
        lblActionName.textAlignment = NSTextAlignmentLeft;
        lblActionName.font = [UIFont fontWithName:@"HoeflerText-Black" size:18];
        lblActionName.textColor = [UIColor whiteColor];

        txtActionName.backgroundColor = [UIColor whiteColor];
        txtActionName.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:15];
        txtActionName.textColor = [UIColor blackColor];
        
        lblInCharge.textAlignment = NSTextAlignmentLeft;
        lblInCharge.font = [UIFont fontWithName:@"HoeflerText-Black" size:18];
        lblInCharge.textColor = [UIColor whiteColor];
        
        txtInCharge.backgroundColor = [UIColor whiteColor];
        txtInCharge.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:15];
        txtInCharge.textColor = [UIColor blackColor];
        
        lblRevisionDate.textAlignment = NSTextAlignmentLeft;
        lblRevisionDate.font = [UIFont fontWithName:@"HoeflerText-Black" size:18];
        lblRevisionDate.textColor = [UIColor whiteColor];
        
        txtRevisionDate.backgroundColor = [UIColor whiteColor];
        txtRevisionDate.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:15];
        txtRevisionDate.textColor = [UIColor blackColor];
        
        [lblTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btnClose setTranslatesAutoresizingMaskIntoConstraints:NO];
        [seperatorView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [lblActionName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [txtActionName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [lblInCharge setTranslatesAutoresizingMaskIntoConstraints:NO];
        [txtInCharge setTranslatesAutoresizingMaskIntoConstraints:NO];
        [lblRevisionDate setTranslatesAutoresizingMaskIntoConstraints:NO];
        [txtRevisionDate setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btnCalender setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        // constraints for More action
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:200.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240.0];
        [self addConstraint:layoutConstraint];
       
        // constraints for close button
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnClose attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblActionName attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnClose attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnClose attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnClose attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblTitle attribute:NSLayoutAttributeTop multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];

        //constraints for seperator view
        layoutConstraint = [NSLayoutConstraint constraintWithItem:seperatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:seperatorView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblTitle attribute:NSLayoutAttributeBottom multiplier:1 constant:10.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:seperatorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:350.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:seperatorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:2.0];
        [self addConstraint:layoutConstraint];
        
        //constraints for lblActionName
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblActionName attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:txtActionName attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblActionName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblActionName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:seperatorView attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblActionName attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:txtActionName attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];

        //constarints for txtActionName
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtActionName attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblInCharge attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtActionName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtActionName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblActionName attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtActionName attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblInCharge attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        
        //constarints for lblIncharge
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblInCharge attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:txtInCharge attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblInCharge attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblInCharge attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:txtActionName attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblInCharge attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:txtInCharge attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];

        //constarints for txtIncharge
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtInCharge attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lblRevisionDate attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtInCharge attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtInCharge attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblInCharge attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtInCharge attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:lblRevisionDate attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        
        //constraints for lblRevisionDate
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblRevisionDate attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:txtRevisionDate attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblRevisionDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblRevisionDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:txtInCharge attribute:NSLayoutAttributeBottom multiplier:1 constant:8.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:lblRevisionDate attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btnCalender attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        
        //constraints for txtRevisionDate
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtRevisionDate attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeLeading multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtRevisionDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtRevisionDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:txtRevisionDate attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblRevisionDate attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        
        // constraints for calender button
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnCalender attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeTrailing multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnCalender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnCalender attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btnCalender attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:lblRevisionDate attribute:NSLayoutAttributeBottom multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];

        // constraints for save/update button
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:280.0];
        [self addConstraint:layoutConstraint];
        layoutConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:txtRevisionDate attribute:NSLayoutAttributeBottom multiplier:1 constant:10.0];
        [self addConstraint:layoutConstraint];
                
        btn.backgroundColor = [UIColor grayColor];
        btn.titleLabel.font = [UIFont fontWithName:@"Baskerville-Bold" size:20];
        [btn setTitle:cTitle forState:UIControlStateNormal];
        btn.tag = 0;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        btnClose.tag = 0;
        
        // button actions
        [btnClose addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btnCalender addTarget:self action:@selector(calenderClicked:) forControlEvents:UIControlEventTouchUpInside];

        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    }
    return self;
}

#pragma mark - Custom Methods

// method to trigger button action

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
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeTop  multiplier:1 constant:0.0];
    [window addConstraint:layoutConstraint];
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeRight  multiplier:1 constant:0.0];
    [window addConstraint:layoutConstraint];
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom  multiplier:1 constant:0.0];
    [window addConstraint:layoutConstraint];
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeLeft  multiplier:1 constant:0.0];
    [window addConstraint:layoutConstraint];
    
}

-(void)calenderClicked:(UIButton *)sender{
    picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(50, 500, 320, 216)];
    picker.datePickerMode = UIDatePickerModeDate;
    [picker setMinimumDate:[NSDate date]];
    [picker setValue:[UIColor whiteColor] forKey:@"textColor"];
    [picker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventAllEvents];
    [self addSubview:picker];
    [btnCalender setUserInteractionEnabled:NO];
}

-(void)updateTextField:(id)sender{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSDate *eventDate = picker.date;
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    txtRevisionDate.text = [dateFormatter stringFromDate:eventDate];
    [picker removeFromSuperview];
    [btnCalender setUserInteractionEnabled:YES];
}

- (void)dismissPickerView{
    if(isHidden){
        customPickerView.hidden = NO;
        isHidden = false;
    }
    [txtInCharge resignFirstResponder];
}


#pragma mark - Text Field delegate method

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSInteger tag = textField.tag + 1;
    if(textField.returnKeyType == UIReturnKeyDone){
        [textField resignFirstResponder];
        return YES;
    }else{
        UITextField *txtCurrent = (UITextField *)[self viewWithTag:tag];
        [txtCurrent becomeFirstResponder];
    }
    return NO;
}

#pragma mark - Picker view delegate methods

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return arrPickerElements.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return arrPickerElements[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    txtInCharge.text = arrPickerElements[row];
}

@end
