//
//  ViewController.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "ViewController.h"
#import "FlyInView.h"
#import "FlyInViewModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 50, 20)];
    [button addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action
- (void)didSelect:(UIButton *)sender {
    FlyInView *flyInView = [[FlyInView alloc] initWithFrame:CGRectMake(-300, 137, 300, 44)];
    
    FlyInViewModel *model = [[FlyInViewModel alloc] init];
    model.avatarString = @"avatar";
    model.showString = @"New Arrival!!!";
    model.modelType = FlyInTypeFollow;
    
    [flyInView loadModel:model];
    
    [self.view addSubview:flyInView];
    [flyInView start];
}

@end
