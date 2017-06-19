//
//  CustomViewClass.m
//  Task_6_LabelsInCustomView
//
//  Created by Aleena joseph on 16/06/17.
//  Copyright © 2017 Aleena joseph. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self Initializations];//Calling the initialization function
    }
    return self;
}


#pragma  mark- Custom methods
-(void)Initializations{
    //This function is used to implement initializations
    _customArray = [[NSMutableArray alloc]init];
}

//This function is the first executing function
-(void)createLabelInView:(UIView *)view with:(NSMutableArray *)array fortext:(NSString *)text{
    NSDictionary *attributes = @{NSFontAttributeName:  [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0]};
    //This function is used to remove the text whose size is greater than views size
    if([text sizeWithAttributes:attributes].width < (view.frame.size.width) ){
        [_customArray addObject:text];
        [self createLabelForText:view with:_customArray];
    }
}

//This function is the  second executing one and to create labels for texts in view
-(void)createLabelForText:(UIView *)view with:(NSMutableArray *)array{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0]};
    //This function is used to remove the label subviews from the view
    for(UIView*tempLabel in view.subviews){
        [tempLabel removeFromSuperview];
    }
    if(array.count> 0){
        x = 2;//Initializing the horizontal spacing
        y = 10;//Initializing the vertical spacing
        for(int i=0; i<array.count; i++){
            float k =[array[i] sizeWithAttributes:attributes].width;
            label = [[UILabel alloc]initWithFrame:CGRectMake(x,y,k+25.0,20.0)];//drawing a label for the text
            label.font =[UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];//setting label font as textfield font
            label.tag = i;
            label.userInteractionEnabled = YES;
            label.layer.cornerRadius=3.0;
            label.clipsToBounds=YES;
            label.backgroundColor = [UIColor redColor];
            label.lineBreakMode = NSLineBreakByWordWrapping;
            label.text = array[i];
            deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(label.frame.size.width-20, 0, 20, 20)];//drawing a delete button at the end of label
            deleteButton.backgroundColor = [UIColor greenColor];
            [deleteButton addTarget:self action:@selector(deleteAction:with:) forControlEvents:UIControlEventTouchUpInside];
            [deleteButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
            deleteButton.userInteractionEnabled = YES;
            deleteButton.clipsToBounds = YES;
            [label addSubview:deleteButton];//Adding button as a subview of label
        
            x = x +5+ label.frame.size.width;//Calculating the horizontal spacing to the next label
            
            //This function is used to check that the label size is more than view size or not
            if((x)>(view.frame.size.width)){
                x= 2;
                [ label setFrame:CGRectMake(x,y+[array[i] sizeWithAttributes:attributes].height+10,[array[i] sizeWithAttributes:attributes].width+25,20)];//Setting the label frame to new positon
                label.tag = i;
                label.text = array[i];
                x = x+ 5 + label.frame.size.width;//Calculating the horizontal spacing to the next label
                y = y +10 + [array[i] sizeWithAttributes:attributes].height;//Calculating the vertical spacing to the next label
            }
            
            if(y+20 > view.frame.size.height){
                [array removeLastObject];
                [label removeFromSuperview];
            }else{
               [view addSubview:label];
            }
        }
    }
}

//This function is used to execute button action
-(void)deleteAction:(UIButton *)sender with:(NSMutableArray *)array{
    array =_customArray;
    UILabel *tempLabel = [[UILabel alloc]init];
    tempLabel = (UILabel *)sender.superview;
    NSUInteger j = tempLabel.tag;//storing the tag value of the label to be deleted
    [array removeObjectAtIndex:j];//removing the label from array
    UIView *tempView = tempLabel.superview;
    [self createLabelForText:tempView with:array];
    [self.delegate returnTheArray:array];//Calling the custom delegate method
}

@end
