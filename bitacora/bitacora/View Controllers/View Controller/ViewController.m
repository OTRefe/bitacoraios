//
//  ViewController.m
//  bitacora
//
//  Created by Ann Mac on 19/06/17.
//  Copyright © 2017 MACMINI 2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    // picker view elements
    CustomAlertVC *alert=[[CustomAlertVC alloc]initWithArray:[NSArray arrayWithObjects:@"", nil] andCancelButtonTitle:@""];
    alert.delegate=self;
    alert.tag=102;
    [alert showAlert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method

// Custom delegate method
-(void)alert:(CustomAlertVC *)alert ButtonclickedAtIndex:(NSInteger)index{
    NSLog(@"Aler with tag = %ld and clicked button at %ld",(long)alert.tag,(long)index);
}

@end
