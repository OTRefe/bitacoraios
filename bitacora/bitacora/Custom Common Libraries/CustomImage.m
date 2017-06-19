//
//  CustomImage.m
//  taskProfile
//
//  Created by Aleena joseph on 13/06/17.
//  Copyright © 2017 Aleena joseph. All rights reserved.
//

#import "CustomImage.h"

@implementation CustomImage

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self makeRoundedImage];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self makeRoundedImage];
}

#pragma mark - Custom method
-(void)makeRoundedImage{
    self.layer.cornerRadius = self.layer.frame.size.height/2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [[UIColor redColor]CGColor];
    self.layer.borderWidth = 2;
}

    
@end
