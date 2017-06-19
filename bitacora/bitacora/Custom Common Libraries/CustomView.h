//
//  CustomViewClass.h
//  Task_6_LabelsInCustomView
//
//  Created by Aleena joseph on 16/06/17.
//  Copyright © 2017 Aleena joseph. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomView;
@protocol DelegateProtocol <NSObject>
-(void)returnTheArray:(NSMutableArray *)array;
@end


@interface CustomView : UIView{
    int x;
    int y;
    UILabel *label ;
    UIButton *deleteButton;
}

@property(strong,nonatomic)id<DelegateProtocol>delegate;
@property(nonatomic,strong)NSMutableArray *customArray;

-(void)createLabelInView:(UIView *)view with:(NSMutableArray *)array fortext:(NSString *)text;
-(void)createLabelForText :(UIView *)view with:(NSMutableArray *)array ;
-(void)deleteAction:(UIButton *)sender with:(NSMutableArray *)array;



@end
