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
#import "FlyInAnimationManager.h"

@interface ViewController ()

@property (nonatomic, strong) FlyInAnimationManager *manager;

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
//    FlyInView *flyInView = [[FlyInView alloc] initWithFrame:CGRectMake(-300, 137, 300, 44)];
//    
//    FlyInViewModel *model = [[FlyInViewModel alloc] init];
//    model.avatarString = @"avatar";
//    model.showString = @"New Arrival!!!";
//    model.modelType = FlyInTypeFollow;
//    
//    [flyInView loadModel:model];
//    
//    [self.view addSubview:flyInView];
//    [flyInView startWithBaseNumber:10];
    static int i = 0;
    switch (i%5) {
        case 0: {
            [self.manager showWithAvatar:@"avatar" type:FlyInTypeFollow number:10 baseNumber:5 identifier:@"1"];
        }
            break;
        case 1: {
            [self.manager showWithAvatar:@"avatar" type:FlyInTypeLike number:1000 baseNumber:0 identifier:@"2"];
        }
            break;
        case 2: {
            [self.manager showWithAvatar:@"avatar" type:FlyInTypeView number:600 baseNumber:400 identifier:@"3"];
        }
            break;
        case 3: {
            [self.manager showWithAvatar:@"avatar" type:FlyInTypeView number:200 baseNumber:150 identifier:@"4"];
        }
            break;
        default:
            [self.manager showWithAvatar:@"avatar" type:FlyInTypeComment number:100 baseNumber:5 identifier:@"5"];
            break;
    }
//    [self.manager showWithAvatar:@"avatar" type:FlyInTypeFollow number:900 baseNumber:100 identifier:@"1"];
    i++;
}

#pragma mark - Getter
- (FlyInAnimationManager *)manager {
    if(!_manager) {
        _manager = [[FlyInAnimationManager alloc] initWithAssociatedView:self.view];
    }
    return _manager;
}

@end
